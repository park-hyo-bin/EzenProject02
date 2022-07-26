<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
		aria-labelledby="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">신고하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="close">
						<span aria-hidden="true">&times;</span>

					</button>
				</div>
				<div class="modal-body">
					<form action="BoardServlet?command=" method="post" name="frm">
						<div class="form-group">
							<label>신고제목</label> <input type="text" name="reportTitle"
								class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>신고내용</label>
							<textarea name="reportContent" class="form-control"
								maxlength="2048" style="height: 180px;"></textarea>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-danger">신고하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="commentModal" tabindex="-1" role="dialog"
		aria-labelledby="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">댓글 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="close">
						<span aria-hidden="true">&times;</span>

					</button>
				</div>
				<div class="modal-body">
					<form action="BoardServlet?command=" method="post" name="frm">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>작성자</label> <input type="text" name="writerName"
									class="form-control" maxlength="20" readonly>
							</div>
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="evaluationContent" class="form-control"
								maxlength="2048" style="height: 150px;"></textarea>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="reservationModal" tabindex="-1"
		role="dialog" aria-labelledby="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">시설 예약</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="BoardServlet" method="post" name="frm">
						<input type="hidden" value="reservation_write" name="command" />

						<input type="hidden" value="${SVCID }" name="svcid" />
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>아이디</label> <input value="${loginUser.userid}"
									type="text" name="writerID" class="form-control" maxlength="20"
									readonly>
							</div>
							<div class="form-group col-sm-6">
								<label>이름</label> <input value="${loginUser.name}" type="text"
									name="writerName" class="form-control" maxlength="20" readonly>
							</div>
							<div class="form-group">
								<label>이용날짜</label> <input
									value="${param.year} - ${param.month} - ${param.date}"
									type="text" name="PublicDate" class="form-control"
									maxlength="30" readonly>
							</div>
							<div class="form-group">
								<label>예약시설</label> <input value="${SVCNM }" type="text"
									name="PublicName" class="form-control" maxlength="30" readonly>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">예약하기</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>