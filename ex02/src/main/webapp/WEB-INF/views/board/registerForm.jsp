<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<br>
		<div class="panel panel-default">
			<div class="panel-heading">게시글 작성하기! </div>
			
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<form role="form" action="/app/board/register" method="post">
							<div class="form-group">
								<label>제목을 입력하세요</label> <input id="title" name="title" class="form-control" placeholder="Title">
							</div>
							<div class="form-group">
								<label>작성자</label> <input id="writer" name="writer" class="form-control" placeholder="Writer">
							</div>
							<div class="form-group">
								<label>본문을 입력하세요</label>
								<textarea id="content" name="content" class="form-control" rows="3"></textarea>
							</div>
							<div class="form-group">
								<label>File input</label> <input type="file">
							</div>
							<div style="float:right;">
							<button type="submit" class="btn btn-warning">등록</button>
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
