package javaweb.controller.Admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javaweb.controller.session.UserSession;
import javaweb.services.inter.Account;
import javaweb.services.inter.Bill;
import javaweb.services.inter.Comment;
import javaweb.services.inter.Product;
import javaweb.services.inter.ProductHasSize;
import javaweb.services.inter.Size;
import javaweb.services.inter.TradeMark;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	Account acc;
	@Autowired
	Product pro;
	@Autowired
	TradeMark trade;
	@Autowired
	Size size;
	@Autowired
	Bill bill;
	@Autowired
	ProductHasSize pro_size;
	@Autowired
	Comment comment;

	public boolean checkAdminSession(HttpSession session) {
		UserSession userSS = (UserSession) session.getAttribute("UserSession");
		if (userSS == null)
			return false;
		if (userSS.getAccInfor().getType() != 0)
			return false;
		return true;
	}

	@SuppressWarnings("deprecation")
	@GetMapping("/danh-sach-tai-khoan")
	public String lstAccountPage(Model model, HttpSession session) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";
		List<javaweb.Entity.Bill> lstOrder = bill.getAllFetch();
		List<javaweb.Entity.Bill> lstFilter = lstOrder.stream().filter((item) -> item.getStatus() == 1)
				.collect(Collectors.toList());
		model.addAttribute("watingOrderAmount", lstFilter.size());
		Date currentDate = new Date();
		lstFilter = lstFilter.stream().filter((item) -> item.getCreateDate().getMonth() == currentDate.getMonth()
				&& item.getCreateDate().getDate() == currentDate.getDate()).collect(Collectors.toList());
		model.addAttribute("watingOrderAmountToday", lstFilter.size());
		List<javaweb.Entity.Account> lstAcc = acc.getAllFetch("bills");
		lstAcc = lstAcc.stream().filter((item) -> item.getType() != 0).collect(Collectors.toList());
		model.addAttribute("lstAccount", lstAcc);
		return "admin/ListAccountManager";
	}

	@GetMapping("/log-out")
	public String logoutHandler(HttpSession session) {
		session.setAttribute("UserSession", null);
		session.setAttribute("cart", null);
		return "redirect:/trang-chu/";
	}

	@SuppressWarnings("deprecation")
	@GetMapping("/danh-sach-san-pham")
	public String lstProductPage(Model model, HttpSession session) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";
		model.addAttribute("lstProduct", pro.getAll());
		List<javaweb.Entity.Bill> lstOrder = bill.getAllFetch();
		List<javaweb.Entity.Bill> lstFilter = lstOrder.stream().filter((item) -> item.getStatus() == 1)
				.collect(Collectors.toList());
		model.addAttribute("watingOrderAmount", lstFilter.size());
		Date currentDate = new Date();
		lstFilter = lstFilter.stream().filter((item) -> item.getCreateDate().getMonth() == currentDate.getMonth()
				&& item.getCreateDate().getDate() == currentDate.getDate()).collect(Collectors.toList());
		model.addAttribute("watingOrderAmountToday", lstFilter.size());
		return "admin/ListProductManager";
	}

	@SuppressWarnings("deprecation")
	@GetMapping("/danh-sach-san-pham/chi-tiet-san-pham")
	public String productDetails(Model model, HttpSession session, @RequestParam("idSanPham") int idProduct) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";
		List<javaweb.Entity.Bill> lstOrder = bill.getAllFetch();
		List<javaweb.Entity.Bill> lstFilter = lstOrder.stream().filter((item) -> item.getStatus() == 1)
				.collect(Collectors.toList());
		model.addAttribute("watingOrderAmount", lstFilter.size());
		Date currentDate = new Date();
		lstFilter = lstFilter.stream().filter((item) -> item.getCreateDate().getMonth() == currentDate.getMonth()
				&& item.getCreateDate().getDate() == currentDate.getDate()).collect(Collectors.toList());
		model.addAttribute("watingOrderAmountToday", lstFilter.size());
		javaweb.Entity.Product rs = pro.getByID(idProduct, false);
		model.addAttribute("productDetail", rs);
		if (rs != null)
			model.addAttribute("lstTrademark", trade.getAll().stream()
					.filter((item) -> item.getId() != rs.getTrademark().getId()).collect(Collectors.toList()));
		else
			model.addAttribute("lstTrademark", trade.getAll());
		return "admin/ProductManager";
	}

	@SuppressWarnings("deprecation")
	@GetMapping("/danh-sach-hoa-don")
	public String lstOrderPage(Model model, HttpSession session) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";
		List<javaweb.Entity.Bill> lstOrder = bill.getAllFetch();
		model.addAttribute("lstOrder", lstOrder);
		List<javaweb.Entity.Bill> lstFilter = lstOrder.stream().filter((item) -> item.getStatus() == 1)
				.collect(Collectors.toList());
		model.addAttribute("watingOrderAmount", lstFilter.size());
		Date currentDate = new Date();
		lstFilter = lstFilter.stream().filter((item) -> item.getCreateDate().getMonth() == currentDate.getMonth()
				&& item.getCreateDate().getDate() == currentDate.getDate()).collect(Collectors.toList());
		model.addAttribute("watingOrderAmountToday", lstFilter.size());
		return "admin/ListOrderManager";
	}

	@SuppressWarnings("deprecation")
	@GetMapping("/quan-li-chung")
	public String generalManagementPage(Model model, HttpSession session) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";
		List<javaweb.Entity.Bill> lstOrder = bill.getAllFetch();
		List<javaweb.Entity.Bill> lstFilter = lstOrder.stream().filter((item) -> item.getStatus() == 1)
				.collect(Collectors.toList());//lọc ra những hoá đơn chưa duyệt
		model.addAttribute("watingOrderAmount", lstFilter.size());
		Date currentDate = new Date();
		lstFilter = lstFilter.stream().filter((item) -> item.getCreateDate().getMonth() == currentDate.getMonth()
				&& item.getCreateDate().getDate() == currentDate.getDate()).collect(Collectors.toList());//lọc ra những hoá đơn chưa duyệt trong ngày
		model.addAttribute("watingOrderAmountToday", lstFilter.size());
		List<javaweb.Entity.Bill> lstOrderToday = lstOrder.stream()
				.filter((item) -> item.getCreateDate().getMonth() == currentDate.getMonth()
						&& item.getCreateDate().getDate() == currentDate.getDate())
				.collect(Collectors.toList());//lọc số hoá đơn trong ngày
		model.addAttribute("totalOrderToday", lstOrderToday.size());
		Optional<BigDecimal> totalEarn = lstOrderToday.stream().map((item) -> item.getTotalValue())
				.reduce(BigDecimal::add);
		model.addAttribute("totalEarnToday", totalEarn.orElse(BigDecimal.ZERO.setScale(2)));				
		List<javaweb.Entity.Account> topAcc = acc.getAllFetch("bills");

		topAcc.forEach((item) -> item.loadTotalSpend());
		List<javaweb.Entity.Account> lstTopAccValidate = topAcc.stream()
				.sorted((i1, i2) -> i2.getTotalSpend().compareTo(i1.getTotalSpend())).limit(5)
				.collect(Collectors.toList());
		model.addAttribute("lstTopAcc", lstTopAccValidate);

		List<String> lstFetch = new ArrayList<String>(
				List.of("productHasSizes", "productHasSizes.billHasProductHasSizes"));
		List<javaweb.Entity.Product> lstPro = pro.getAllFetch(lstFetch);
		lstPro.forEach((item) -> item.loadSoldQuantity());
		List<javaweb.Entity.Product> lstTopPro = lstPro.stream()
				.sorted(Comparator.comparingInt(javaweb.Entity.Product::getSoldQuantity).reversed()).limit(3)
				.collect(Collectors.toList());
		model.addAttribute("lstTopPro", lstTopPro);		
		return "admin/GeneralManager";
	}

	@SuppressWarnings("deprecation")
	@GetMapping("/danh-sach-hoa-don/{id}")
	public String billDetailPage(Model model, HttpSession session, @PathVariable("id") String id) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";
		int billId;
		try {
			billId = Integer.parseInt(id);
		} catch (Exception e) {
			return "redirect:/admin/danh-sach-hoa-don";// hoá đơn không tồn tại -> chuyền về trang danh sách hoá đơn
		}
		List<String> lstField = new ArrayList<String>(List.of("billHasProductHasSizes",
				"billHasProductHasSizes.productHasSize", "billHasProductHasSizes.productHasSize.size",
				"billHasProductHasSizes.productHasSize.product"));
		javaweb.Entity.Bill itemRs = bill.getByIdAdvance(billId, lstField);
		if (itemRs == null)
			return "redirect:/admin/danh-sach-hoa-don";// hoá đơn không tồn tại -> chuyền về trang danh sách hoá đơn
		List<javaweb.Entity.Bill> lstOrder = bill.getAllFetch();
		List<javaweb.Entity.Bill> lstFilter = lstOrder.stream().filter((item) -> item.getStatus() == 1)
				.collect(Collectors.toList());
		model.addAttribute("watingOrderAmount", lstFilter.size());
		Date currentDate = new Date();
		lstFilter = lstFilter.stream().filter((item) -> item.getCreateDate().getMonth() == currentDate.getMonth()
				&& item.getCreateDate().getDate() == currentDate.getDate()).collect(Collectors.toList());
		model.addAttribute("watingOrderAmountToday", lstFilter.size());
		model.addAttribute("billDetail", itemRs);
		return "admin/OrderManager";
	}

	@PostMapping("/danh-sach-san-pham/chi-tiet-san-pham/them")
	public String addNewProduct(Model model, HttpSession session, @RequestParam("idSanPham") String id,
			@RequestParam("tenSanPham") String name, @RequestParam("giaGoc") String originalPrice,
			@RequestParam("giaBan") String price, @RequestParam("giaKhuyenMai") String promotionPrice,
			@RequestParam("idThuongHieu") int idTrade, @RequestParam("moTa") String description,
			@RequestParam("anhMinhHoa") MultipartFile file) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";// chưa đăng nhập
		try {
			String filename = null;
			if (file.getSize() != 0) {
				ServletContext context = session.getServletContext();
				String path = context.getRealPath("/WEB-INF/webImages/");
				filename = file.getOriginalFilename();
				File uploadRootDir = new File(path);

				if (!uploadRootDir.exists()) {
					uploadRootDir.mkdirs();
				}
				byte[] content = file.getBytes();
				BufferedOutputStream writer = new BufferedOutputStream(new FileOutputStream(new File(path + filename)));
				writer.write(content);
				writer.flush();
				writer.close();
			}
			if (filename == null)
				filename = "default.png";
			if(promotionPrice.isEmpty())
				promotionPrice = new String("0");
			if(originalPrice == "" || price == "") {
				model.addAttribute("resultCode", 2);
				return "admin/Result";// thất bại
			}
			int rsPro = pro.postNew(name, new BigDecimal(originalPrice).abs(), new BigDecimal(price).abs(),
					new BigDecimal(promotionPrice).abs(), "/resources/" + filename, description, idTrade);
			if (rsPro != -1) {
				model.addAttribute("resultCode", 1);
				return "admin/Result";// thành công
			} else {
				model.addAttribute("resultCode", 2);
				return "admin/Result";// thất bại
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resultCode", 4);
			return "admin/Result";// lỗi truy xuất
		}

	}

	@PostMapping("/danh-sach-san-pham/chi-tiet-san-pham/cap-nhat")
	public String updateProduct(Model model, HttpSession session, @RequestParam("idSanPham") int id,
			@RequestParam("tenSanPham") String name, @RequestParam("giaGoc") String originalPrice,
			@RequestParam("giaBan") String price, @RequestParam("giaKhuyenMai") String promotionPrice,
			@RequestParam("soLuongSize") String amountSize, @RequestParam("idSize") int idSize,
			@RequestParam("idThuongHieu") int idTrade, @RequestParam("moTa") String description,
			@RequestParam("anhMinhHoa") MultipartFile file) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";// chưa đăng nhập
		try {
			String filename = null;
			if (file.getSize() != 0) {
				ServletContext context = session.getServletContext();
				String path = context.getRealPath("/WEB-INF/webImages/");
				filename = file.getOriginalFilename();
				File uploadRootDir = new File(path);

				if (!uploadRootDir.exists()) {
					uploadRootDir.mkdirs();
				}
				byte[] content = file.getBytes();
				BufferedOutputStream writer = new BufferedOutputStream(new FileOutputStream(new File(path + filename)));
				writer.write(content);
				writer.flush();
				writer.close();
			}
			if (filename == null)
				filename = "nochange";
			if(promotionPrice.isEmpty())
				promotionPrice = new String("0");
			if(originalPrice == "" || price == "") {
				model.addAttribute("resultCode", 2);
				return "admin/Result";// thất bại
			}
			boolean rsProduct = pro.putByID(id, name, new BigDecimal(originalPrice).abs(), new BigDecimal(price).abs(),
					new BigDecimal(promotionPrice).abs(), "/resources/" + filename, description, idTrade);
			boolean rsSize = pro_size.put(id, idSize, Math.abs(Integer.parseInt(amountSize)));
			if (rsProduct || rsSize) {
				model.addAttribute("resultCode", 1);
				return "admin/Result";// thành công
			} else {
				model.addAttribute("resultCode", 2);
				return "admin/Result";// thất bại
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resultCode", 4);
			return "admin/Result";// lỗi truy xuất
		}

	}

	@GetMapping("/binh-luan/xoa")
	public String deleteComment(Model model, HttpSession session, @RequestParam("idComment") int id) {
		if (checkAdminSession(session) == false)
			return "redirect:/trang-chu/";// chưa đăng nhập
		if (comment.putStatusComment(id) == true) {
			javaweb.Entity.Comment temp = comment.getByID(id);
			return "redirect:/trang-chu/san-pham/" + temp.getProduct().getName() + "?id=" + temp.getProduct().getId();
		} else
			return "redirect:/trang-chu/";// lỗi sai id comment
	}

}
