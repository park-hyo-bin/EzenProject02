<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/headfoot/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Form</title>
<script type="text/javascript" src="script/member.js"></script>
<link rel="stylesheet" href="script/SignUpStyle.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
</head>
<body>
	
	<div class="sign-up-form">
	<h2>회원가입</h2>
	'*'표시 항목은 필수 입력 사항입니다.
	<form class="form-inline mt-3" name="frm" method="post" action="BoardServlet">
			<input type="hidden" name="command" value="jo_in">
		
		<input type="text" name="name" class="input-box" placeholder="*Your Name">
		<input type="text" name="userid" style="width: 280px" class="input-box" placeholder="Your ID">
		<input type="hidden" name="reid" class="input-box" placeholder="Your ID">
		<input type="button" class="btn btn-primary" value="중복체크" onclick="idCheck()">
		<input type="password" name="pwd" class="input-box" placeholder="Your PW">
		<input type="password" name="pwd_check" class="input-box" placeholder="*Your PW_Check">
		<input type="text" name="phone" class="input-box" placeholder="Your Phone">
		<input type="email" name="email" class="input-box" placeholder="Your Email"><p>
		<input type="radio" name="admin" value="0" checked="checked">일반회원
		<input type="radio" name="admin" value="1" >관리자
		<input type="text" name="adminpwd" placeholder="manager number" >
		<p><span><input type="checkbox" ></span>I agree to the terms of services</p>
		<button type="submit"  class="signup-btn" onclick="return joinCheck()">Sign up</button>	
		<table>
			<tr>
				<td colspan="2">${message}</td>
				</tr>
				</table>
		<hr>
		<p>Do you have an account ? <a href="BoardServlet?command=log_in_form">Sign in</a></p>
	</form>
	</div>
	
	<jsp:include page="/headfoot/footer.jsp" />
</body>
</html>