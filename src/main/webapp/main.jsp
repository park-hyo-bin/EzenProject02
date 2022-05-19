<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/headfoot/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" href="script/mainStyle.css">

<link href="/nss/layout.css" type="text/css" rel="stylesheet" />
<link href="/nss/index.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<form class="main-form">
		<table>
			<tr>
				<td class="size">안녕하세요. ${loginUser.name}(${loginUser.userid})님</td>
			</tr>
		</table>
	</form>
	<jsp:include page="/headfoot/footer.jsp" />
</body>
</html>