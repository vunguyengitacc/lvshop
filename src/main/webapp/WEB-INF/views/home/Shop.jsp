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
<style type="text/css">
.pagination>li>a {
	margin: 0 5px;
}
</style>
</head>

<body>
	<c:if test="${sessionScope.UserSession.accInfor.type == 0 }">
		<div id="feedback">
			<a href="/lvshop/admin/quan-li-chung"><i class="fas fa-user-cog"></i>Trang
				admin</a>
		</div>
	</c:if>
	<header class="header-section">
		<div class="header-top">
			<div class="container">
				<div class="ht-left">
					<div class="mail-service">
						<i class=" fa fa-envelope"></i> 0123456789
					</div>
					<div class="phone-service">
						<i class=" fa fa-phone"></i> lvshop@gmail.com
					</div>
				</div>
				<div class="ht-right">
					<c:choose>
						<c:when test="${sessionScope.UserSession == null }">
							<a href="/lvshop/login" class="login-panel"><i
								class="fa fa-user"></i>????ng nh???p</a>
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
							<button type="button" class="category-btn">T??m s???n ph???m</button>
							<form class="input-group" action="/lvshop/trang-chu/san-pham">
								<input type="hidden" value="1" name="trang"> <input
									type="hidden" value="" name="thuongHieu"> <input
									type="hidden" value="1" name="sapXep"><input
									type="text" placeholder="B???n mu???n t??m g???" name="timKiem">
								<button type="submit">
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
						<li><a href="/lvshop/trang-chu/">TRANG CH???</a></li>
						<li class="active"><a
							href="/lvshop/trang-chu/san-pham?trang=1&thuongHieu=&timKiem=&sapXep=1">SHOP</a></li>
						<li><a href="/lvshop/trang-chu/lien-he">LI??N H???</a></li>						
					</ul>
				</nav>
				<div id="mobile-menu-wrap"></div>
			</div>
		</div>
	</header>
	<!-- Header End -->

	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="/lvshop/trang-chu/"><i class="fa fa-home"></i> Trang ch???</a>
						<span>Trang s???n ph???m</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Product Shop Section Begin -->
	<section class="product-shop spad">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
					<div class="filter-widget">
						<h4 class="fw-title">Th????ng hi???u</h4>
						<ul class="filter-catagories">
							<c:forEach var="item" items="${lstTradeMark }">
								<li><a
									href="/lvshop/trang-chu/san-pham?trang=1&thuongHieu=${item.name }&timKiem=&sapXep=1">${item.name }(${item.amount })</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="filter-widget">
						<h4 class="fw-title">S???p x???p</h4>
						<ul class="filter-catagories">
							<li><a
								href="/lvshop/trang-chu/san-pham?trang=1&thuongHieu=${param.thuongHieu }&timKiem=${param.timKiem }&sapXep=1">S???n ph???m m???i th??m</a></li>
							<li><a
								href="/lvshop/trang-chu/san-pham?trang=1&thuongHieu=${param.thuongHieu }&timKiem=${param.timKiem }&sapXep=2">Gi??
									th???p nh???t tr?????c</a></li>
							<li><a
								href="/lvshop/trang-chu/san-pham?trang=1&thuongHieu=${param.thuongHieu }&timKiem=${param.timKiem }&sapXep=3">Gi??
									cao nh???t tr?????c</a></li>
							<li><a
								href="/lvshop/trang-chu/san-pham?trang=1&thuongHieu=${param.thuongHieu }&timKiem=${param.timKiem }&sapXep=4">L?????t
									mua nhi???u nh???t</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9 order-1 order-lg-2">
					<div class="product-show-option">
						<div class="row">
							<div class="col-lg-7 col-md-7"></div>
							<div class="col-lg-5 col-md-5 text-right">
								<p>T??m th???y ${count } s???n ph???m</p>
							</div>
						</div>
					</div>
					<div class="product-list">
						<div class="row">

							<c:forEach var="item" items="${lstPro }">
								<div class="col-lg-3 col-sm-6">
									<div class="product-item">
										<div class="pi-pic">
											<c:choose>
												<c:when test="${item.image == null }">
													<img src="<c:url value="/resources/default.png"/>" alt=""
														style="height: 35vh;">
												</c:when>
												<c:otherwise>
													<img src="<c:url value="${item.image }"/>" alt=""
														style="height: 35vh;">
												</c:otherwise>
											</c:choose>
											<c:if test="${item.promotionPrice != '0.00' }">
												<div class="sale pp-sale">Khuy???n m??i</div>
											</c:if>
											<ul>
												<li class="quick-view"><a
													href="/lvshop/trang-chu/san-pham/${item.name }?id=${item.id }">+
														Xem chi ti???t</a></li>

											</ul>
										</div>
										<div class="pi-text">
											<div class="catagory-name">${item.trademark.name }</div>
											<a href="#">
												<h5
													style="height: 13vh; overflow: hidden; display: flex; flex-wrap: wrap; align-content: center; justify-content: center;">
													${item.name }</h5>
											</a>
											<c:choose>
												<c:when test="${item.promotionPrice == '0.00' }">
													<div class="product-price">${item.price }</div>
												</c:when>
												<c:otherwise>
													<div class="product-price">${item.promotionPrice }
														<span>${item.price }</span>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
					<div>
						<div class="pagination">

							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<li class="page-item"><a class="page-link"
										href="/lvshop/trang-chu/san-pham?trang=1&thuongHieu=${param.thuongHieu}&timKiem=&sapXep=${param.sapXep}">&lsaquo;&lsaquo;</a></li>
									<li class="page-item"><c:choose>
											<c:when test="${currentPage > 1 }">
												<a class="page-link"
													href="/lvshop/trang-chu/san-pham?trang=${currentPage - 1 }&thuongHieu=${param.thuongHieu}&timKiem=&sapXep=${param.sapXep}">&lsaquo;</a>
											</c:when>
											<c:otherwise>
												<a class="page-link" href="#">&lsaquo;</a>
											</c:otherwise>
										</c:choose></li>

									<c:if test="${currentPage >= 3 }">
										<li class="page-item"><a class="page-link" href="#">...</a></li>
									</c:if>
									<c:if test="${currentPage > 1 }">
										<li class="page-item"><a class="page-link"
											href="/lvshop/trang-chu/san-pham?trang=${currentPage - 1 }&thuongHieu=${param.thuongHieu}&timKiem=&sapXep=${param.sapXep}">${currentPage-1 }</a></li>
									</c:if>
									<li class="page-item active"><a class="page-link" href="#">${currentPage }
									</a></li>
									<c:if test="${currentPage < pageCount }">
										<li class="page-item"><a class="page-link"
											href="/lvshop/trang-chu/san-pham?trang=${currentPage + 1 }&thuongHieu=${param.thuongHieu}&timKiem=&sapXep=${param.sapXep}">${currentPage +1 }</a></li>
									</c:if>
									<c:if test="${currentPage < pageCount-1 }">
										<li class="page-item"><a class="page-link" href="#">...</a></li>
									</c:if>
									<li class="page-item"><c:choose>
											<c:when test="${currentPage < pageCount }">
												<a class="page-link"
													href="/lvshop/trang-chu/san-pham?trang=${currentPage + 1 }&thuongHieu=${param.thuongHieu}&timKiem=&sapXep=${param.sapXep}">&rsaquo;</a>
											</c:when>
											<c:otherwise>
												<a class="page-link" href="#">&rsaquo;</a>
											</c:otherwise>
										</c:choose></li>
									<li class="page-item"><a class="page-link"
										href="/lvshop/trang-chu/san-pham?trang=${pageCount }&thuongHieu=${param.thuongHieu}&timKiem=&sapXep=${param.sapXep}">&rsaquo;&rsaquo;</a></li>
								</ul>
							</nav>

						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
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
							<li>?????a ch???: Tp. H??? Ch?? Minh</li>
							<li>S??T: 0123456789</li>
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
							<li><a
								href="/lvshop/trang-chu/san-pham?timKiem=&thuongHieu=&sapXep=1&trang=1">S???n
									ph???m</a></li>
							<li><a href="/lvshop/trang-chu/lien-he">Li??n h???</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="footer-widget">
						<h5>T??i kho???n</h5>
						<ul>
							<li><a href="/lvshop/trang-chu/trang-ca-nhan">Th??ng tin</a></li>
							<li><a href="/lvshop/trang-chu/gio-hang">Gi??? h??ng</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="newslatter-item">
						<h5>Ph???n h???i v???i ch??ng t??i</h5>
						<p>G???i email ????? ch??ng t??i c?? th??? ti???p nh???n ?? ki???n c???a b???n</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
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
</body>

</html>