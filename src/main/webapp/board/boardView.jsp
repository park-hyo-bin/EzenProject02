<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/headfoot/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<div class="container">
		<table class="table table-bordered table-hover"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="4"><h4>공지사항 상세보기</h4></th>
				</tr>
				<tr>
					<td style="width: 80px;"><h5>글번호</h5></td>
					<td><h5>${board.bNum }</h5></td>
					<td style="width: 80px;"><h5>조회수</h5></td>
					<td><h5>${board.readcount }</h5></td>

				</tr>
				<tr>
					<td style="width: 80px;"><h5>작성자</h5></td>
					<td><h5>${board.userid }</h5></td>
					<td style="width: 80px;"><h5>작성일</h5></td>
					<td><h5>
							<fmt:formatDate pattern="yyyy-MM-dd hh:mm"
								value="${board.writedate }" />
						</h5></td>
				</tr>
				<tr>
					<td><h5>글제목</h5></td>
					<td colspan="3"><h5>${board.bTitle }</h5></td>
				</tr>
				<tr>
					<td
						style="vertical-align: middle; min-height: 150px; background-color: #fafafa; color: #000000; width: 80px;"><h5>글내용</h5></td>
					<td colspan="3" style="text-align: left;"><h5>${board.bContent }</h5></td>
				</tr>
				<tr>
					<td style="background-color: #fafafa; color: #000000; width: 80px;"><h5>첨부파일</h5></td>
					<td colspan="3"><h5>
							<a href="${board.uploadFile01 }">${board.uploadFile01 }</a> <a
								href="${board.uploadFile02 }">${board.uploadFile02 }</a> <a
								href="${board.uploadFile03 }">${board.uploadFile03 }</a>
						</h5></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5" style="text-align: right;"><a
						href="BoardServlet?command=board_write_form"
						class="btn btn-primary pull-right">새글</a> <a
						href="BoardServlet?command=board_list&p=${param.p }"
						class="btn btn-primary pull-right">목록</a> <a
						href="BoardServlet?command=board_delete&bNum=${board.bNum}"
						class="btn btn-primary pull-right">삭제</a> <a
						href="BoardServlet?command=board_update_form&bNum=${board.bNum}"
						class="btn btn-primary pull-right">수정</a></td>
				</tr>

			</tbody>
		</table>
	</div>


	<br>
	<div class="margin-top">
		<table class="table border-top-default">
			<tbody>

				<tr>
					<th>다음글</th>
					<td colspan="3" class="text-align-left text-indent"><c:choose>
							<c:when test="${!empty next}">
								<a class="text-blue text-strong"
									href="BoardServlet?command=board_view&bNum=${next.bNum }">${next.bTitle}</a>
							</c:when>
							<c:otherwise>
								<a class="text-blue text-strong">다음 글이 없습니다.</a>
							</c:otherwise>
						</c:choose></td>
				</tr>

				<tr>
					<th>이전글</th>
					<td colspan="3" class="text-align-left text-indent"><c:choose>
							<c:when test="${!empty prev}">
								<a class="text-blue text-strong"
									href="BoardServlet?command=board_view&bNum=${prev.bNum }">${prev.bTitle}</a>
							</c:when>
							<c:otherwise>
								<a class="text-blue text-strong">이전 글이 없습니다.</a>
							</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<th></th>
					<td class="text-blue text-strong"></td>
				</tr>
			</tbody>
		</table>
	</div>

	<br>
	<section class="container">
		<h3>댓글</h3>
		<br>
		<form class="form-inline mt-3" name="frm" method="post"
			action="BoardServlet">
			<input type="hidden" name="command" value="comment_write"> <input
				type="hidden" name="bNum" value="${board.bNum }"> <input
				type="hidden" name="CNum" value="${selectComment.CNum }">
			<div class="card bg-light mt-3">
				<div class="card-header bg-light">
					<div class="row">
						<div class="col-8 text-left">
							작성자<small><br> <input type="text" name="writer"
								value="${loginUser.userid}" size="15" readonly></small>
						</div>
						<div class="col-4 text-right">
							<input type="submit" value="등록"> <input type="reset"
								value="다시 작성">
						</div>
					</div>
				</div>
				<div class="card-body">
					<p class="card-text">
						<textArea cols="100" rows="3" name="bComment"></textArea>
					</p>
				</div>
			</div>
		</form>
	</section>

	<hr>

	<section class="container">
		<c:forEach var="Comment" items="${commentList }">
			<c:choose>
				<c:when
					test="${Comment.userid == loginUser.userid && selectComment.CNum == Comment.CNum}">
			${Comment.userid }<br>
					<form class="form-inline mt-3" name="frm" method="post"
						action="BoardServlet">
						<input type="hidden" name="command" value="comment_update">
						<input type="text" name="bComment"
							value="${selectComment.bComment}" /> <input type="hidden"
							name="bNum" value="${board.bNum }" /> <input type="hidden"
							name="CNum" value="${selectComment.CNum }" /> <input
							type="hidden" name="writer" value="${selectComment.userid}" /> <input
							type="submit" value="등록">
					</form>

				</c:when>
				<c:otherwise>

					<div class="card bg-light mt-3">
						<div class="card-header bg-light">
							<div class="row">
								<div class="col-8 text-left">${Comment.userid }
									&nbsp; <small><fmt:formatDate
											pattern="yyyy-MM-dd hh:mm" value="${Comment.writedate }" />
									</small>
												<c:if test="${Comment.userid == loginUser.userid }">
											
											<form name="frm" method="post" action="BoardServlet?">
												<input type="hidden" name="command" value="board_view">
												<input type="hidden" name="CNum" value="${Comment.CNum }">
												<input type="hidden" name="bNum" value="${Comment.bNum }">
												<div style="text-align: center; float: right; font-size: 25px;">
													<button class="btn btn-secondary btn-sm" type="submit"
													onclick="return confirm('수정하시겠습니까?')">수정</button>
												</div>
											</form>

											<form name="frm" method="post" action="BoardServlet?">
												<input type="hidden" name="command" value="comment_delete">
												<input type="hidden" name="CNum" value="${Comment.CNum }">
												<input type="hidden" name="bNum" value="${Comment.bNum }">
												<div style="text-align: center; float: right; font-size: 25px;">
												<button class="btn btn-secondary btn-sm" type="submit"
													onclick="return confirm('삭제하시겠습니까?')" >삭제</button></div>
											</form>

										</c:if>
										
								</div>
							</div>
						</div>
						<div class="card-body">
							<p class="card-text">${Comment.bComment }</p>
							<!-- 	<div class="row">
											 <div class="col-9 text-left">
													<span style="color: green;">(추천: 15)</span>
												</div>
												<div class="col-3 text-right">
													<a onclick="return confirm('추천하시겠습니까?')">추천</a> 
												</div>
											</div>-->
						</div>
					</div>

				</c:otherwise>
			</c:choose>
			<hr>
		</c:forEach>
	</section>

	<jsp:include page="/headfoot/footer.jsp" />

</body>
</html>