<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/template/TranHaiLong/login1.css"/>" />
</head>
<body>
	<div class="login-wrap">
		<div class="login-html">
			<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
				for="tab-1" class="tab">Tạo lại mật khẩu</label>
			<div class="login-form">
				<div class="sign-in-htm"></div>
				<p style="color: red">${message}</p>
				<form:form id="ForgotPassForm" action="resetPassword" method="POST"
					modelAttribute="Bean1">
					<input type="hidden" name="token" value="${token}" />
					<div class="group">
						<label for="pass" class="label">Password</label> <input
							id="password" name="password" type="password" class="input"
							data-type="password" placeholder="Nhập vào mật khẩu" required autofocus>
						<form:errors style="color: red" path="password"></form:errors>
					</div>

					<div class="group">
						<label for="pass" class="label">Repeat Password</label> <input
							id="passwordConfirm" name="passwordConfirm" type="password"
							class="input" data-type="password"
							placeholder="Nhập lại mật khẩu" required autofocus>
						<form:errors style="color: red" path="passwordConfirm"></form:errors>
					</div>
					<div class="group">
						<input type="submit" class="button" value="Đổi mật khẩu">
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