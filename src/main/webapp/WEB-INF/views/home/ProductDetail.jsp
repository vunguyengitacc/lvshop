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
	.zoomImg{
		width: 800px !important;
		height: 800px !important;
	}
</style>
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
						<li><a href="/lvshop/trang-chu/">TRANG CHỦ</a></li>
						<li class="active"><a
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
						<a href="/lvshop/trang-chu/san-pham?trang=1&thuongHieu=&timKiem=&sapXep=1">
							Trang sản phẩm</a> <span>${pro.name }</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Product Shop Section Begin -->
	<section class="product-shop spad page-details">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="filter-widget">
						<h4 class="fw-title">Thương hiệu</h4>
						<ul class="filter-catagories">
							<c:forEach var="item" items="${lstTradeMark }">
								<li><a
									href="/lvshop/trang-chu/san-pham?trang=1&thuongHieu=${item.name }&timKiem=&sapXep=1">${item.name }(${item.amount })</a></li>
							</c:forEach>
						</ul>
					</div>

				</div>
				<div class="col-lg-9">
					<div class="row">
						<!-- action="/lvshop/trang-chu/cap-nhat-gio-hang"  method="POST" -->
						<div class="col-lg-6">
							<div class="product-pic-zoom">
								<c:choose>
									<c:when test="${pro.image == null }">
										<img class="product-big-img"
											src="<c:url value="/resources/default.png"/>" alt="">
									</c:when>
									<c:otherwise>
										<img class="product-big-img"
											src="<c:url value="${pro.image }"/>" alt="">

										<div class="zoom-icon">
											<i class="fa fa-search-plus"></i>
										</div>

									</c:otherwise>
								</c:choose>
							</div>

						</div>
						<div class="col-lg-6">
							<div class="product-details">
								<div class="pd-title">
									<span>${pro.trademark.name }</span>
									<h3>${pro.name }</h3>
								</div>
								<div class="pd-desc">
									<p>${pro.description }</p>
									<h4>
										<c:choose>
											<c:when test="${pro.promotionPrice == '0.00' }">
												${pro.price }
											</c:when>
											<c:otherwise>
												${pro.promotionPrice }
													<span>${pro.price }</span>
											</c:otherwise>
										</c:choose>
									</h4>
								</div>
								<div class="pd-color">
									<h6>Size</h6>
									<br> <select class="form-control"
										style="margin-top: 1.5vh;" onchange="changeMax(this.value)">
										<option value="0|0">Hãy chọn Size</option>
										<c:forEach var="item" items="${pro.productHasSizes }">
											<c:if test="${item.amount > 0 }">
												<option value="${item.amount }|${item.size.id}">${item.size.name }</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
								<div class="quantity">
									<div class="pro-qty">
										<input type="number" value=0 id="amountInput" name="soLuong"
											onchange="handlerChange(this.value)" max=0>
									</div>
									<input type="hidden" id="idProduct" name="idSanPham"
										value="${pro.id }"> <input type="hidden" id="idSize"
										name="idSize"> <input type="hidden"
										name="thayDoiSoLuong" value="0">
									<button id="buttonSubmit" class="primary-btn pd-cart"
										onclick="sendAsync()" disabled>Thêm vào giỏ</button>
								</div>
							</div>
						</div>
					</div>
					<div class="product-tab col-lg-12">
						<div class="tab-item">
							<ul class="nav" role="tablist">
								<li><a class="active" data-toggle="tab" href="#tab-1"
									role="tab">MÔ TẢ</a></li>								
							</ul>
						</div>
						<div class="tab-item-content">
							<div class="tab-content">
								<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
									<div class="product-content">
										<div class="row">
											<div class="col-lg-12">
												<p>${pro.description }</p>

											</div>
										</div>
									</div>
								</div>
								
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="customer-review-option">							
							<h4>${lstComment.size() }&nbsp;bình&nbsp;luận</h4>
							<div class="comment-option" id="scrollBox"
								style="height: 65vh; overflow-y: scroll;">
								<c:forEach var="item" items="${lstComment }">

									<div class="co-item">
										<div class="avatar-pic">
										
										</div>
										<div class="avatar-text">
											<c:choose>
												<c:when test="${item.status==1 }">
													<h5>
														${item.account.username } <span>${item.createDate }</span>
													</h5>
													<div class="at-reply"
														style="height: 12vh; overflow: hidden;">${item.content }</div>

												</c:when>
												<c:otherwise>
													<h5>
														${item.account.username } <span>${item.createDate }</span>
													</h5>
													<div class="at-reply"
														style="height: 12vh; overflow: hidden;">
														<i>Bình luận này đã bị ẩn đi</i>
													</div>
													
												</c:otherwise>
											</c:choose>

											<c:if test="${sessionScope.UserSession.accInfor.type == 0 }">
												<c:choose>
													<c:when test="${item.status==1 }">

														<a href="/lvshop/admin/binh-luan/xoa?idComment=${item.id }"
															class="btn btn-danger"
															style="font-size: .6rem">ẨN BÌNH
															LUẬN</a>
													</c:when>
													<c:otherwise>
														<a href="/lvshop/admin/binh-luan/xoa?idComment=${item.id }"
															class="btn btn-success"
															style="font-size: .6rem">HIỆN BÌNH
															LUẬN</a>
													</c:otherwise>
												</c:choose>
											</c:if>
										</div>
									</div>

								</c:forEach>
							</div>
							<div class="leave-comment">
								<h4>Để lại đánh giá về sản phẩm</h4>
								<form action="/lvshop/trang-chu/${pro.name }/binh-luan"
									class="comment-form" method="post">
									<div class="row">
										<div class="col-lg-12">
											<textarea name="contentCmt"
												placeholder="Nhập tối thiểu 10 kí tự..." minlength="10" maxlength="50"></textarea>
											<input type="hidden" name="id" value="${pro.id }">
											<c:choose>
												<c:when test="${sessionScope.UserSession == null }">
													<button type="button" class="site-btn">BẠN CẦN ĐĂNG NHẬP ĐỂ GỬI ĐÁNH GIÁ</button>
												</c:when>
												<c:otherwise>
													<button type="submit" class="site-btn">GỬI ĐÁNH GIÁ</button>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- Product Shop Section End -->

	<!-- Modal Redirect To Login Page Start-->
	<form>
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">Bạn cần đăng nhập để thực hiện chức
						năng này</div>
					<div class="modal-footer">
						<a href="/lvshop/login" class="btn btn-primary">Đăng nhập</a>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- Modal Redirect To Login Page Start-->
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
		jQuery(document).ready(function($) {
			$("#scrollBox").scrollTop($("#scrollBox").outerHeight());
			$(".btnrating").on('click', (function(e) {
				var selected_value = $(this).attr("data-attr");
				sendRatingAsync(selected_value);
				for (i = 1; i <= 5; ++i) {
					$("#rating-star-" + i).removeClass('btn-warning');
					$("#rating-star-" + i).removeClass('btn-default');
				}

				for (i = 1; i <= selected_value; ++i) {
					$("#rating-star-" + i).addClass('btn-warning');
				}

				for (ix = selected_value + 1; ix <= 5; ++ix) {
					$("#rating-star-" + ix).addClass('btn-default');
				}

			}))
		});

		
		function changeMax(y) {
			var lstValue = y.split("|");
			var x = $("#amountInput");
			var t = $("#buttonSubmit");
			var z = $("#idSize");
			if (lstValue[1] == "0")
				t.attr("disabled", true)
			else
				t.attr("disabled", false);
			x.prop("max", lstValue[0]);
			z.val(lstValue[1]);
			x.val(0);
		}
		function handlerChange(y) {
			var x = $("#amountInput");
			if (x.val() < 0 || parseInt(x.val()) > parseInt(x.prop("max"))
					|| isNaN(parseInt(x.val())))
				x.val(0);
		}
		function sendAsync() {
			var x = $("#idSize");
			var y = $("#idProduct");
			var z = $("#amountInput");
			if (z.val() == 0) {
				$("#contentForCartAction").html(
						"Vui lòng nhập số lượng nhiều hơn 0");
				$("#modalCart").modal('show');
				return;
			}
			$.ajax({
				url : "/lvshop/trang-chu/api/gio-hang?idSize=" + x.val()
						+ "&idSanPham=" + y.val() + "&soLuong=" + z.val()
						+ "&thayDoiSoLuong=0",
				type : 'PUT',
				success : function(response) {
					var objJson = JSON.parse(response);
					if (objJson.status == "2") {
						$("#contentForCartAction").html("Cập nhật thất bại");
						$("#modalCart").modal('show');
					} else {
						$("#contentForCartAction").html("Cập nhật thành công");
						$("#modalCart").modal('show');
						$("#amountItemCart").html(objJson.totalItem);
						$("#amountValueCart").html(objJson.totalValue);
					}
				},
				error : function(error) {
					$("#contentForCartAction").html("Lỗi đường truyền");
					$("#modalCart").modal('show');
				}
			})
		}
	</script>
</body>

</html>