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
<!-- <link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3"></script> -->
</head>
<body>

	<section class="container">
	<form class="form-inline mt-3" name="frm" method="post" action="BoardServlet">
			<input type="hidden" name="command" value="public_list">
			<input type="hidden" name="Code" value="${Code }">
			<div class="container">
				<div  class="search-form margin-top first align-right">
					<select name="f" class="form-control mx-1 mt-2">
						<option ${(param.f =="AREANM")?"selected":"" } value="AREANM">지역</option>
						<option ${(param.f =="PLACENM")?"selected":"" } value="PLACENM">장소</option>
						<option ${(param.f =="SVCNM")?"selected":"" } value="SVCNM">서비스명</option>
						<option ${(param.f =="pAll")?"selected":"" } value="pAll">전체</option>
					</select> <input type="text" name="q" class="form-control mx-1 mt-2"
						placeholder="내용을 입력하세요" value="${param.q }"> <input
						class="btn btn-search" type="submit" value="검색" />
				</div>
			</div>
		</form>
		
		<hr>
		
	
		<div>
			<form class="form-inline mt-3" name="frm" method="post" action="BoardServlet">
				<input type="hidden" name="command" value="public_list">
				<input type="hidden" name="Code" value="${Code }">
					<button style=" margin: 5px;" class="btn btn-light" type="submit" name="c" value="">전체</button>
				<c:choose>
					<c:when test="${Code eq 'Sport'}">
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="축구장">축구장</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="풋살장">풋살장</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="야구장">야구장</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="테니스장">테니스장</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="농구장">농구장</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="배구장">배구장</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="다목적경기장">다목적경기장</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="운동장">운동장</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="체육관">체육관</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="배드민턴장">배드민턴장</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="탁구장">탁구장</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="교육시설">교육시설</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="수영장">수영장</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="골프장">골프장</button>
						
					</c:when>
					<c:when test="${Code eq 'Institution'}">
						<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="캠핑장">캠핑장</button>
						<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="다목적실">다목적실</button>
						<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="강의실">강의실</button>
						<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="강당">강당</button>
						<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="회의실">회의실</button>
						<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="주민공유공간">주민공유공간</button>
						<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="공연장">공연장</button>
						<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="녹화장소">녹화장소</button>
						<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="전시실">전시실</button>
						<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="광장">광장</button>
						<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="청년공간">청년공간</button>
						<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="민원 등 기타">민원 등 기타</button>
					</c:when>
					<c:when test="${Code eq 'Culture'}">
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="교육체험">교육체험</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="농장체험">농장체험</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="문화행사">문화행사</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="전시/관람">전시/관람</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="단체봉사">단체봉사</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="공원탐방">공원탐방</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="서울형키즈카페">서울형키즈카페</button>
					</c:when>
					<c:when test="${Code eq 'Education'}">					
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="스포츠">스포츠</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="공예/취미">공예/취미</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="자연/과학">자연/과학</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="역사">역사</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="교양/어학">교양/어학</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="미술제작">미술제작</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="교육도구">교육도구</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="정보통신">정보통신</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="전문/자격증">전문/자격증</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="도시농업">도시농업</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="청년정보">청년정보</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="기타">기타</button>
					</c:when>
					<c:when test="${Code eq 'Medical'}">
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="보건소">보건소</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="장애인버스">장애인버스</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="가족안심숙소">가족안심숙소</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="은평병원">은평병원</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="어린이병원">어린이병원</button>
					<button style=" margin: 1px;" class="btn btn-light" type="submit" name="c" value="서북병원">서북병원</button>
					</c:when>
					
				</c:choose>
		</form>
		</div>
		<hr>
		
		<div class="indexer margin-top align-right">
			<h3 class="hidden">총 건수</h3>
			<div>
			<c:choose>
			<c:when test="${!empty count}">총 <strong>${count }</strong> 건 입니다.</c:when>
			<c:otherwise>조회된 결과가 없습니다.</c:otherwise>
			</c:choose>
				
			</div>
		</div>
		
			<div class="row">
				<c:forEach var="jsonArr" items="${jsonArray }">
					<div class="col-sm-6"
						style=" height:270px; width:530px; margin: 10px; padding: 20px; border: 1px solid #d3d3d3; border-radius: 10px; display: block">
						<div class="col-4 text-right">
									<span style="color: red;">${jsonArr.SVCSTATNM}</span> &nbsp; <span
										style="color: red;">${jsonArr.PAYATNM}</span>
								</div>
						<div class="card">		
							<div class="card-title">
								<strong>${jsonArr.SVCNM } (${jsonArr.AREANM })</strong><br>
								<small>${jsonArr.MAXCLASSNM } - ${jsonArr.MINCLASSNM }</small>
							</div>
							<div class="card-body">
								<h5><strong>장소: </strong>${jsonArr.PLACENM } </h5>
								<h5><strong>대상: </strong>${jsonArr.USETGTINFO }</h5>
								<h5><strong>이용기간 : </strong>${fn:substring(jsonArr.SVCOPNBGNDT,0,10) } ~ ${fn:substring(jsonArr.SVCOPNENDDT,0,10) }</h5>
								<h5><strong>접수기간 : </strong>${fn:substring(jsonArr.RCPTBGNDT,0,10) } ~ ${fn:substring(jsonArr.RCPTENDDT,0,10) }</h5>
								<a href="BoardServlet?command=public_view&Code=${Code }&p=${param.p }&SVCID=${jsonArr.SVCID }"
									type="submit" class="btn btn-primary">상세보기+</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		<c:set var="page" value="${(empty param.p)?1:param.p }" />
		<c:set var="startNum" value="${page-(page-1)%5 }" />
		<c:set var="lastNum" value="${fn: substringBefore(Math.ceil(count/10), '.')}" />

		<div class="indexer margin-top align-right">
			<h3 class="hidden">현재페이지</h3>
			<c:if test="${lastNum > 0 }">
			<div>
				<span class="text-orange text-strong">${(empty param.p)?1:param.p}</span>
				/ ${lastNum } pages
			</div>
			</c:if>
		</div>


		<div class="margin-top align-center pager">
			<ul class="-list-center">

				<li><c:if test="${startNum > 1}">
						<a href="BoardServlet?command=public_list&Code=${Code }&p=${startNum-1}"><span
							class="glyphicon glyphicon-chevron-left"></span></a>

					</c:if> <c:if test="${startNum <= 1}">
						<span class="glyphicon glyphicon-chevron-left"
							onclick="alert('이전 페이지가 없습니다.');"></span>
					</c:if></li>

				<c:forEach var="i" begin="0" end="4">
					<c:if test="${(startNum+i) <= lastNum }">
						<li><a
							href="BoardServlet?command=public_list&Code=${Code }&c=${param.c }&p=${startNum+i}&f=${param.f }&q=${param.q}">${startNum+i}</a>

						</li>
					</c:if>
				</c:forEach>

				<li><c:if test="${startNum+4 < lastNum}">
						<a href="BoardServlet?command=public_list&Code=${Code }&p=${startNum+5}"><span
							class="glyphicon glyphicon-chevron-right"></span></a>

					</c:if> <c:if test="${startNum+4 >= lastNum}">
						<span class="glyphicon glyphicon-chevron-right"
							onclick="alert('다음 페이지가 없습니다.');"></span>
					</c:if></li>
			</ul>
		</div>
	</section>


	<jsp:include page="/headfoot/footer.jsp" />
	<!--<script src="/.js/jquery.min.js"></script>
	<script src="/.js/pooper.js"></script>
	<script src="/.js/bootstrap.min.js"></script>  -->
</body>
</html>