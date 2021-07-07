<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ĐĂNG NHẬP</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/template/TranHaiLong/login1.css"/>" />
</head>
<style>
</style>
<body>
	<div class="login-wrap">
		<div class="login-html">
			<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
				for="tab-1" class="tab">Đăng nhập</label> <input id="tab-2"
				type="radio" name="tab" class="sign-up"><label for="tab-2"
				class="tab">Đăng kí</label>
			<div class="login-form">
				<div class="sign-in-htm">
					<p style="color: red">${message}</p>
					<form:form id="loginForm" action="login" method="POST"
						modelAttribute="loginBean">
						<div class="group">
							<label for="user" class="label">Tên đăng nhập</label> <input
								id="username" type="text" name="username" class="input"
								placeholder="Nhập vào tên đăng nhập" required autofocus />
						</div>
						<div class="group">
							<label for="pass" class="label">Mật khẩu</label> <input
								id="password" type="password" name="password" class="input"
								placeholder="Nhập vào mật khẩu" data-type="password" required
								autofocus />
						</div>
						<div class="group">
							<input type="submit" class="button" value="Đăng nhập">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
						<a style="margin-right: 10vw;" href="/lvshop/trang-chu/">Về trang chủ</a>
							<a href=<c:url value ="/forgotPassword"/>>Quên mật khẩu?</a>
						</div>
					</form:form>
				</div>
				<div class="sign-up-htm">
					<form:form modelAttribute="loginBean" action="register"
						method="POST">

						<div class="group">
							<label for="user" class="label">Tên đăng nhập</label> <input
								id="username" name="username" type="text" class="input"
								placeholder="Nhập vào tên đăng nhập">
							<form:errors style="color: red" path="username" />
						</div>

						<div class="group">

							<label for="name" class="label">Tên</label> <input id="name"
								name="name" type="text" class="input"
								placeholder="Nhập vào họ tên">
							<form:errors style="color: red" path="name"></form:errors>
						</div>

						<div class="group">
							<label for="pass" class="label">Mật khẩu</label> <input
								id="password" name="password" type="password" class="input"
								data-type="password" placeholder="Nhập vào mật khẩu">
							<form:errors style="color: red" path="password"></form:errors>
						</div>

						<div class="group">
							<label for="pass" class="label">Nhập lại mật khẩu</label> <input
								id="passwordConfirm" name="passwordConfirm" type="password"
								class="input" data-type="password"
								placeholder="Nhập vào mật khẩu">
							<form:errors style="color: red" path="passwordConfirm"></form:errors>
						</div>

						<div class="group">
							<label for="gender" class="label">Giới tính</label> <input
								type="radio" id="gender" name="gender" value=1 name="gender"
								checked> Nam <input type="radio" id="gender"
								name="gender" value=0 name="gender"> Nữ <input
								type="radio" id="gender" name="gender" value=2 name="gender">
							Khác
						</div>
						<div class="group">
							<label for="email" class="label">email</label> <input id="email"
								name="email" type="email" class="input"
								placeholder="Nhập vào địa chỉ email">
							<form:errors style="color: red" path="email"></form:errors>
						</div>
						<div class="group">
							<label for="email" class="label">Phone</label> <input id="phone"
								name="phone" type="text" class="input"
								placeholder="Nhập vào số điện thoại">
							<form:errors style="color: red" path="phone"></form:errors>
						</div>
						<div class="group">
							<input type="submit" class="button" value="Đăng ký">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<label for="tab-1">Đã có tài khoản?</label>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>