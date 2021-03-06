<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<br>
		<div class="panel panel-default">
			<div class="panel-heading">게시글 수정하기! </div>
			
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">${cri.pageNum}:${cri.amount}
						<form role="form" action="modify" method="post">
						
						 <input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum}">
      					  <input type="hidden" id="amount" name="amount" value="${cri.amount}">
						
						<input type="hidden" id="bno" name="bno" value="${board.bno }">
							<div class="form-group">
								<label>제목을 입력하세요</label> <input id="title" name="title" class="form-control" placeholder="${board.title }">
							</div>
							<div class="form-group">
								<label>작성자</label> <input id="writer" name="writer" class="form-control" placeholder="${board.writer }" disabled>
							</div>
							<div class="form-group">
								<label>본문을 입력하세요</label>
								<textarea id="content" name="content" class="form-control" rows="3">${board.content }</textarea>
							</div>
							<div class="form-group">
								<label>File input</label> <input type="file">
							</div>
							<div style="float:right;">
							<button type="submit" class="btn btn-warning">수정하기</button>
							<button type="reset" class="btn btn-danger">취소</button>
							</div>
						</form>
					</div>
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
