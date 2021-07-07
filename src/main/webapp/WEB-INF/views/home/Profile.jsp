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

<style>
.log-out-choice:hover {
	background: red;
}
</style>
<body id="bodyHTML">


	<c:if test="${message != null }">
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
					<div class="modal-body" id="contentForCartAction">${message }</div>
				</div>
			</div>
		</div>
		<!-- Modal Add Cart	End-->
	</c:if>
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
								<button type="submit">
									<i class="ti-search"></i>
								</button>
							</form>
						</div>
					</div>
					<div class="col-lg-3 text-right col-md-3">
						<ul class="nav-right">
							<li class="cart-icon"><a href="/lvshop/trang-chu/gio-hang">
									<i class="icon_bag_alt"></i> <span id="amountItemCart">${sessionScope.cart.lstItem.size() }</span>
							</a></li>
							<li class="cart-price" id="amountValueCart">${sessionScope.cart.totalValue }</li>
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
						<li><a href="/lvshop/trang-chu/lien-he">LIÊN HỆ</a></li>						
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
						<a href="/lvshop/trang-chu/"><i class="fa fa-home"></i> Trang chủ</a>
						<span> Trang cá nhân</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Profile Begin -->
	<div class="container">
		<div class="row gutters-sm"
			style="margin-top: 5vh; margin-bottom: 5vh;">
			<div class="col-md-4 d-none d-md-block">
				<div class="card">
					<div class="card-body" style="padding: 0;">
						<nav class="nav flex-column nav-pills nav-gap-y-1">
							<a href="#profile" data-toggle="tab"
								class="nav-link has-icon nav-link-faded active"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-user mr-2">
								<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
								<circle cx="12" cy="7" r="4"></circle></svg>Thông tin tài khoản
							</a> <a href="#account" data-toggle="tab"
								class="nav-link has-icon nav-link-faded"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-settings mr-2">
								<circle cx="12" cy="12" r="3"></circle>
								<path
										d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>Đổi
								mật khẩu
							</a> <a href="#billing" data-toggle="tab"
								class="nav-link has-icon nav-link-faded"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-credit-card mr-2">
								<rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect>
								<line x1="1" y1="10" x2="23" y2="10"></line></svg>Lịch sử mua hàng <a
								href="/lvshop/admin/log-out"
								class="nav-link has-icon nav-link-faded log-out-choice"> <svg
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true"
										focusable="false" width="24" height="24" viewBox="0 0 24 24"
										fill="none"
										style="-ms-transform: rotate(360deg); -lvshopkit-transform: rotate(360deg); transform: rotate(360deg);"
										class="feather feather-log-out mr-2"
										preserveAspectRatio="xMidYMid meet">
										<g fill="none" stroke="#626262" stroke-width="2"
											stroke-linecap="round" stroke-linejoin="round">
										<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" />
										<path d="M16 17l5-5l-5-5" />
										<path d="M21 12H9" /></g></svg>Đăng xuất
							</a>
						</nav>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card">
					<div class="card-header border-bottom mb-3 d-flex d-md-none">
						<ul class="nav nav-tabs card-header-tabs nav-gap-x-1"
							role="tablist">
							<li class="nav-item"><a href="#profile" data-toggle="tab"
								class="nav-link has-icon active"><svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-user">
									<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
									<circle cx="12" cy="7" r="4"></circle></svg></a></li>
							<li class="nav-item"><a href="#account" data-toggle="tab"
								class="nav-link has-icon"><svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-settings">
									<circle cx="12" cy="12" r="3"></circle>
									<path
											d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg></a>
							</li>
							<li class="nav-item"><a href="#billing" data-toggle="tab"
								class="nav-link has-icon"><svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-credit-card">
									<rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect>
									<line x1="1" y1="10" x2="23" y2="10"></line></svg></a></li>
							<a href="https://iconify.design/icon-sets/feather/log-out.html"
								class="nav-link has-icon nav-link-faded log-out-choice"> <svg
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true"
									focusable="false" width="24" height="24" viewBox="0 0 24 24"
									fill="none"
									style="-ms-transform: rotate(360deg); -lvshopkit-transform: rotate(360deg); transform: rotate(360deg);"
									class="feather feather-log-out mr-2 "
									preserveAspectRatio="xMidYMid meet">
									<g fill="none" stroke="#626262" stroke-width="2"
										stroke-linecap="round" stroke-linejoin="round">
									<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" />
									<path d="M16 17l5-5l-5-5" />
									<path d="M21 12H9" /></g></svg>Đăng xuất
							</a>
						</ul>
					</div>
					<div class="card-body tab-content">

						<!-- Profile -->
						<div class="tab-pane active" id="profile">
							<h3>Ảnh đại diện</h3>
							<hr>
							<form action="/lvshop/trang-chu/trang-ca-nhan/cap-nhat-anh"
								method="post" enctype="multipart/form-data">
								<div class="form-group row mb-6">

									<div class="col-lg-6 d-flex" style="padding-top: 10%;">
										<div class="custom-file mb-1">
											<input type="file" class="custom-file-input" id="coverImage"
												name="avatar" required> <label
												class="custom-file-label" for="coverImage">Chọn
												ảnh...</label>
											<div class="invalid-feedback">Example invalid custom
												file feedback</div>

										</div>
									</div>

									<div class="col-lg-4 offset-lg-1">
										<c:choose>
											<c:when
												test="${sessionScope.UserSession.accInfor.avatar != '' }">
												<img
													src="<c:url value="${sessionScope.UserSession.accInfor.avatar }"/>">
											</c:when>
											<c:otherwise>
												<img src="<c:url value="/resources/user/temp-avatar.png"/>">
											</c:otherwise>
										</c:choose>


									</div>
									<div class="col-lg-12  mt-3">

										<button type="submit" class=" btn primary-btn">Cập
											nhật</button>

									</div>

								</div>

							</form>
							<h3>Thông tin tài khoản</h3>
							<hr>
							<div>

								<div class="form-group">

									<label for="fullName">Tên</label> <input type="text"
										class="form-control" id="fullName"
										aria-describedby="fullNameHelp"
										placeholder="Tên của bạn sẽ được dùng thay thế cho tên đăng nhập"
										value="${sessionScope.UserSession.accInfor.name }">
								</div>
								<div class="form-group">
									<label for="url">Email</label> <input type="text"
										class="form-control" id="email"
										placeholder="Chúng tôi có thể liên lạc cho bạn lúc cần"
										value="${sessionScope.UserSession.accInfor.email }"
										data-toggle="tooltip" data-placement="top"
										title="Nên nhập dạng a...z@gmail.com">
								</div>
								<div class="form-group">
									<label for="location">Số điện thoại </label> <input type="text"
										class="form-control" id="phoneNumber"
										placeholder="Nhập số điện thoại"
										value="${sessionScope.UserSession.accInfor.phone }"
										data-toggle="tooltip" data-placement="top"
										title="Chỉ nên nhập một chuỗi số">
								</div>
								<div class="form-group">
									<label for="location">Giới tính</label> <select
										class="form-control" id="gender">
										<c:choose>
											<c:when
												test="${sessionScope.UserSession.accInfor.gender == '1' }">
												<option value="1">Nam</option>
												<option value="2">Nữ</option>
												<option value="3">Khác</option>
											</c:when>
											<c:when
												test="${sessionScope.UserSession.accInfor.gender == '2' }">
												<option value="1">Nam</option>
												<option value="2">Nữ</option>
												<option value="3">Khác</option>
											</c:when>
											<c:otherwise>
												<option value="3">Khác</option>
												<option value="2">Nữ</option>
												<option value="1">Nam</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
								<hr>
								<button type="button" class="btn primary-btn"
									onclick="updateAccountHandler()">Cập nhật</button>
								<a href="/lvshop/trang-chu/trang-ca-nhan" class="btn light-btn">Huỷ</a>
							</div>
						</div>
						<!-- Profile -->


						<!-- Change Pass -->
						<div class="tab-pane" id="account">
							<h3>Đổi mật khẩu</h3>
							<hr>
							<div>
								<div class="form-group">
									<label for="username">Mật khẩu cũ</label> <input
										type="password" class="form-control" id="oldPass" name="matKhauCu"
										aria-describedby="usernameHelp"> <label for="username">Mật
										khẩu mới</label> <input type="password" class="form-control"
										id="newPass" aria-describedby="usernameHelp"> <label
										for="username">Xác nhận mật khẩu mới</label> <input
										type="password" class="form-control" id="confirmPass"
										aria-describedby="usernameHelp"> <small
										id="usernameHelp" class="form-text text-muted">Sau khi
										thay đổi mật khẩu thành công, vui lòng đăng nhập lại.</small>
								</div>
								<hr>
								<button class="btn primary-btn" onclick="changePassHandler()">Lưu</button>
							</div>
						</div>
						<!-- Change Pass -->

						<!--Bill History-->
						<div class="tab-pane" id="billing">
							<h3>Lịch sử mua hàng</h3>
							<hr>
							<div>
								<div class="container mt-1"
									style="height: 85vh; overflow-y: scroll;">
									<div class="row">
										<div class="col-md-10 offset-md-1">
											<ul class="timeline">
												<c:forEach var="item" items="${lstBills }">
													<li><a href="#">MÃ GIAO DỊCH: ${item.id }</a> <a
																href="#" class="float-right">${item.createDate }</a>
																<p>
																	<br>
																<h3>${item.totalValue }VNĐ</h3>
																</p></li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</div>

						</div>
						<!--Bill History-->

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Profile End -->

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


	<!-- Product Shop Section Begin -->
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
							<li><a
								href="/lvshop/trang-chu/san-pham?timKiem=&thuongHieu=&sapXep=1&trang=1">Sản
									phẩm</a></li>
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
						<p>Gửi email để chúng tôi có thể tiếp nhận ý kiến của bạn</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<form action="/lvshop/trang-chu/trang-ca-nhan" id="reloadTrick"></form>
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
	<script>
		
		function updateAccountHandler() {
			var a = $("#fullName");
			var b = $("#email");
			var c = $("#phoneNumber");
			var d = $("#gender");
			var regexForEmail = /^[.a-zA-Z0-9]+@(gmail|[a-zA-z]+).com$/g;
			var regexForPhone = /^(0|\+84)[0-9]{9}$/g;
			if(!regexForEmail.test(b.val())||!regexForPhone.test(c.val())){
				$("#contentForCartAction").html("Vui lòng nhập đúng định dạng");
				$("#modalCart").modal('show');
				return;
			}
			if(a.val()==""){
				$("#contentForCartAction").html("Vui lòng nhập day du thong tin");
				$("#modalCart").modal('show');
				return;
			}
			$.ajax({
				url: "/lvshop/trang-chu/api//tai-khoan/cap-nhat-thong-tin?tenHienThi="+a.val()+"&email="+b.val()+"&soDienThoai="+c.val()+"&gioiTinh="+d.val(),
				type: 'PUT',
				success: (response)=>{
					var objJson = JSON.parse(response);
					if(objJson.status == 1){
						$("#contentForCartAction").html("Cập nhật thành công!");
						$("#modalCart").modal('show');
					} else if(objJson.status == 2){
						$("#contentForCartAction").html("Cập nhật thất bại! Vui lòng kiểm tra lại định dạng input");
						$("#modalCart").modal('show');
						
					} else if(objJson.status == 3){
						$("#contentForCartAction").html("Lỗi! Bạn chưa đăng nhập");
						$("#modalCart").modal('show');
						setTimeout(()=>$("#bodyHTML").click(reloadPage()),1500);
					} else if (objJson.status == "4") {
						$("#contentForCartAction").html("Tài khoản của bạn đã bị khoá! Thao tác thất bại");
						$("#exampleModalCenter").modal('show');
						setTimeout(()=>$("#bodyHTML").click(reloadPage()),1500);
					} else if (objJson.status == "5") {
						$("#contentForCartAction").html("Vui lòng thử một địa chỉ mail khác");
						$("#exampleModalCenter").modal('show');
					}
				},
				error: (error)=>{
					$("#contentForCartAction").html("Lỗi đường truyền");
					$("#modalCart").modal('show');
				}
			})
		}
	
		function changePassHandler() {
			var x = $("#oldPass");
			var y = $("#newPass");
			var z = $("#confirmPass");
			var regEx = /^[a-z0-9]{8,20}$/g;
			if(regEx.test(y.val())==false){
				$("#contentForCartAction").html("Chỉ được nhập kí tự chữ thường và kí tự số");
				$("#modalCart").modal('show');
				return;
			}
			if(y.val()!=z.val()){
				$("#contentForCartAction").html("Nhập sai mã xác nhận");
				$("#modalCart").modal('show');
				return;
			}
			$.ajax({
				url: "/lvshop/trang-chu/api/tai-khoan/doi-mat-khau?matKhauMoi="+y.val()+"&matKhauCu="+x.val(),
				type: 'PUT',
				success: (response)=>{
					var objJson = JSON.parse(response);
					if(objJson.status == 1){
						$("#contentForCartAction").html("Cập nhật thành công! Vui lòng đăng nhập lại");
						$("#modalCart").modal('show');
						setTimeout(()=>$("#bodyHTML").click(reloadPage()),1000);
					}
					else if(objJson.status == 2){
						$("#contentForCartAction").html("Cập nhật thất bại! Vui lòng kiểm tra lại định dạng input");
						$("#modalCart").modal('show');
						
					}
					else if(objJson.status == 3){
						$("#contentForCartAction").html("Lỗi! Bạn chưa đăng nhập");
						$("#modalCart").modal('show');
						setTimeout(()=>$("#bodyHTML").click(reloadPage()),1000);
					}
					else if (objJson.status == "4") {
						$("#contentForCartAction").html("Tài khoản của bạn đã bị khoá! Thao tác thất bại");
						$("#exampleModalCenter").modal('show');
						setTimeout(()=>$("#bodyHTML").click(reloadPage()),1000);
					}
					else if(objJson.status == 5){
						$("#contentForCartAction").html("Sai mật khẩu");
						$("#modalCart").modal('show');
						setTimeout(()=>$("#bodyHTML").click(reloadPage()),1000);
					}
				},
				error: (error)=>{
					$("#contentForCartAction").html("Lỗi đường truyền");
					$("#modalCart").modal('show');
				}
			})
		}
		
		function reloadPage(){
			$("#reloadTrick").submit();
		}
	</script>
</body>

</html>