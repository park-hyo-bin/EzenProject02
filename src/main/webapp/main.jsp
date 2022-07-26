<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/headfoot/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3"></script>
</head>
<body>
	<section class="container">

		<div class="col-sm-12">
			<a href="BoardServlet?command=main_page" target="_blank"> <img
				src="./images/seoul.png" width="20%" height="100" alt="ISEOULYOU"
				class="card-img-top"
				style="margin-left: auto; margin-right: auto; display: block;">
			</a>
		</div>
		<div class="row row-cols-1 row-cols-md-2 g-4">
			<div class="col-sm-6"
				style="height: 270px; width: 530px; margin: 2%; padding: 20px; border: 1px solid #d3d3d3; border-radius: 10px; display: block">
				<div class="card">
					<div class="card-header">
						공지사항
						<div style="text-align: center; float: right; font-size: 25px;">
							<a href="BoardServlet?command=board_list">+</a>
						</div>
					</div>

					<div class="card-body">

						<table class="table table-striped">
							<tbody>
								<c:forEach var="NewsList" items="${boardNewsList }">
									<tr class="record" align="left">
										<td><a
											href="BoardServlet?command=board_view&bNum=${NewsList.bNum }">${NewsList.bTitle }</a></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${NewsList.writedate }" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-sm-6"
				style="height: 270px; width: 530px; margin: 2%; padding: 20px; border: 1px solid #d3d3d3; border-radius: 10px; display: block">
				<div class="card">
					<div class="card-header">나의 예약 내역</div>
					<hr>
					<div class="card-body">
						<h5 class="card-title"></h5>
						<p class="card-text">
							예약서비스를 신청하셨나요? <br> 편리하게 예약내역을 확인해보세요.
						</p>
						<a href="BoardServlet?command=reservation_my_form">예약 내역 확인하기</a>
					</div>
				</div>
			</div>
			<div class="col-sm-6"
				style="height: 270px; width: 530px; margin: 2%; padding: 20px; border: 1px solid #d3d3d3; border-radius: 10px; display: block">
				<div class="card">
					<div class="card-header">
						자주 묻는 질문
						<div style="text-align: center; float: right; font-size: 25px;">
							<a href="BoardServlet?command=question">+</a>
						</div>
					</div>
					<hr>
					<div class="card-body">
						<h5 class="card-title"></h5>
						<table class="table table-striped">
							<tbody>
								<c:forEach var="NQList" items="${NQList }">
									<tr class="record" align="left">
										<!--  	<td><a data-toggle="modal" href="#QuestionModal"></a></td>-->
										<td><a
											href="BoardServlet?command=question&qNum=${NQList.qNum }">${NQList.qTitle }</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-sm-6"
				style="height: 270px; width: 530px; margin: 2%; padding: 20px; border: 1px solid #d3d3d3; border-radius: 10px; display: block">
				<div class="card">
					<div class="card-header">
						도움말
						<div style="text-align: center; float: right; font-size: 25px;">
							<a href="BoardServlet?command=helpfunction">+</a>
						</div>
					</div>
					<hr>
					<div class="card-body">
						<h5 class="card-title"></h5>
						<p class="card-text">
							<a href="BoardServlet?command=help_function">공공서비스 예약서비스 이용 시
								필수 준수사항을 확인하세요.</a>

						</p>

					</div>
				</div>
			</div>

		</div>
	</section>


	<jsp:include page="/headfoot/footer.jsp" />
	<script src="/.js/jquery.min.js"></script>
	<script src="/.js/pooper.js"></script>
	<script src="/.js/bootstrap.min.js"></script>
</body>
</html>