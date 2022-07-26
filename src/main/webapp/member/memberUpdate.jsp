<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/headfoot/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>

</head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<body>

	<div class="container">
			<form class="form-inline mt-3" name="frm" method="post" action="BoardServlet">
			<input type="hidden" name="command" value="member_update">
			
			<table class="table table-bordered table-hover"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" ><h4>회원 수정</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" size="20" class="form-control"
							value="${mVO.name }"></td>
					</tr>

					<tr>
						<td>아이디</td>
						<td><input type="text" name="userid" size="20" class="form-control"
							value="${mVO.userid}" readonly></td>
					</tr>

					<tr>
						<td>암 &nbsp; 호&nbsp;*</td>
						<td><input type="password" name="pwd" size="20" class="form-control"></td>
					</tr>


					<tr height="30">
						<td>암호 확인&nbsp;*</td>
						<td><input type="password" name="pwd_check" size="20" class="form-control"></td>
					</tr>

					<tr>
						<td>이메일</td>
						<td><input type="email" name="email" size="20" class="form-control"
							value="${mVO.email }"></td>
					</tr>

					<tr>
						<td>전화번호</td>
						<td><input type="text" name="phone" size="20" class="form-control"
							value="${mVO.phone }"></td>
					</tr>

					<tr>
						<td>등급</td>
						<td><c:choose>
								<c:when test="${mVO.admin==0}">
									<input type="radio" name="admin" value="0" checked="checked">일반회원
							<input type="radio" name="admin" value="1">관리자
							<input type="text" name="adminpwd" placeholder="관리자 인증번호" >
					</c:when>
								<c:otherwise>
									<input type="radio" name="admin" value="0">일반회원
							<input type="radio" name="admin" value="1" checked="checked">관리자
							<input type="text" name="adminpwd" placeholder="관리자 인증번호" >
						</c:otherwise>
							</c:choose></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="확인" onclick="return joinCheck()">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="취소">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<jsp:include page="/headfoot/footer.jsp" />
</body>
</html>