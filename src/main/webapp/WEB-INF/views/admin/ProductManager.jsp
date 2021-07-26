<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
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


						<li class="has-sub "><a class="sidenav-item-link"
							href="/lvshop/admin/quan-li-chung" aria-expanded="false"
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
							href="/lvshop/admin/danh-sach-san-pham"  style="color: white; font-size: 1.005rem" aria-expanded="false"
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
									<li class="dropdown-header"><img
										style="width: 10%; height: 5vh" src="<c:url value="${sessionScope.UserSession.accInfor.avatar }"/>"
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
				<form id="productDetailForm"
					method="POST"
					enctype="multipart/form-data">

					<div class="content">
						<div class="row">

							<div class="col-lg-12">
								<div class="card card-default">
									<div class="card-header card-header-border-bottom">
										<h2>Ảnh minh hoạ</h2>
									</div>
									<div class="row">
										<div class="card-body col-lg-6">
											<div class="form-group" style="margin-top: 15%;">
												<label>Thêm ảnh</label>
												<div class="input-group">
													<input type="file" class="custom-file-input"
														onchange="checkContent()" id="coverImage" required
														name="anhMinhHoa"
														accept="image/x-png,image/gif,image/jpeg"> <label
														class="custom-file-label" id="labelCoverImage"
														for="coverImage">Chọn ảnh...</label>
												</div>
											</div>
										</div>
										<div class="card-body col-lg-6">
											<div class="input-group d-flex justify-content-center">
												<c:choose>
													<c:when test="${productDetail.image!='' }">
														<img id="contentCoverImage"
															src="<c:url value="${productDetail.image }"/>"
															style="height: 35vh;" />
													</c:when>
													<c:otherwise>
														<img id="contentCoverImage"
															src="<c:url value="/resources/default.png"/>"
															style="height: 35vh;" />
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>

								</div>
							</div>
							<div class="col-lg-6" style="margin-bottom: 1.5rem;">
								<div class="card card-default" style="height: 100%;">
									<div class="card-header card-header-border-bottom">
										<h2>Thông tin chung</h2>
									</div>
									<div class="card-body">
										<div class="form-group">
											<label>Mã sản phẩm </label>
											<div class="input-group">
												<input type="text" class="form-control" name="idSanPham"
													id="idProduct"
													placeholder="Mã sẽ được tạo tự động nếu thêm mới" readonly
													value="${productDetail.id }" required>
											</div>
										</div>
										<div class="form-group">
											<label>Tên sản phẩm</label>
											<div class="input-group">
												<input type="text" class="form-control" required
													name="tenSanPham" value="${productDetail.name }">
											</div>
										</div>
										<div class="form-group">
											<label>Giá gốc <span style="color: red">*</span></label>
											<div class="input-group">
												<input type="text" class="form-control" required
													name="giaGoc" value="${productDetail.originalPrice }"
													data-toggle="tooltip" data-placement="top"
													title="Bạn nên nhập một số định dạng abc.xy">
											</div>
										</div>
										<div class="form-group">
											<label>Giá bán <span style="color: red">*</span></label>
											<div class="input-group">
												<input type="text" class="form-control" required
													name="giaBan" value="${productDetail.price }"
													data-toggle="tooltip" data-placement="top"
													title="Bạn nên nhập một số định dạng abc.xy">
											</div>
										</div>
										<div class="form-group">
											<label>Giá khuyến mãi <span style="color: red">*</span></label>
											<div class="input-group">
												<input type="text" class="form-control" required
													name="giaKhuyenMai"
													value="${productDetail.promotionPrice }"
													data-toggle="tooltip" data-placement="top"
													title="Bạn nên nhập một số định dạng abc.xy">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-6">
								<div class="row">

									<div class="col-lg-12">

										<div class="card card-default">
											<div class="card-header card-header-border-bottom">
												<h2>Thông tin size</h2>
											</div>
											<div class="row">
												<div class="card-body col-lg-6">
													<div class="form-group">
														<label>Size</label>
														<div class="input-group">
															<select class="form-control" id="selectSize"
																onchange="changeAmountHandler(this.value)">
																<option value="1|0">Chọn size</option>
																<c:if test="${productDetail != null }">
																	<c:forEach var="item"
																		items="${productDetail.productHasSizes }">
																		<option value="${item.size.id }|${item.amount}">${item.size.name }</option>
																	</c:forEach>
																</c:if>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label>Số lượng</label>
														<div class="input-group">
															<input type="number" class="form-control" 
																id="sizeAmount" name="soLuongSize" value="0"
																data-toggle="tooltip" data-placement="top"
																title="Bạn nên nhập một số nguyên dương"> <input
																type="hidden" class="form-control" name="idSize"
																id="sizeIDHidden" value="1">
														</div>
													</div>
												</div>
												<div class="card-body col-lg-6">

													<div class="form-group">
														<label>Thêm size</label>
														<div class="input-group">
															<input type="text" class="form-control"
																placeholder="Tên size" id="newSizeName">
														</div>
													</div>
													<div class="input-group d-flex justify-content-end">
														<button type="button" onclick="addSizeHandler()"
															class="btn btn-success mb-2 btn-pill m-3">Xác
															nhận thêm</button>
													</div>
												</div>
											</div>

										</div>
									</div>

									<div class="col-lg-12">
										<div class="card card-default">
											<div class="card-header card-header-border-bottom">
												<h2>Thông tin thương hiệu</h2>
											</div>
											<div class="row">
												<div class="card-body col-lg-6">
													<div class="form-group">
														<label>Thương hiệu</label>
														<div class="input-group">
															<select class="form-control" name="idThuongHieu"
																id="selectTrade">
																<c:if test="${productDetail != null }">
																	<option value="${productDetail.trademark.id }">${productDetail.trademark.name }</option>
																</c:if>
																<c:forEach var="item" items="${lstTrademark }">
																	<option value="${item.id }">${item.name }</option>
																</c:forEach>
															</select>
														</div>
													</div>


												</div>
												<div class="card-body col-lg-6">
													<div class="form-group">
														<label>Thêm thương hiệu</label>
														<div class="input-group">
															<input type="text" class="form-control"
																placeholder="Tên thương hiệu mới" id="newTrademark">
														</div>
													</div>
													<div class="input-group d-flex justify-content-end">
														<button type="button" onclick="addTrademarkHandler()"
															class="btn btn-success mb-2 btn-pill m-3">Xác
															nhận thêm</button>
													</div>
												</div>

											</div>

										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="card card-default">
									<div class="card-header card-header-border-bottom">
										<h2>Thông tin chi tiết</h2>
									</div>
									<div class="card-body">
										
										
										
										<div class="form-group">
											<label>Mô tả sơ lược sản phẩm</label>
											<div class="input-group">
												<textarea class="form-control" rows="10" name="moTa">${productDetail.description }</textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<footer class=" d-flex justify-content-center footer mt-auto">
							<button type="button" id="addButton" onclick="addSubmit()"
								data-toggle="tooltip" data-placement="top"
								title="Khi thêm sản phẩm một mã sản phẩm mới sẽ được tạo tự động. Khi thêm sản phẩm sẽ không bao gồm các thông tin về size"
								class="btn btn-success mb-2 btn-pill m-3">Thêm sản phẩm</button>
							<c:choose>
								<c:when test="${empty productDetail}">
									<button type="button" id="updateButton" disabled="disabled"
										class="btn btn-light mb-2 btn-pill m-3">Cập nhật</button>
									<button type="button" id="deleteButton" disabled="disabled"
										class="btn btn-light mb-2 btn-pill m-3">Xoá sản phẩm
										này</button>
								</c:when>
								<c:otherwise>
									<button type="button" id="updateButton"
										onclick="updateSubmit()"
										class="btn btn-primary mb-2 btn-pill m-3">Cập nhật</button>
									<button type="button" id="deleteButton"
										onclick="deleteSubmit()"
										class="btn btn-danger mb-2 btn-pill m-3" data-toggle="tooltip"
										data-placement="top"
										title="Chỉ xoá được các sản phẩm không được bình luận, rating, đặt mua lần nào">Xoá
										sản phẩm này</button>
								</c:otherwise>
							</c:choose>

						</footer>

					</div>
					<!-- End Content -->
				</form>
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
	<form
		action="/lvshop/admin/danh-sach-san-pham/chi-tiet-san-pham?idSanPham=${productDetail.id }"
		id="reloadTrick"></form>

	<form action="/lvshop/admin/danh-sach-san-pham" id="combackTrick"></form>


	<!-- Javascript -->
	<script
		src="<c:url value="/template/Admin/assets/plugins/jquery/jquery.min.js"/>"></script>
	<script
		src="<c:url value="/template/Admin/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<script src="<c:url value="/template/Admin/assets/js/sleek.js"/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js" integrity="sha512-37T7leoNS06R80c8Ulq7cdCDU5MNQBwlYoy1TX/WUsLFC2eYNqtKlV0QjH7r8JpG/S0GUMZwebnVFLPd6SU5yg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript">
		function changeAmountHandler(x) {
			var lstValue = x.split('|');
			var elementAmount = $("#sizeAmount");
			var elementID =$("#sizeIDHidden");
			elementAmount.html(lstValue[1]);
			elementAmount.val(lstValue[1]);
			elementID.val(lstValue[0]);
		}
	
		function addSizeHandler() {
			var sizeName = $("#newSizeName");
			var idProduct = $("#idProduct");
			var reGex = /^[a-zA-Z]{1,10}$/gi;
			if(!reGex.test(sizeName.val())){
				$("#contentForCartAction").html("Vui lòng nhập đúng định dạng");
				$("#modalCart").modal('show');
				return;
			}
			$.ajax({
				url: "/lvshop/admin/api/san-pham/size?tenSizeMoi="+sizeName.val()+"&idSanPham="+idProduct.val(),
				type: 'POST',
				success:(response)=>{
					var objJson = JSON.parse(response);
					console.log(objJson);
					if(objJson.status == 1){
						$("#contentForCartAction").html("Cập nhật thành công, nhưng đã xảy ra lỗi ở server| Vui lòng tải lại trang");
						$("#modalCart").modal('show');
					}
					else if(objJson.status == 2){
						$("#contentForCartAction").html("Cập nhật thất bại");
						$("#modalCart").modal('show');
						
					}
					else if(objJson.status == 3){
						$("#contentForCartAction").html("Lỗi! Bạn chưa đăng nhập");
						$("#modalCart").modal('show');
						setTimeout(()=>$("#bodyHTML").click(reloadPage()),1000);
					}
					else{
						$("#contentForCartAction").html("Cập nhật thành công");
						$("#modalCart").modal('show');
						$('#selectSize').append($('<option>', {value:objJson.id+"|0", text:objJson.name}));
					}
				},
				error:(error)=>{
					$("#contentForCartAction").html("Đã xảy ra lỗi");
					$("#modalCart").modal('show');
					return;
				}
			})
							
		}	
		
		function addTrademarkHandler(){
			var tradeName = $("#newTrademark");
			if(tradeName.val() == ""){				
				$("#contentForCartAction").html("Vui lòng nhập tên thương hiệu");
				$("#modalCart").modal('show');
				return;
			}
			$.ajax({
				url: "/lvshop/admin/api/thuong-hieu?tenThuongHieuMoi="+tradeName.val(),
				type: 'POST',
				success:(response)=>{
					var objJson = JSON.parse(response);
					console.log(objJson.status)
					if(objJson.status == 1){
						$("#contentForCartAction").html("Cập nhật thành công, nhưng đã xảy ra lỗi ở server| Vui lòng tải lại trang");
						$("#modalCart").modal('show');
					}
					else if(objJson.status == 2){
						$("#contentForCartAction").html("Cập nhật thất bại");
						$("#modalCart").modal('show');
						
					}
					else if(objJson.status == 3){
						$("#contentForCartAction").html("Lỗi! Bạn chưa đăng nhập");
						$("#modalCart").modal('show');
						setTimeout(()=>$("#bodyHTML").click(reloadPage()),1000);
					}
					else{
						$("#contentForCartAction").html("Cập nhật thành công");
						$("#modalCart").modal('show');
						$('#selectTrade').append($('<option>', {value:objJson.id, text:objJson.name}));
						
					}
				},
				error:(error)=>{
					$("#contentForCartAction").html("Đã xảy ra lỗi");
					$("#modalCart").modal('show');
					return;
				}
			})		
		}

		function reloadPage(){
			$("#reloadTrick").submit();
		}
		
		function combackPage(){
			$("#combackTrick").submit();
		}
		
		
		function addSubmit(){
			$("#productDetailForm").attr("action","/lvshop/admin/danh-sach-san-pham/chi-tiet-san-pham/them");
			$("#productDetailForm").submit();
		}
		
		function updateSubmit(){
			var x = $("#sizeAmount");
			if(x.val()<0){
				$("#contentForCartAction").html("Số lượng size nên là một số nguyên dương");
				$("#modalCart").modal('show');
				return;
			}
			$("#productDetailForm").attr("action","/lvshop/admin/danh-sach-san-pham/chi-tiet-san-pham/cap-nhat");
			$("#productDetailForm").submit();
		}
		
		function deleteSubmit(){
			$.ajax({
				url: "/lvshop/admin/api/san-pham?"+$("#productDetailForm").serialize(),
				type: 'DELETE',
				success:(response)=>{
					var objJson = JSON.parse(response);
					if(objJson.status == 1){
						$("#contentForCartAction").html("Cập nhật thành công");
						$("#modalCart").modal('show');
						setTimeout(()=>combackPage(),1000);
					}
					else if(objJson.status == 2){
						$("#contentForCartAction").html("Cập nhật thất bại");
						$("#modalCart").modal('show');
						
					}
					else if(objJson.status == 3){
						$("#contentForCartAction").html("Lỗi! Bạn chưa đăng nhập");
						$("#modalCart").modal('show');
						setTimeout(()=>combackPage(),1000);
					}
				},
				error:(error)=>{
					$("#contentForCartAction").html("Lỗi đường truyền");
					$("#modalCart").modal('show');
					return;
				}
			})			
		}
		
		
		function checkContent() {
			var x = $("#coverImage");
			$("#labelCoverImage").html(x.val());
		}
	</script>
</body>
</html>

