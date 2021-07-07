<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ForgotPassword</title>
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
				for="tab-1" class="tab">Quên mật khẩu</label>
			<div class="login-form">
				<div class="sign-in-htm"></div>
				<p style="color: red">${message}</p>
				<form:form id="ForgotPassForm" action="forgotPassword" method="POST"
					modelAttribute="Bean">
					<div class="group">
						<label for="email" class="label">Địa chỉ Email</label> <input
							id="email" type="email" name="email" class="input"
							placeholder="Nhập vào Email của bạn" required autofocus />
						<form:errors style="color: red" path="email"></form:errors>
					</div>
					<div class="group">
						<input type="submit" class="button" value="Gửi">
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<a href=<c:url value ="/login"/>>Quay lại trang đăng nhập?</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>

</body>
</html>