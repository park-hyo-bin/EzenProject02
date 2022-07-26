<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="script/LoginStyle.css">
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>				
<section class="login-form">
		<h1>LOGIN</h1>
		<form class="form-inline mt-3" name="frm" method="post" action="BoardServlet">
			<input type="hidden" name="command" value="log_in">
			<div class="int-area">
				
				<input type="text" name="userid" value="${userid}" autocomplete="off" required>
				<label for="id">USER ID</label>
			</div>
			<div class="int-area">
				<input type="password" name="pwd" autocomplete="off" required>	
				<label for="pw">PASSWORD</label>
			</div>
			<div class="btn-area">
			<button id="btn" type="submit"  onclick="return loginCheck()">LOGIN</button> 
			</div>
			<table>
			<tr>
				<td colspan="2">${message}</td>
				</tr>
				</table>
		</form>
		
		<div class="captionlink">
		<div class="left">
		<a href="BoardServlet?command=main_page">메인페이지로 이동</a>
		</div>
		<div  class="right">
		<a href="BoardServlet?command=jo_in_form">회원가입</a>
		</div>
		</div>
	</section>
	
</body>
</html>