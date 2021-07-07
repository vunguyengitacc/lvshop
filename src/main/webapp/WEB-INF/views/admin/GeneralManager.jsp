<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>LV Shop</title>

<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500"
	rel="stylesheet" />

<link
	href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css"
	rel="stylesheet" />


<link
	href="<c:url value="/template/Admin/assets/plugins/data-tables/datatables.bootstrap4.min.css"/>"
	rel='stylesheet'>


<!-- Css Styles -->
<link id="sleek-css" rel="stylesheet"
	href="<c:url value="/template/Admin/assets/css/sleek.css"/>" />

<script
	src="<c:url value="/template/Admin/assets/plugins/nprogress/nprogress.js"/>"></script>
</head>

<body class="header-fixed sidebar-fixed sidebar-dark header-light"
	id="body">

	<!-- ====================================
    ——— WRAPPER
    ===================================== -->
	<div class="wrapper">

		<!-- ====================================
          ——— LEFT SIDEBAR WITH OUT FOOTER
        ===================================== -->
		<aside class="left-sidebar bg-sidebar">
			<div id="sidebar" class="sidebar sidebar-with-footer">
				<!-- Aplication Brand -->
				<div class="app-brand">
					<a href="/lvshop/trang-chu/" title="Sleek Dashboard"> <span
						class="brand-name text-truncate">LV Shop</span>
					</a>
				</div>

				<!-- begin sidebar scrollbar -->
				<div class="" data-simplebar style="height: 100%;">
					<!-- sidebar menu -->
					<ul class="nav sidebar-inner" id="sidebar-menu">

						<li class="has-sub "><a class="sidenav-item-link" href="#"
							style="color: white; font-size: 1.005rem" aria-expanded="false"
							style="cursor: pointer;"> <i
								class="mdi mdi-pencil-box-multiple"></i> <span class="nav-text">Quản
									lí chung</span>
						</a></li>

						<li class="has-sub "><a class="sidenav-item-link"
							href="/lvshop/admin/danh-sach-hoa-don" aria-expanded="false"
							style="cursor: pointer;"> <i class="mdi mdi-cart"></i> <span
								class="nav-text">Hoá đơn</span>
						</a></li>
						<!--Products-->
						<li class="has-sub "><a class="sidenav-item-link"
							href="/lvshop/admin/danh-sach-san-pham" aria-expanded="false"
							style="cursor: pointer;"> <i class="mdi mdi-cellphone"></i> <span
								class="nav-text">Sản phẩm</span>
						</a></li>						
						<!--Account-->
						<li class="has-sub "><a class="sidenav-item-link"
							href="/lvshop/admin/danh-sach-tai-khoan" aria-expanded="false"
							style="cursor: pointer;"> <i class="mdi mdi-account"></i> <span
								class="nav-text">Tài khoản</span>
						</a></li>
					</ul>
				</div>

			</div>
		</aside>


		<!-- ====================================
        ——— PAGE WRAPPER
        ===================================== -->
		<div class="page-wrapper">

			<!-- Header -->
			<header class="main-header " id="header">
				<nav class="navbar navbar-static-top navbar-expand-lg">
					<!-- Sidebar toggle button -->
					<button id="sidebar-toggler" class="sidebar-toggle">
						<span class="sr-only">Toggle navigation</span>
					</button>
					<!-- search form -->
					<div class="search-form d-none d-lg-inline-block"></div>

					<div class="navbar-right ">
						<ul class="nav navbar-nav">
							<li class="dropdown notifications-menu custom-dropdown">
								<button
									class="dropdown-toggle notify-toggler custom-dropdown-toggler">
									<i class="mdi mdi-bell-outline"></i>
								</button>

								<div
									class="card card-default dropdown-notify dropdown-menu-right mb-0">
									<div class="card-header card-header-border-bottom px-3">
										<h2>Thông báo</h2>
									</div>
									
									<div class="card-body px-0 py-3">

										<div class="tab-content" id="myTabContent3">
											<div class="tab-pane fade show active" id="home2"
												role="tabpanel" aria-labelledby="home2-tab">
												<ul class="list-unstyled" data-simplebar
													style="height: 360px">
													<c:if test="${watingOrderAmount!='0' }">
														<li><div
																class="media media-message media-notification">

																<div
																	class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-primary text-white">
																	<i class="mdi mdi-account-multiple-check font-size-20"></i>
																</div>

																<div class="media-body d-flex justify-content-between">
																	<div class="message-contents">
																		<h4 class="title">Hoá đơn chờ duyệt</h4>
																		<p class="last-msg font-size-14">${watingOrderAmount }
																			hoá đơn</p>
																		<a href="/lvshop/admin/danh-sach-hoa-don"
																			class="my-1 btn btn-sm btn-success">Đến trang hoá
																			đơn</a>
																	</div>
																</div>
															</div></li>

													</c:if>
													<c:if test="${watingOrderAmountToday!= '0' }">
														<li><div
																class="media media-message media-notification">

																<div
																	class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-primary text-white">
																	<i class="mdi mdi-account-multiple-check font-size-20"></i>
																</div>

																<div class="media-body d-flex justify-content-between">
																	<div class="message-contents">
																		<h4 class="title">Hoá đơn mới</h4>
																		<p class="last-msg font-size-14">${watingOrderAmountToday }
																			hoá đơn</p>
																		<a href="/lvshop/admin/danh-sach-hoa-don"
																			class="my-1 btn btn-sm btn-warning">Đến trang hoá
																			đơn</a>
																	</div>
																</div>
															</div></li>

													</c:if>
												</ul>
											</div>

										</div>
									</div>
								</div>

							</li>
							<li class="right-sidebar-in right-sidebar-2-menu"><i
								class="mdi mdi-settings mdi-spin"></i></li>
							<!-- User Account -->
							<li class="dropdown user-menu"><a href="#"
								class="dropdown-toggle nav-link" data-toggle="dropdown"> <c:choose>
										<c:when
											test="${sessionScope.UserSession.accInfor.name != null }">
											<span class="d-none d-lg-inline-block">${sessionScope.UserSession.accInfor.name }</span>
										</c:when>
										<c:otherwise>
											<span class="d-none d-lg-inline-block">${sessionScope.UserSession.accInfor.username }</span>
										</c:otherwise>
									</c:choose>
							</a>
								<ul class="dropdown-menu dropdown-menu-right"
									style="overflow: hidden; text-overflow: ellipsis;">
									<!-- User image -->
									<li class="dropdown-header" x><img
										style="width: 10%; height: 5vh"
										src="<c:url value="${sessionScope.UserSession.accInfor.avatar }"/>"
										class="img-circle" alt="x" />
										<div class="d-inline-block">
											<c:choose>
												<c:when
													test="${sessionScope.UserSession.accInfor.name != null }">
											${sessionScope.UserSession.accInfor.name }
										</c:when>
												<c:otherwise>
										${sessionScope.UserSession.accInfor.username }
										</c:otherwise>
											</c:choose>
											<small class="pt-1">${sessionScope.UserSession.accInfor.email }</small>
										</div></li>

									<li><a href="/lvshop/trang-chu/trang-ca-nhan"> <i
											class="mdi mdi-account"></i> Thông tin cá nhân
									</a></li>
									<li class="dropdown-footer"><a href="/lvshop/admin/log-out">
											<i class="mdi mdi-logout"></i> Đăng xuất
									</a></li>
								</ul></li>
						</ul>
					</div>
				</nav>
			</header>


			<!-- ====================================
          ——— CONTENT WRAPPER
          ===================================== -->
			<div class="content-wrapper">
				<div class="content">


					<!-- Top Statistics -->
					<div class="row">												<div class="col-xl-6 col-sm-6">
							<div class="card card-mini mb-4 badge-warning">
								<div class="card-body">
									<h2 class="mb-1">${totalOrderToday }</h2>
									<p style="color: white;">Số hoá đơn hôm nay</p>

								</div>
							</div>
						</div>
						<div class="col-xl-6 col-sm-6">
							<div class="card card-mini mb-4 badge-info">
								<div class="card-body">
									<h2 class="mb-1">${totalEarnToday }</h2>
									<p>Thu nhập hôm nay</p>

								</div>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-xl-6">

							<!-- Top Customers -->
							<div class="card card-table-border-none" style="height: 560px;">
								<div class="card-header justify-content-between ">
									<h2>Khách hàng đầu</h2>
								</div>
								<div class="card-body pt-0" data-simplebar>
									<table class="table ">
										<tbody>
											<c:if test="${lstTopAcc != null }">
												<c:forEach var="item" items="${lstTopAcc }">
													<tr>
														<td>
															<div class="media">
																<!-- <div class="media-image mr-3 rounded-circle">
																	<a href="#"><img class="rounded-circle w-45"
																		src="#" alt="customer image"></a>
																</div> -->
																<div class="media-body align-self-center">
																	<a href="#"><h6
																			class="mt-0 text-dark font-weight-medium">${item.username }</h6></a>
																	<small>${item.name }</small>
																</div>
															</div>
														</td>
														<td>${item.bills.size() }&nbsp;hoá&nbsp;đơn</td>
														<td class="text-dark d-none d-md-block">${item.totalSpend }</td>
													</tr>
												</c:forEach>

											</c:if>
										</tbody>
									</table>
								</div>
							</div>

						</div>

						<div class="col-xl-6">

							<!-- Top Products -->
							<div class="card card-default" style="height: 560px;">
								<div class="card-header justify-content-between mb-4">
									<h2>Sản phẩm hàng đầu</h2>

								</div>
								<div class="card-body py-0">
									<c:if test="${not empty lstTopPro }">
										<c:forEach var="item" items="${lstTopPro }">
											<div class="media d-flex mb-5">
												<div class="media-image align-self-center mr-3 rounded">

													<c:choose>
														<c:when test="${item.image == '' }">
															<a href="#"><img style="height: 100px; width: 100px"
																src="<c:url value="/resources/default.png"/>"
																alt="customer image"></a>
														</c:when>
														<c:otherwise>
															<a href="#"><img style="height: 100px; width: 100px"
																src="<c:url value="${item.image }"/>"
																alt="customer image"></a>
														</c:otherwise>
													</c:choose>

												</div>
												<div class="media-body align-self-center">
													<a
														href="/lvshop/admin/danh-sach-san-pham/chi-tiet-san-pham?idSanPham=${item.id }"><h6
															class="mb-3 text-dark font-weight-medium">${item.name }</h6></a>
													<p class="float-md-right">
														<span class="text-dark mr-2">${item.soldQuantity }</span>&nbsp;hoá&nbsp;
														đơn
													</p>
													<p class="mb-0">
														<c:choose>
															<c:when test="${item.promotionPrice == '0.00' }">
																<span class="text-dark ml-3">${item.price }</span>
															</c:when>
															<c:otherwise>
																<del>${items.price }</del>
																<span class="text-dark ml-3">${item.promotionPrice }</span>
															</c:otherwise>
														</c:choose>

													</p>
												</div>
											</div>

										</c:forEach>
									</c:if>
								</div>
							</div>

						</div>

						
					</div>

				</div>
				<!-- End Content -->
			</div>
			<!-- End Content Wrapper -->
		</div>
		<!-- End Page Wrapper -->
	</div>
	<!-- End Wrapper -->
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



	<!-- Javascript -->
	<script
		src="<c:url value="/template/Admin/assets/plugins/jquery/jquery.min.js"/>"></script>
	<script
		src="<c:url value="/template/Admin/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

	<script
		src="<c:url value="/template/Admin/assets/plugins/data-tables/jquery.datatables.min.js"/>"></script>
	<script
		src="<c:url value="/template/Admin/assets/plugins/data-tables/datatables.bootstrap4.min.js"/>"></script>

	<script src="<c:url value="/template/Admin/assets/js/sleek.js"/>"></script>
</body>
</html>

