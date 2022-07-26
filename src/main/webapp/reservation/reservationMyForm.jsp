<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/headfoot/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script/reservation.js"></script>

</head>
<body> 
	<c:if test="${empty loginUser }">
		<jsp:forward page="/BoardServlet?command=log_in_form" />
	</c:if>

	<section class="container">
	<h5>${loginUser.name}(${loginUser.userid})님의 예약 내역</h5>
		<div class="row">

			<c:forEach var="RLi" items="${RLi }">
				<div class="col-sm-5"
					style="margin: 10px; padding: 10px; border: 1px solid #d3d3d3; border-radius: 10px;">
					<div class="card">
						<div class="card-title">
							<p class="card-text">${RLi.publicName}</p>
						</div>
						<div class="card-body">
							<span style="color: red;">이용날짜:${RLi.svcDate}<br></span>
							<span>예약날짜:<fmt:formatDate  pattern="yyyy-MM-dd" value="${RLi.rDate}" /><br></span>
							<div>
								<form class="form-inline mt-3" name="frm" method="post" action="BoardServlet">
								<input type="hidden" name="command" value="reservation_delete">
											<input type="hidden" name="userid" value="${loginUser.userid}">		
											<input type="hidden" name="rNum" value="${RLi.rNum }">
											<button class="btn btn-danger modify" onclick="return confirm('취소하시겠습니까?')"  type="submit">예약 취소</button>
								</form>
							</div>
							<div class="col-4 text-right"></div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<c:set var="page" value="${(empty param.p)?1:param.p }" />
		<c:set var="startNum" value="${page-(page-1)%5 }" />

		<c:set var="lastNum"
			value="${fn: substringBefore(Math.ceil(count/10), '.')}" />

		<div class="indexer margin-top align-right">
			<h3 class="hidden">현재페이지</h3>
			<div>
				<span class="text-orange text-strong">${(empty param.p)?1:param.p}</span>
				/ ${lastNum } pages
			</div>
		</div>
		<div class="margin-top align-center pager">
			<ul class="-list-center">

				<li><c:if test="${startNum > 1}">
						<a href="BoardServlet?command=board_list&p=${startNum-1}&t=&q="><span
							class="glyphicon glyphicon-chevron-left"></span></a>

					</c:if> <c:if test="${startNum <= 1}">
						<span class="glyphicon glyphicon-chevron-left"
							onclick="alert('이전 페이지가 없습니다.');"></span>
					</c:if></li>

				<c:forEach var="i" begin="0" end="4">
					<c:if test="${(startNum+i) <= lastNum }">
						<li><a
							href="BoardServlet?command=board_list&p=${startNum+i}&f=${param.f }&q=${param.q}">${startNum+i}</a>
						</li>
					</c:if>
				</c:forEach>

				<li><c:if test="${startNum+4 < lastNum}">
						<a href="BoardServlet?command=board_list&p=${startNum+5}&t=&q="><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</c:if> <c:if test="${startNum+4 >= lastNum}">
						<span class="glyphicon glyphicon-chevron-right"
							onclick="alert('다음 페이지가 없습니다.');"></span>
					</c:if></li>
			</ul>
		</div>
	</section>

<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-hidden="true"
	aria-labelledby="modal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal">예약 내역</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-row">
					<div class="form-group col-sm-6">
						<label>아이디</label><input id="Ruserid"  name="Ruserid" type="text"
							class="form-control" maxlength="30" readonly>
					</div>
					<div class="form-group col-sm-6">
						<label>예약날짜</label> <input id="RDate"  type="text"  name="RDate"
							class="form-control" maxlength="30" readonly>
					</div>
					<div class="form-group">
						<label>이용날짜</label> <input id="RPDate" type="text"  name="RPDate"
							 class="form-control" maxlength="30" readonly>
					</div>

					<div class="form-group">
						<label>예약시설</label> <input id="RPublicName"  type="text" class="form-control"
							maxlength="30" readonly>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<a class="btn btn-danger modify"
						href="BoardServlet?command=reservation_delete&rNum=${reserV.rNum }">예약 취소</a>
				</div>
			</div>
		</div>
	</div>
</div>





	<jsp:include page="/headfoot/footer.jsp" />
</body>



</html>