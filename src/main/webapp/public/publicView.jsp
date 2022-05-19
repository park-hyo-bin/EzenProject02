<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/headfoot/header.jsp"%>
<%@ include file="/public/publicModal.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#calendar {
	border: 1px solid gray;
	border-collapse: collapse;
	
}
#calendar th {
	width: 40px;
	height: 40px;
	border: 1px solid gray;
	text-align: left;
	vertocal-align: top;
	position: relative;
}
</style>
</head>
<body>


	<section class="container">
		<div class="row">
			<h2>${SVCNM }</h2>
			<div class="col-sm-6">
				<div class="card" style="width: 40rem;">
					<img src="${IMG_PATH}" class="img-thumbnail" alt="...">
					<div class="card-body">

						<table id="calendar" >
							<caption>
								<a href="BoardServlet?command=public_view&year=${year-1 }&month=${month}" class="glyphicon glyphicon-chevron-left"></a> 
								<a href="BoardServlet?command=public_view&year=${year }&month=${month-1}" class="glyphicon glyphicon-chevron-left"></a> 
								<span class="y">${year }</span>년 <span class="m">${month }</span>월
								<a href="BoardServlet?command=public_view&year=${year }&month=${month+1}" class="glyphicon glyphicon-chevron-right"></a> 
								<a href="BoardServlet?command=public_view&year=${year+1 }&month=${month}" class="glyphicon glyphicon-chevron-right"></a>
							</caption>
							 <thead>
							<tr>
								<th>일</th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
								<th>토</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<c:forEach begin="0" end="${dayOfweek-1}" step="1" var="<td>&nbsp;</td>"> </c:forEach>
              					<c:forEach begin="1" end="${lastDay}" step="1" var="number" > 
       							<td><a href="BoardServlet?command=public_view&svcID=${SVCID}&year=${year }&month=${month}&date=${number}">${number}</a></td>
                       	 		 <c:if test="${(dayOfweek-1+number)%7==0}" ></tr><tr> </c:if>
                        		</c:forEach>
								<c:forEach begin="0" end="${(7-(dayOfweek -1+lastDay)%7)%7}" step="1" var="<td>&nbsp;</td>"> 
                        		</c:forEach>
							</tr></tbody>
						</table>
						<br>
						<c:choose>
						<c:when test="${empty param.year}">선택된 날짜가 없습니다.<br> </c:when>
						<c:otherwise> <div>선택된 날짜: ${param.year} - ${param.month} - ${param.date}</div><br> </c:otherwise>
						</c:choose>
						
					</div>
				</div>
			</div>

			<div class="col-sm-6">
				<div class="card" style="width: 45rem;">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">장소 : ${PLACENM }</li>
						<li class="list-group-item">이용기간 : ${SVCBEGINDT } ~ ${SVCENDDT }</li>
						<li class="list-group-item">접수기간 : ${RCEPTBEGDT } ~ ${RCEPTENDDT }</li>
						<li class="list-group-item">선별방법 : ${SELMTHDCODE_NM }</li>
						<li class="list-group-item">모집정원 : ${RCRPERCAP } ${UNICODE_NM }</li>
						<li class="list-group-item">신청제한 : 1회에 ${ONEREQMINPR } ~ ${ONEREQMXMPR } ${UNICODE_NM } 까지 신청가능</li>
						<li class="list-group-item">취소기간 : 이용일 ${REVSTDDAY }일 전까지</li>
						<li class="list-group-item">이용요금 : ${PAYAT }</li>
						<li class="list-group-item">예약방법 : ${RCEPTMTH_NM }</li>
						<li class="list-group-item">문의전화 : ${ORGNM} / ${SVCENDTELNO }</li>
					</ul>
					<div style="text-align: right;">
							<a class="btn btn-primary" data-toggle="modal" href="#reservationModal">예약</a>
							<a href="BoardServlet?command=public_list" class="btn btn-primary">목록</a>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="container">
		<div class="card text-center">
			<div class="card-header">
				<ul class="nav nav-tabs card-header-tabs">
					<li class="nav-item"><a class="nav-link active" role="tab"
						data-toggle="tab" href="#home">이용안내</a></li>
					<li class="nav-item"><a class="nav-link" role="tab"
						data-toggle="tab" href="#profile">이용후기</a></li>
				</ul>
			</div>
			<div class="tab-content">
				<div class="tab-pane active" id="home">
					<c:if test="${!empty NOTICE }">
						<h3 class="card-title" align="left">주의사항</h3>
						<p class="card-text" align="left">${NOTICE }</p>
					</c:if>


					<h3 class="card-title" align="left">필수 준수사항</h3>
					<p class="card-text" align="left">
						모든 서비스의 이용은 담당 기관의 규정에 따릅니다. 각 시설의 규정 및 허가조건을 반드시 준수하여야 합니다.<br>
						각 관리기관의 시설물과 부대시설을 이용함에 있어 담당자들과 협의 후 사용합니다.<br> 각 관리기관의 사고
						발생시 서울시청에서는 어떠한 책임도 지지않습니다.<br> 시설이용료 납부는 각 관리기관에서 규정에 준합니다.<br>
						본 사이트와 각 관리기관의 규정을 위반할 시에는 시설이용 취소 및 시설이용 불허의 조치를 취할 수 있습니다.<br>
						접수 시간을 기준으로 브라우저에서 새로고침을 하면 변경된 정보를 볼 수 있습니다.<br>
					</p>
					<h3 class="card-title" align="left">시설예약</h3>
					<p class="card-text" align="left">
						비회원일 경우에는 가입 후 사용하실 수 있습니다.<br>
					</p>
				</div>

				<div class="tab-pane" id="profile">
					<br> <a class="btn btn-primary mx-1 mt-2" data-toggle="modal"
						href="#commentModal">등록하기</a> <a class="btn btn-danger"
						data-toggle="modal" href="#reportModal">신고</a>
					<hr>


				</div>
			</div>
		</div>
	</section>

	<jsp:include page="/headfoot/footer.jsp" />
</body>
</html>