<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/headfoot/header.jsp"%>
<%@ include file="/public/publicModal.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="script/board.css">
</head>
<body>

	<form class="form-inline mt-3" name="frm" method="post"
		action="BoardServlet">
		<input type="hidden" name="command" value="question">
		<div class="container">
			<div class="search-form margin-top first align-right">

				<h3 class="hidden">자주 묻는 질문 검색폼</h3>

				<fieldset>
					<legend class="hidden">검색 필드</legend>
					<label class="hidden">검색분류</label> <select name="f">
						<!--  	<option ${(param.f =="allsearch")?"selected":"" } value="allsearch">전체</option>-->
						<option ${(param.f =="qTitle")?"selected":"" } value="qTitle">질문</option>
					</select> <label class="hidden">검색어</label> <input type="text" name="q"
						placeholder="내용을 입력하세요" value="${param.q }" /> <input
						class="btn btn-search" type="submit" value="검색" />
				</fieldset>
				<div>
					<p>총 ${count }건 입니다.</p>
				</div>
			</div>


			<div class="row">
				<h3 class="hidden">목록</h3>
				<table class="table table-striped">
					<thead>
						<tr style="background-color: lightgray;">
							<th class="thstyle">자주 묻는 질문</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="QList" items="${QList }">
							<tr class="record" align="center">
								<td><a
									href="BoardServlet?command=question&qNum=${QList.qNum }">${QList.qTitle }</a></td>
							</tr>
							<c:if test="${OneQuestion.qNum == QList.qNum}">
								<th>${OneQuestion.qContent }</th>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
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
							<!--  <input type="hidden" name="p" value="${startNum-1 }" /> 
								<input class="btn btn-prev" type="submit" value="이전" />-->
						</c:if> <c:if test="${startNum <= 1}">
							<span class="glyphicon glyphicon-chevron-left"
								onclick="alert('이전 페이지가 없습니다.');"></span>
						</c:if></li>

					<c:forEach var="i" begin="0" end="4">
						<c:if test="${(startNum+i) <= lastNum }">
							<li><a
								href="BoardServlet?command=board_list&p=${startNum+i}&f=${param.f }&q=${param.q}">${startNum+i}</a>
								<!-- 	<input type="submit" name="p" value="${startNum+i}" /> -->

							</li>
						</c:if>
					</c:forEach>

					<li><c:if test="${startNum+4 < lastNum}">
							<a href="BoardServlet?command=board_list&p=${startNum+5}&t=&q="><span
								class="glyphicon glyphicon-chevron-right"></span></a>
							<!--	<input type="hidden" name="p" value="${startNum+5 }" /> 
								<input class="btn btn-next" type="submit" value="다음" />-->
						</c:if> <c:if test="${startNum+4 >= lastNum}">
							<span class="glyphicon glyphicon-chevron-right"
								onclick="alert('다음 페이지가 없습니다.');"></span>
						</c:if></li>

				</ul>


			</div>
		</div>
	</form>

	<jsp:include page="/headfoot/footer.jsp" />
</body>
</html>