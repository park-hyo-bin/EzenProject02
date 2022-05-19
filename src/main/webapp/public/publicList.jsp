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
<title>메뉴테스트</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3"></script>

</head>
<body>

	<section class="container">
		<form action="BoardServlet?command=public_list" method="post"
			name="frm" class="form-inline mt-3">
			<div class="container">
				<div class="search-form margin-top first align-right">

					<select name="f" class="form-control mx-1 mt-2">
						<option ${(param.f =="pAll")?"selected":"" } value="pAll">전체</option>
						<option value="전체">지역</option>
						<option value="전체">장소</option>
						<option value="전체">서비스명</option>
					</select> <input type="text" name="q" class="form-control mx-1 mt-2"
						placeholder="내용을 입력하세요" value="${param.q }"> <input
						class="btn btn-search" type="submit" value="검색" />

					<hr>
				</div>
			</div>
		</form>


	
			<div class="row">
				<c:forEach var="jsonArr" items="${jsonArray }">
					<div class="col-sm-5"
						style=" margin: 10px; padding: 10px; border: 1px solid #d3d3d3; border-radius: 10px;">
						<div class="card">
							<div class="card-title">
								${jsonArr.SVCNM } <br>
								<small>${jsonArr.MAXCLASSNM } - ${jsonArr.MINCLASSNM }</small>
							</div>
							<div class="card-body">
								<h5>장소: ${jsonArr.PLACENM } </h5>
								<h5>이용기간 : ${jsonArr.SVCOPNBGNDT } ~ ${jsonArr.SVCOPNENDDT }</h5>
								<h5>접수기간 : ${jsonArr.RCPTBGNDT } ~ ${jsonArr.RCPTENDDT }</h5>
								<a href="BoardServlet?command=public_view&SVCID=${jsonArr.SVCID }"
									type="submit" class="btn btn-primary">상세보기+</a>
								<div class="col-4 text-right">
									<span style="color: red;">${jsonArr.SVCSTATNM}</span> &nbsp; <span
										style="color: red;">${jsonArr.PAYATNM}</span>
								</div>
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
						<a href="BoardServlet?command=public_list&p=${startNum-1}&t=&q="><span
							class="glyphicon glyphicon-chevron-left"></span></a>

					</c:if> <c:if test="${startNum <= 1}">
						<span class="glyphicon glyphicon-chevron-left"
							onclick="alert('이전 페이지가 없습니다.');"></span>
					</c:if></li>

				<c:forEach var="i" begin="0" end="4">
					<c:if test="${(startNum+i) <= lastNum }">
						<li><a
							href="BoardServlet?command=public_list&p=${startNum+i}&f=${param.f }&q=${param.q}">${startNum+i}</a>


						</li>
					</c:if>
				</c:forEach>

				<li><c:if test="${startNum+4 < lastNum}">
						<a href="BoardServlet?command=public_list&p=${startNum+5}&t=&q="><span
							class="glyphicon glyphicon-chevron-right"></span></a>

					</c:if> <c:if test="${startNum+4 >= lastNum}">
						<span class="glyphicon glyphicon-chevron-right"
							onclick="alert('다음 페이지가 없습니다.');"></span>
					</c:if></li>

			</ul>

		</div>

	</section>


	<jsp:include page="/headfoot/footer.jsp" />
	<script src="/.js/jquery.min.js"></script>
	<script src="/.js/pooper.js"></script>
	<script src="/.js/bootstrap.min.js"></script>
</body>
</html>