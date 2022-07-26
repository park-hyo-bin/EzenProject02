<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3"></script>

</head>
<body>

			


<!--

<script src="/script/detailModal.js"></script>
<script>$(document).on("click", ".open-detailModal", function () { 
     var rNum = $(this).data('id'); 
     $(".form-group #rNum").val( rNum ); 
                                              
});
</script>


<div class="modal fade" id="detailModal" tabindex="-1" role="dialog"
		aria-labelledby="modal">
		<div class="modal-dialog-centered" role="document">
			<div class="modal-content"><div class="modal-header">
					<h5 class="modal-title" id="modal">예약 내역</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-row">
						<div class="form-group col-sm-6">
							<label>아이디</label><input id="RName" value="${reserV.userId}" type="text" 
								class="form-control" maxlength="30" readonly>
						</div>
						<div class="form-group col-sm-6">
							<label>예약날짜</label> <input
								id="<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${reserV.rDate}" />"
								type="text"  class="form-control" maxlength="30"
								readonly>
						</div>
						<div class="form-group">
							<label>이용날짜</label> <input id="" type="text"
								 class="form-control" maxlength="30" readonly>
						</div>

						<div class="form-group">
							<label>예약시설</label> <input id="" type="text"
								 class="form-control" maxlength="30" readonly>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
						<a class="btn btn-danger modify"
							href="BoardServlet?command=reservation_delete&rNum=${reserV.rNum}">예약
							취소</a>
					</div>
				</div>
			</div>
		</div>
	</div>-->
</body>
</html>