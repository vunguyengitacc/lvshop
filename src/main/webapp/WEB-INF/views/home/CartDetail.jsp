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
						<i class=" fa fa-envelope"></i> lnshop@gmail.com
					</div>
					<div class="phone-service">
						<i class=" fa fa-phone"></i> 0123456789s
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
							<a href="/lvshop/trang-chu/" style="font-size: 1.4rem;"> LV
								SHOP </a>
						</div>
					</div>
					<div class="col-lg-7 col-md-7">
						<div class="advanced-search">
							<button type="button" class="category-btn">T??m s???n ph???m</button>
							<form class="input-group" action="/lvshop/trang-chu/san-pham">
								<input type="hidden" value="1" name="trang"> <input
									type="hidden" value="" name="thuongHieu"> <input
									type="hidden" value="1" name="sapXep"> <input
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
						<li class="active"><a href="/lvshop/trang-chu/">TRANG CH???</a></li>
						<li><a
							href="/lvshop/trang-chu/san-pham?trang=1&thuongHieu=&timKiem=&sapXep=1">SHOP</a></li>
						<li><a href="./contact.html">LI??N H???</a></li>						
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
						<span>Gi??? h??ng</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Cart Detail Section Begin -->

	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="cart-table">
						<table>
							<thead>
								<tr>
									<th>???nh</th>
									<th class="p-name">T??n s???n ph???m</th>
									<th>Size</th>
									<th>Gi??</th>
									<th>S??? l?????ng</th>
									<th>T???ng</th>
									<th><i class="ti-close"></i></th>
								</tr>
							</thead>
							<tbody>
								<c:set var="myVar" value="${0 }" />
								<c:forEach var="item" items="${sessionScope.cart.lstItem }">
									<c:set var="myVar" value="${myVar+1 }" />
									<tr id="item${myVar }">
										<td class="cart-pic first-row"><img
											src="<c:url value="${item.pro.image }"/>" alt=""
											style="height: 15vh"></td>
										<td class="cart-title first-row">
											<h5>${item.pro.name }</h5>
										</td>
										<td class="cart-title first-row">${item.size.name }</td>
										<c:choose>
											<c:when test="${item.pro.promotionPrice =='0.00' }">
												<td class="p-price first-row">${item.pro.price }</td>
											</c:when>
											<c:otherwise>
												<td class="p-price first-row">${item.pro.promotionPrice }</td>
											</c:otherwise>
										</c:choose>
										<td class="qua-col first-row">
											<div class="quantity">
												<div class="pro-qty">
													<input type="number" value="${item.amount }" min=1
														onchange="changeHandler(this.value, ${item.size.id }, ${item.pro.id }, ${myVar })">
												</div>
											</div>
										</td>

										<td class="total-price first-row" id="${myVar }">${item.value }</td>
										<td class="close-td first-row"><i class="ti-close"
											onclick="sendAsync(${item.pro.id}, ${item.size.id }, item${myVar })"></i></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-lg-4">
							<div class="cart-buttons">

								<a href="/lvshop/trang-chu/san-pham?trang=1&thuongHieu=&timKiem="
									class="primary-btn up-cart">Ti???p t???c mua s???m</a>
							</div>
							<div class="discount-coupon">								
							</div>
						</div>
						<div class="col-lg-4 offset-lg-4">
							<div class="proceed-checkout">
								<ul>									
									<li class="cart-total">T???ng c???ng <span id="totalValue">${sessionScope.cart.totalValue }</span></li>
								</ul>
								<a href="/lvshop/trang-chu/gio-hang/thanh-toan" class="proceed-btn">THANH
									TO??N</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Cart Detail Section End -->

	<!-- Modal Add Cart	Start-->
	<div class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
		id="modalCart">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Th??ng b??o</h5>
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
							<li><a href="/lvshop/trang-chu/san-pham?timKiem=&thuongHieu=&sapXep=1&trang=1">S???n ph???m</a></li>
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
						<p>G???i email ????? ch??ng t??i c?? th??? ti???p nh???n ?? ki???n c???a
							b???n</p>
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
	<script type="text/javascript">
		function changeHandler(x, y, z, t){
			
			if(x < 0){				
				$("#contentForCartAction").html("B???n n??n nh???p 1 s??? nguy??n d????ng");
				$("#modalCart").modal('show');
				return;
			}
			$.ajax({
				url: "/lvshop/trang-chu/api/gio-hang?idSize="+y+"&idSanPham="+z+"&soLuong=0&thayDoiSoLuong="+x,
				type: 'PUT', 
				success: function(response){
					var objJson = JSON.parse(response);					
					if(objJson["status "] == 2){
						$("#contentForCartAction").html("Kh??ng ????? h??ng");
						$("#modalCart").modal('show');
					}
					else{
						$("#"+t).html(objJson.newItemValue);
						$("#amountItemCart").html(objJson.totalItem);
						$("#amountValueCart").html(objJson.totalValue);						
						$("#totalValue").html(objJson.totalValue);
					}
				},
				error: function(error){
					if(error.status == 400){
						$("#contentForCartAction").html("B???n n??n nh???p 1 s??? nguy??n d????ng");
						$("#modalCart").modal('show');
					}else{
						$("#contentForCartAction").html("L???i ???????ng truy???n");
						$("#modalCart").modal('show');
					}
				}
			})
		}
		function sendAsync(x, y, z){
			$.ajax({
				url: "/lvshop/trang-chu/api/gio-hang/item?idSanPham="+x+"&idSize="+y,
				type: 'DELETE',
				success: function(response){
					var objJson = JSON.parse(response);
					if(objJson.resultDelete == 2){
						$("#contentForCartAction").html("C???p nh???t th???t b???i");
						$("#modalCart").modal('show');
					}
					if(objJson.resultDelete == 1){
						$("#amountItemCart").html(objJson.totalItem);
						$("#amountValueCart").html(objJson.totalValue);						
						$("#totalValue").html(objJson.totalValue);
						z.remove();
					}
				},
				error: function(error){
					$("#contentForCartAction").html("L???i ???????ng truy???n");
					$("#modalCart").modal('show');
				}
			})
		}
		
		
	</script>
</body>

</html>