package javaweb.controller.Home;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import javaweb.controller.session.Cart;
import javaweb.controller.session.CartItem;
import javaweb.controller.session.UserSession;
import javaweb.services.inter.Account;
import javaweb.services.inter.Comment;
import javaweb.services.inter.Commune;
import javaweb.services.inter.Product;
import javaweb.services.inter.ProductHasSize;
import javaweb.services.inter.Size;
import javaweb.services.inter.TradeMark;
import javaweb.services.inter.Ward;

@Controller
@RestController
@RequestMapping(value = "/trang-chu/api", produces = "text/plain;charset=UTF-8")
public class RestHomeController {

	@Autowired
	Product pro;
	@Autowired
	TradeMark trade;
	@Autowired
	Comment cmt;
	@Autowired
	Size size;
	@Autowired
	Account acc;
	@Autowired
	Ward ward;
	@Autowired
	Commune commune;

	@PutMapping("/gio-hang")
	@ResponseBody
	public String updateCart(HttpSession session, @RequestParam("idSanPham") int id,
			@RequestParam("soLuong") int amount, @RequestParam("idSize") int idSize,
			@RequestParam("thayDoiSoLuong") int newAmount) {
		// amount: khi người dùng muốn thêm sản phẩm với mục đích cộng dồn vào giỏ hàng
		// nếu đã tồn tại
		// newAmount: thay giá trị số lượng bằng một giá trị newAmount mới
		CartItem item = new CartItem();
		Cart lst = (Cart) session.getAttribute("cart");
		ProductHasSize detail = new javaweb.services.imple.ProductHasSize();
		item.setSize(size.getByID(idSize));
		item.setPro(pro.getByID(id, true));
		int maxAmount = detail.getAmount(item.getPro().getId(), item.getSize().getId());// lấy số lượng sản phẩm
		if(newAmount < 0) //1
			return "{ \"status \" : 2 }";// status 2: không đủ hàng  //2
		if (maxAmount < amount || maxAmount < newAmount) // 3,4
			return "{ \"status \" : 2 }";// status 2: không đủ hàng    //5
		if (newAmount == 0)// do chỉ chấp nhận 1 trong 2 giá trị amount hoặc newAmount và ưu tiên amount   //6
		{
			item.setAmount(amount);//7
		} else {
			item.setAmount(newAmount);//8
		}
		BigDecimal amountDecimal = new BigDecimal(item.getAmount());
		if (item.getPro().getPromotionPrice().compareTo(BigDecimal.ZERO) == 0) {  //9
			String value = item.getPro().getPrice().multiply(amountDecimal).toString();  //10
			item.setValue(value);
		} else {
			String value = item.getPro().getPromotionPrice().multiply(amountDecimal).toString();  //11
			item.setValue(value);
		}
		String newItemValue = null;// tra ve gia tri moi cho vat pham trong gio hang trong truong hop can cap nhat
		if (lst == null) {  //12
			lst = new Cart(item, item.getValue());  //13
		} else {
			List<CartItem> stLst = lst.getLstItem().stream().filter(
					x -> x.getPro().getId() == item.getPro().getId() && x.getSize().getId() == item.getSize().getId())
					.collect(Collectors.toList());
			if (stLst.size() > 0) {   //14 	
				CartItem stItem = stLst.get(0);
				lst.removeItem(stItem);
				if (newAmount != 0)  //15
					stItem.setAmount(newAmount);//16
				else
					stItem.addAmount(item.getAmount());  //17
				stItem.refreshValue();
				newItemValue = stItem.getValue().toString();
				lst.addLstItem(stItem, stItem.getValue());
			} else
				lst.addLstItem(item, item.getValue());//18
		}
		session.setAttribute("cart", lst);
		return "{\"totalItem\": " + lst.getLstItem().size() + ", \"totalValue\": " + lst.getTotalValue().setScale(2)
				+ ", \"newItemValue\": " + newItemValue + ", \"status \" : 1}";  //19
	}

	@DeleteMapping("/gio-hang/item")
	@ResponseBody
	public String deleteItemCart(HttpSession session, @RequestParam("idSanPham") int id,
			@RequestParam("idSize") int idSize) {

		CartItem item = new CartItem();
		Cart lst = (Cart) session.getAttribute("cart");
		item.setSize(size.getByID(idSize));
		item.setPro(pro.getByID(id, true));
		int result = 0;
		if (lst == null) {
			result = 2;
		} else {
			List<CartItem> stLst = lst.getLstItem().stream().filter(
					x -> x.getPro().getId() == item.getPro().getId() && x.getSize().getId() == item.getSize().getId())
					.collect(Collectors.toList());
			if (stLst.size() > 0) {
				CartItem stItem = stLst.get(0);
				lst.removeItem(stItem);
				result = 1;
			} else
				result = 2;
		}
		session.setAttribute("cart", lst);
		return "{\"totalValue\": " + lst.getTotalValue().setScale(2) + ", \"resultDelete\": " + result
				+ ", \"totalItem\": " + lst.getLstItem().size() + "}";
	}

	@PutMapping("/tai-khoan/cap-nhat-thong-tin")
	@ResponseBody
	public String updateAccountDetail(Model model, HttpSession session, @RequestParam("tenHienThi") String name,
			@RequestParam("email") String email, @RequestParam("gioiTinh") int gender,
			@RequestParam("soDienThoai") String phone) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null) //1
			return "{ \"status\": 3}";// chưa đăng nhập //2 
		if (userSs.getAccInfor().getStatus() == 0) { //3
			session.setAttribute("UserSession", null);//4
			return "{ \"status\": 4}";// tài khoản bị admin khoá trong lúc đăng nhập
		}
		javaweb.Entity.Account testEmail = acc.findByEmail(email);
		if (testEmail != null && !testEmail.getUsername().equals(userSs.getAccInfor().getUsername())) //5
			return "{ \"status\": 5}";// cập nhật thất bại	//6
		if (name == "" && email == "" && phone == "")//7
			return "{ \"status\": 2}";// cập nhật thất bại//8
		if (acc.putAccountInfor(userSs.getAccInfor().getUsername(), name, email, phone, gender) == true) {//9
			userSs.setAccInfor(acc.getByUsername(userSs.getAccInfor().getUsername(), false));//10
			session.setAttribute("UserSession", userSs);// cập nhật lại account trong session
			return "{ \"status\": 1}";// cập nhật thành công
		} else
			return "{ \"status\": 2}";//11
		//12 là kết thúc
	}

	@PutMapping("/tai-khoan/doi-mat-khau")
	@ResponseBody
	public String updateAccountPassword(Model model, HttpSession session, @RequestParam("matKhauMoi") String newPass,
			@RequestParam("matKhauCu") String oldPass) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		if (userSs.getAccInfor().getStatus() == 0) {
			session.setAttribute("UserSession", null);
			return "{ \"status\": 4}";// tai khoan bi khoa trong luc dang dang nhap
		}
		if (newPass == "")
			return "{ \"status\": 2}";// cap nhat khong thanh cong
		if (!userSs.getAccInfor().getPassword().equals(oldPass))
			return "{ \"status\": 5}";// Sai mat khau
		if (acc.putNewPass(userSs.getAccInfor().getUsername(), newPass) == true) {
			session.invalidate();// cap nhat thanh cong can dang nhap lai
			return "{ \"status\": 1}";// cap nhat thanh cong
		} else
			return "{ \"status\": 2}";// cap nhat khong thanh cong
	}

	@GetMapping(value = "/huyen")
	@ResponseBody
	public String loadWard(@RequestParam("idTinh") int districtID) {
		List<javaweb.Entity.Ward> lstRs = ward.getByDistrictID(districtID);
		if (lstRs != null) {
			try {
				ObjectMapper mapper = new ObjectMapper();
				String resp = mapper.writeValueAsString(lstRs).toString();
				return resp;
			} catch (Exception e) {
				e.printStackTrace();
				return "{ \"message\": \"failed\"}";
			}
		}
		return "{ \"message\": \"null\"}";
	}

	@GetMapping(value = "/xa")
	@ResponseBody
	public String loadCommune(@RequestParam("idHuyen") int wardID) {
		List<javaweb.Entity.Commune> lstRs = commune.getByWardID(wardID);
		if (lstRs != null) {
			try {
				ObjectMapper mapper = new ObjectMapper();
				String resp = mapper.writeValueAsString(lstRs).toString();
				return resp;
			} catch (Exception e) {
				e.printStackTrace();
				return "{ \"message\": \"failed\"}";
			}
		}
		return "{ \"message\": \"null\"}";
	}
}
