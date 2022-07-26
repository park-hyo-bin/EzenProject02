<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/headfoot/header.jsp"%>
<!DOCTYPE  html>
<html>
<head>
<title>게시판 글쓰기</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="script/board.js"></script>
</head>
<body>

	<c:if test="${empty loginUser }">
		<jsp:forward page="/BoardServlet?command=log_in_form" />
	</c:if>
	
	
	<div class="container">
		<form enctype="multipart/form-data" name="frm" method="post" action="BoardServlet">
			<input type="hidden" name="command" value="board_write">
			<input type="hidden" name="bNum" value="${board.bNum }">
			<table class="table table-bordered table-hover"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="4"><h4>공지사항 작성</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><h5>작성자</h5></td>
						<td style="width: 110px;">*필수<input type="text" size="12"
							name="userid" value="${loginUser.userid }" readonly></td>
					</tr>

					<tr>
						<td><h5>제목</h5></td>
						<td style="width: 110px;"><input type="text" size="70"
							name="bTitle" ></td>
					</tr>
					<tr>
						<td><h5>내용</h5></td>
						<td style="width: 110px;"><textarea cols="70" rows="15" name="bContent"></textarea></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>파일업로드</h5></td>
						<td colspan="2">
							<div class="input-droup col-xs-12">
							<input type="file" name = "uploadFile01"><br>
							<input type="file" name = "uploadFile02"><br>
							<input type="file" name = "uploadFile03"><br>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: left;">
							<h5 style="color: red;"></h5> 
						
							<input type="submit" value="등록" onclick="return boardCheck()" class="btn btn-primary pull-right">
							<input type="reset" value="다시 작성" class="btn btn-primary pull-right"> 
							<input type="button" value="목록" class="btn btn-primary pull-right" onclick="location.href='BoardServlet?command=board_list'">
						
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>


	<jsp:include page="/headfoot/footer.jsp" />
	
	
</body>
</html>