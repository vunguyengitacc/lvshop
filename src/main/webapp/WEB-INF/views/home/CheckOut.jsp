<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>LV Shop</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/bootstrap.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/font-awesome.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/themify-icons.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/elegant-icons.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/owl.carousel.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/nice-select.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/jquery-ui.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/slicknav.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/template/Home/css/style.css"/>" type="text/css">
</head>

<body>
	<c:if test="${sessionScope.UserSession.accInfor.type == 0 }">
		<div id="feedback">
			<a href="/lvshop/admin/quan-li-chung"><i class="fas fa-user-cog"></i>Trang
				admin</a>
		</div>
	</c:if>
	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="header-top">
			<div class="container">
				<div class="ht-left">
					<div class="mail-service">
						<i class=" fa fa-envelope"></i> lvshop@gmail.com
					</div>
					<div class="phone-service">
						<i class=" fa fa-phone"></i> 0123456789
					</div>
				</div>
				<div class="ht-right">
					<c:choose>
						<c:when test="${sessionScope.UserSession == null }">
							<a href="/lvshop/login" class="login-panel"><i
								class="fa fa-user"></i>Đăng nhập</a>
						</c:when>
						<c:otherwise>
							<a href="/lvshop/trang-chu/trang-ca-nhan" class="login-panel"><i
								class="fa fa-user"></i>${sessionScope.UserSession.accInfor.username }</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="inner-header">
				<div class="row">
					<div class="col-lg-2 col-md-2">
						<div class="logo">
							<a href="/lvshop/trang-chu/" style="font-size: 1.4rem;"> LV SHOP
							</a>
						</div>
					</div>
					<div class="col-lg-7 col-md-7">
						<div class="advanced-search">
							<button type="button" class="category-btn">Tìm sản phẩm</button>
							<form class="input-group" action="/lvshop/trang-chu/san-pham">
								<input type="hidden" value="1" name="trang"> <input
									type="hidden" value="" name="thuongHieu"> <input
									type="hidden" value="1" name="sapXep"><input
									type="text" placeholder="Bạn muốn tìm gì?" name="timKiem">
								<button type="button">
									<i class="ti-search"></i>
								</button>
							</form>
						</div>
					</div>
					<div class="col-lg-3 text-right col-md-3">
						<ul class="nav-right">
							<li class="cart-icon"><a href="/lvshop/trang-chu/gio-hang">
									<i class="icon_bag_alt"></i> <span>${sessionScope.cart.lstItem.size() }</span>
							</a></li>
							<li class="cart-price">${sessionScope.cart.totalValue }</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="nav-item">
			<div class="container">
				<nav class="nav-menu mobile-menu">
					<ul>
						<li class="active"><a href="/lvshop/trang-chu/">TRANG CHỦ</a></li>
						<li><a
							href="/lvshop/trang-chu/san-pham?trang=1&thuongHieu=&timKiem=&sapXep=1">SHOP</a></li>
						<li><a href="./contact.html">LIÊN HỆ</a></li>
					</ul>
				</nav>
				<div id="mobile-menu-wrap"></div>
			</div>
		</div>
	</header>
	<!-- Header End -->

	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text product-more">
						<a href="/lvshop/trang-chu/"><i class="fa fa-home"></i> Trang chủ</a>
						<a href="/lvshop/trang-chu/gio-hang">Giỏ hàng</a> <span>Trang
							thanh toán</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Shopping Cart Section Begin -->
	<section class="checkout-section spad">
		<div class="container">
			<form action="/lvshop/trang-chu/gio-hang/thanh-toan/ket-qua"
				class="checkout-form">
				<div class="row">
					<div class="col-lg-6">
						<div class="checkout-content">
							<a href="/lvshop/trang-chu/san-pham?trang=1&thuongHieu=&timKiem=&sapXep=1"
								class="content-btn">Tiếp tục mua sắm</a>
						</div>
						<h4>Thông tin hoá đơn</h4>
						<div class="row">
							<div class="col-lg-12">
								<label><i>Thông tin khách hàng</i></label>
								<hr>
							</div>

							<div class="col-lg-12">
								<label for="cun-name">Tên</label> <input type="text"
									readonly="readonly" id="cun-name"
									value="${sessionScope.UserSession.accInfor.name }">
							</div>
							<div class="col-lg-6">
								<label for="email">Địa chỉ email</label> <input type="text"
									id="email" readonly="readonly"
									value="${sessionScope.UserSession.accInfor.email }">
							</div>
							<div class="col-lg-6">
								<label for="phone">Số điện thoại</label> <input type="text"
									id="phone" readonly="readonly"
									value="${sessionScope.UserSession.accInfor.phone }">
							</div>

							<div class="col-lg-12 mt-3">
								<label><i>Địa chỉ giao hàng</i></label>
								<hr>
							</div>
							<div class="col-lg-12">
								<label for="city">Quận<span
									style="color: red;">*</span></label> <select id="city"
									onchange="loadWard()">
									<option value="0">Chọn quận</option>
									<c:forEach var="item" items="${lstDistrict }">
										<option value="${item.id }">${item.name }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-lg-12">
								<label for="ward">Phường<span>*</span></label> <select
									onclick="loadCommune()" id="ward">
								</select>
							</div>
							<div class="col-lg-12">
								<label for="commune">Đường<span>*</span></label>
								<select id="commune" name="maDiaChi" required="required">
								</select>
							</div>
						</div>
					</div>
					<div class="col-lg-6">						
						<div class="place-order">
							<h4>Chi tiết mua hàng</h4>
							<div class="order-total">
								<ul class="order-table">
									<li>Sản phẩm <span>Thành tiền</span></li>
									<c:forEach var="item" items="${sessionScope.cart.lstItem }">
										<li class="fw-normal">${item.pro.name }-
											${item.size.name } x ${item.amount } <span>${item.value }</span>
										</li>
									</c:forEach>
									<li class="total-price">Tổng cộng <span>${sessionScope.cart.totalValue }</span></li>									
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="checkout-content">
							<c:choose>
								<c:when test="${sessionScope.cart.lstItem.size()=='0' }">
									<button type="button" class="site-btn place-btn mt-4 btn-light"
										style="width: 100%;" onclick="nullCartHandler()">XÁC
										NHẬN MUA HÀNG</button>
								</c:when>
								<c:otherwise>
									<button type="submit" class="site-btn place-btn mt-4"
										style="width: 100%;">XÁC NHẬN MUA HÀNG</button>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
			</form>
		</div>
	</section>

	<!-- Modal Add Cart	Start-->
	<div class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
		id="modalCart">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="contentForCartAction">...</div>
			</div>
		</div>
	</div>
	<!-- Modal Add Cart	End-->


	<!-- Footer Section Begin -->
	<footer class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="footer-left">
						<div class="footer-logo">
							<a href="#" style="font-size: 1.5rem; color: white;">LV Shop</a>
						</div>
						<ul>
							<li>Địa chỉ: Tp. Hồ Chí Minh</li>
							<li>SĐT: 0123456789</li>
							<li>Email: lvshop@gmail.com</li>
						</ul>
						<div class="footer-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 offset-lg-1">
					<div class="footer-widget">
						<h5>Shop</h5>
						<ul>
							<li><a href="/lvshop/trang-chu/san-pham?timKiem=&thuongHieu=&sapXep=1&trang=1">Sản phẩm</a></li>
							<li><a href="/lvshop/trang-chu/lien-he">Liên hệ</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="footer-widget">
						<h5>Tài khoản</h5>
						<ul>
							<li><a href="/lvshop/trang-chu/trang-ca-nhan">Thông tin</a></li>
							<li><a href="/lvshop/trang-chu/gio-hang">Giỏ hàng</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="newslatter-item">
						<h5>Phản hồi với chúng tôi</h5>
						<p>Gửi email để chúng tôi có thể tiếp nhận ý kiến của
							bạn</p>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<div class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
		id="modalCart">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="contentForCartAction">...</div>
			</div>
		</div>
	</div>

	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="<c:url value="/template/Home/js/jquery-3.3.1.min.js"/>"></script>
	<script src="<c:url value="/template/Home/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/template/Home/js/jquery-ui.min.js"/>"></script>
	<script
		src="<c:url value="/template/Home/js/jquery.countdown.min.js"/>"></script>
	<script
		src="<c:url value="/template/Home/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/template/Home/js/jquery.zoom.min.js"/>"></script>
	<script src="<c:url value="/template/Home/js/jquery.dd.min.js"/>"></script>
	<script src="<c:url value="/template/Home/js/jquery.slicknav.js"/>"></script>
	<script src="<c:url value="/template/Home/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/template/Home/js/main.js"/>"></script>
	<script type="text/javascript" charset="utf-8">
		function nullCartHandler() {
			$("#contentForCartAction").html("Bạn chưa có vật phẩm nào trong giỏ hàng");
			$("#modalCart").modal('show');
		}
		
		function loadWard(){
			var distr = $("#city");
			if(distr.val()==0){
				$("#ward").empty();
				$("#commune").empty();
				return;
			}
			$.ajax({
				url: "/lvshop/trang-chu/api/huyen?idTinh="+distr.val(),
				type: "GET",
				success: (response)=>{
					var objJson = JSON.parse(response);
					$("#ward").empty();
					$("#commune").empty();
					if(typeof(objJson.message) != "undefined")
					{
						return;
					}
					$("#ward").empty();
					$("#commune").empty();
					var opt = $('<option></option>');
				    opt.val("0");
				    opt.text("Chọn");
				    $("#ward").append(opt);
					var i=-1;
					for(var x in objJson){
						i++;
						var opt = $('<option></option>');
					    opt.val(objJson[i].id);
					    opt.text(objJson[i].name);
					    $("#ward").append(opt);
					}
					
				},
				error: (error)=>{
					$("#contentForCartAction").html("Lỗi đường truyền");
					$("#modalCart").modal('show');
				}
			})
		}
		
		function loadCommune(){
			var ward = $("#ward");
			if(ward.val()==0||ward.val()==null){
				$("#commune").empty();
				return;
			}
			$.ajax({
				url: "/lvshop/trang-chu/api/xa?idHuyen="+ward.val(),
				type: "GET",
				success: (response)=>{
					var objJson = JSON.parse(response);	
					$("#commune").empty();
					if(typeof(objJson.message) != "undefined")
					{
						return;
					}
					$("#commune").empty();
					var opt = $('<option></option>');
				    opt.val("0");
				    opt.text("Chọn");
				    $("#commune").append(opt);
					var i=-1;
					for(var x in objJson){
						i++;
						var opt = $('<option></option>');
					    opt.val(objJson[i].id);
					    opt.text(objJson[i].name);
					    $("#commune").append(opt);
					}
					
				},
				error: (error)=>{
					$("#contentForCartAction").html("Lỗi đường truyền");
					$("#modalCart").modal('show');
				}
			})
		}
		</script>
</body>

</html>