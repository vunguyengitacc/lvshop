package javaweb.controller.Admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javaweb.Entity.Trademark;
import javaweb.controller.session.UserSession;
import javaweb.services.inter.Account;
import javaweb.services.inter.Bill;
import javaweb.services.inter.BillHasProductHasSize;
import javaweb.services.inter.Product;
import javaweb.services.inter.Size;
import javaweb.services.inter.TradeMark;

@RestController
@RequestMapping(value = "admin/api", produces = "text/plain;charset=UTF-8")
public class RestAdminController {
	@Autowired
	Account acc;
	@Autowired
	Size size;
	@Autowired
	TradeMark trade;
	@Autowired
	Product pro;
	@Autowired
	javaweb.services.inter.ProductHasSize pro_size;	
	@Autowired
	Bill bill;
	@Autowired
	BillHasProductHasSize pro_col_bill;

	@PutMapping("/tai-khoan/khoa")
	@ResponseBody
	public String updateAccountStatus(Model model, HttpSession session, @RequestParam("username") String username) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		if (username == "")
			return "{ \"status\": 2}";// cap nhat khong thanh cong
		if (acc.putNewStatus(username) == true)
			return "{ \"status\": 1}";// cap nhat thanh cong
		else
			return "{ \"status\": 2}";// cap nhat khong thanh cong
	}

	@PostMapping(value = "/san-pham/size")
	@ResponseBody
	public String addColor(Model model, HttpSession session, @RequestParam("tenSizeMoi") String newSizeName,
			@RequestParam("idSanPham") String idProduct) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null) // 1
			return "{ \"status\": 3}";// chưa đăng nhập  //2
		int idProductInt = 0; 
		try {
			idProductInt = Integer.parseInt(idProduct);
		}
		catch (Exception e) {
			return "{ \"status\": 2}";// cap nhat khong thanh cong
		}
		if (newSizeName == "") //3
			return "{ \"status\": 2}";// cap nhat khong thanh cong   //4
		javaweb.Entity.Size newSize = size.postNew(newSizeName);
		boolean rsPro_Size = pro_size.postNew(idProductInt, newSize.getId(), 0);
		if (newSize != null && rsPro_Size) { //5
			ObjectMapper mapper = new ObjectMapper();  //6
			try {
				String rs = mapper.writeValueAsString(newSize);
				return rs;// Cập nhật thành công
			} catch (JsonProcessingException e) {
				e.printStackTrace();
				return "{ \"status\": 1}";// cap nhat thanh cong
			}
		} else
			return "{ \"status\": 2}";// cap nhat khong thanh cong   ///7
	}

	@PostMapping(value = "/thuong-hieu")
	@ResponseBody
	public String addTrademark(Model model, HttpSession session,
			@RequestParam("tenThuongHieuMoi") String newTradeName) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)  
			return "{ \"status\": 3}";// chua dang nhap   
		if (newTradeName == "")  
			return "{ \"status\": 2}";// cap nhat khong thanh cong  
		Trademark newTrade = trade.postNew(newTradeName);   
		if (newTrade != null) {   
			ObjectMapper mapper = new ObjectMapper();    
			try {
				String rs = mapper.writeValueAsString(newTrade);
				return rs;// cap nhat thanh cong
			} catch (JsonProcessingException e) {
				e.printStackTrace();
				return "{ \"status\": 1}";// cap nhat thanh cong
			} 
		} else  
			return "{ \"status\": 2}";// cap nhat khong thanh cong  
	}





	@DeleteMapping("/san-pham")
	@ResponseBody
	public String deleteProduct(Model model, HttpSession session, @RequestParam("idSanPham") int id) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)  //1
			return "{ \"status\": 3}";// chua dang nhap   //2
		try { 
			if (pro_size.deleteMany(id) == true) {  //3
				if (pro.deleteByID(id) == true) { //4
					return "{ \"status\": 1}";// cap nhat thanh cong  //5
				} else
					return "{ \"status\": 2}";//cập nhật thất bại   //6
			} else
				return "{ \"status\": 2}";//cập nhật thất bại  //7
		} catch (Exception e) {
			e.printStackTrace();
			return "{ \"status\": 4}";// lỗi
		}

	}

	
	@PutMapping("/hoa-don")
	@ResponseBody
	public String updateBill(Model model, HttpSession session, @RequestParam("idHoaDon") int id) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chưa đăng nhập
		try {
			boolean rs = bill.putStatusByID(id);
			if (rs)
				return "{ \"status\": 1}";// thành công
			else
				return "{ \"status\": 2}";// thất bại
		} catch (Exception e) {
			e.printStackTrace();
			return "{ \"status\": 4}";// Lỗi truy vấn
		}

	}

	@DeleteMapping("/hoa-don")
	@ResponseBody
	public String deleteBill(Model model, HttpSession session, @RequestParam("idHoaDon") int id) {
		UserSession userSs = (UserSession) session.getAttribute("UserSession");
		if (userSs == null)
			return "{ \"status\": 3}";// chua dang nhap
		try {
			boolean rsBillDetail = pro_col_bill.deleteByBillId(id);
			boolean rsBill = bill.deleteByID(id);
			if (rsBillDetail && rsBill)
				return "{ \"status\": 1}";// thành công
			else
				return "{ \"status\": 2}";// thất bại
		} catch (Exception e) {
			e.printStackTrace();
			return "{ \"status\": 4}";// Lỗi truy vấn
		}

	}

}
