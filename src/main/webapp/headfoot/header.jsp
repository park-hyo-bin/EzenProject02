<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/bootstrap.js"></script>
<title>서울특별시_공공서비스예약 조회</title>
</head>
<body>

	<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="BoardServlet?command=main_page">서울특별시_공공서비스예약</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">

				<li><a href="BoardServlet?command=main_page">메인</a></li>
				<li><a href="BoardServlet?command=public_list&Code=Sport">체육시설</a></li>
				<li><a
					href="BoardServlet?command=public_list&Code=Institution">공간시설</a></li>
				<li><a href="BoardServlet?command=public_list&Code=Culture">문화체험</a></li>
				<li><a href="BoardServlet?command=public_list&Code=Education">교육강좌</a></li>
				<li><a href="BoardServlet?command=public_list&Code=Medical">진료복지</a></li>
				<li><a href="BoardServlet?command=board_list">공지사항</a></li>

			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${!empty loginUser}">
					<li><h5>${loginUser.name}(${loginUser.userid})님<br> 환영합니다.</h5></li>
				</c:if>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">My page<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<c:choose>
							<c:when test="${empty loginUser }">
								<li><a href="BoardServlet?command=log_out">로그인</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="BoardServlet?command=log_out">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="BoardServlet?command=member_update_form">회원정보변경</a></li>
						<li><a href="BoardServlet?command=reservation_my_form">예약
								내역</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
</body>
</html>
