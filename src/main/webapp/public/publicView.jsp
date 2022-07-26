<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/headfoot/header.jsp"%>
<%@ include file="/public/publicModal.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공공시설 상세보기</title>
<link rel="stylesheet" href="script/public.css">
</head>
<body>
	<c:forEach var="Djson" items="${Djson }">
		<section class="container">
			<div class="row">
				<h2>${Djson.SVCNM }</h2>
				<div class="col-sm-6">
					<div class="card" style="width: 40rem;">
						<img src="${Djson.IMG_PATH}" class="img-thumbnail" alt="...">
						<div class="card-body">

							<table id="calendar">
								<caption>
									<a
										href="BoardServlet?command=public_view&Code=${Code }&SVCID=${Djson.SVCID}&year=${year-1}&month=${month}"
										class="glyphicon glyphicon-chevron-left"></a> <a
										href="BoardServlet?command=public_view&Code=${Code }&SVCID=${Djson.SVCID}&year=${year}&month=${month-1}"
										class="glyphicon glyphicon-chevron-left"></a> <span class="y">${year }</span>년
										<span class="m">${month}</span>월 <a
										href="BoardServlet?command=public_view&Code=${Code }&SVCID=${Djson.SVCID}&year=${year}&month=${month+1}"
										class="glyphicon glyphicon-chevron-right"></a> <a
										href="BoardServlet?command=public_view&Code=${Code }&SVCID=${Djson.SVCID}&year=${year+1}&month=${month}"
										class="glyphicon glyphicon-chevron-right"></a>
								</caption>
								<thead>
									<tr align="center">
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
									<tr align="center">
										<c:forEach begin="1" end="${dayOfweek-1}" step="1">
											<th></th>
										</c:forEach>
										<c:forEach begin="1" end="${lastDay}" step="1" var="number">
											<th><a
												href="BoardServlet?command=public_view&Code=${Code }&SVCID=${Djson.SVCID}&year=${year }&month=${month}&date=${number}">${number}</a></th>
											<c:if test="${(dayOfweek-1+number)%7 == 0}">
												<tr></tr>
											</c:if>
										</c:forEach>
										<c:forEach begin="1" end="${(7-(dayOfweek -1+lastDay)%7)%7}"
											step="1">
											<th></th>
										</c:forEach>			
									</tr>
								</tbody>
							</table>
							<br>
							<c:choose>
								<c:when test="${empty param.year }">선택된 날짜가 없습니다.<br>
								</c:when>
								<c:when test="${empty param.month }">선택된 날짜가 없습니다.<br>
								</c:when>
								<c:when test="${empty param.date }">선택된 날짜가 없습니다.<br>
								</c:when>
								<c:otherwise>
									<div>선택된 날짜: ${param.year} - ${param.month} -
										${param.date}</div>
									<br>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>

				<div class="col-sm-6">
					<div class="card" style="width: 45rem;">
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><strong>장소 : </strong>${Djson.PLACENM }</li>
							<li class="list-group-item"><strong>이용기간 : </strong>${Djson.SVCBEGINDT } ~ ${Djson.SVCENDDT }</li>
							<li class="list-group-item"><strong>접수기간 : </strong>${Djson.RCEPTBEGDT } ~ ${Djson.RCEPTENDDT }</li>		
							<li class="list-group-item"><strong>선별방법 : </strong>${Djson.SELMTHDCODE_NM }</li>
							<li class="list-group-item"><strong>모집정원 : </strong>${Djson.RCRPERCAP }
								${Djson.UNICODE_NM }</li>
							<li class="list-group-item"><strong>신청제한 : </strong>1회에
								${Djson.ONEREQMINPR } ~ ${Djson.ONEREQMXMPR } ${Djson.UNICODE_NM }
								까지 신청가능</li>
							<li class="list-group-item"><strong>취소기간 : </strong>이용일
								${Djson.REVSTDDAY }일 전까지</li>
							<li class="list-group-item"><strong>이용요금 : </strong>${Djson.PAYAT }</li>
							<li class="list-group-item"><strong>예약방법 : </strong>${Djson.RCEPTMTH_NM }</li>
							<li class="list-group-item"><strong>문의전화 : </strong>${Djson.ORGNM}
								/ ${Djson.SVCENDTELNO }</li>
						</ul>
						<div style="text-align: right;">
							<a class="btn btn-primary" data-toggle="modal"
								href="#reservationModal">예약</a> <a
								href="BoardServlet?command=public_list&Code=${Code }&p=${param.p }"
								class="btn btn-primary">목록</a>
						</div>
					</div>
				</div>

			</div>

			<div class="card text-center">
				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active" role="tab"
							data-toggle="tab" href="#home">이용안내</a></li>
						<li class="nav-item"><a class="nav-link" role="tab"
							data-toggle="tab" href="#profile">위치</a></li>
					</ul>
				</div>
				<div class="tab-content">
					<div class="tab-pane active" id="home">
						<c:if test="${!empty Djson.NOTICE }">
							<h3 class="card-title" align="left">주의사항</h3>
							<p class="card-text" align="left">${Djson.NOTICE }</p>
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
						<div id="map" style="width: 100%; height: 350px;"></div>
						<button onclick="setCenter()">시설 위치 보기</button>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6c7f25400f12c73bcc60d47758daf97"></script>
						<script>
							var mapContainer = document.getElementById('map'), 
    						mapOption = { 
        					center: new kakao.maps.LatLng(${Djson.Y },${Djson.X }), 
        					level: 3
    						};
							var map = new kakao.maps.Map(mapContainer, mapOption);
	
							     
								var markerPosition  = new kakao.maps.LatLng(${Djson.Y },${Djson.X }); 
								var marker = new kakao.maps.Marker({
	    						position: markerPosition
								});
								marker.setMap(map);
						
								function setCenter() {            
								    var moveLatLon = new kakao.maps.LatLng(${Djson.Y },${Djson.X });
								    map.setCenter(moveLatLon);
								}
						</script>
						<h5>주소: ${Djson.ADRES }</h5>
						<h5>전화번호: ${Djson.TELNO }</h5>
						<hr>
					</div>
				</div>
			</div>
		</section>
	</c:forEach>

	<jsp:include page="/headfoot/footer.jsp" />
</body>
</html>