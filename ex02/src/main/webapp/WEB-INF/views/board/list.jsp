<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">게 시 판</h1>
			<a style="float:right; margin-bottom: 20px; margin-right: 20px;" class="btn btn-warning" href="registerForm">글  쓰  기</a>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="board">
						<thead>
							<tr>
								<th>Number</th>
								<th>Title</th>
								<th>Content</th>
								<th>RegDate</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list }">
								<tr height="35">
									<td align="center">${item.bno }</td>
									<td><a href="get?bno=${item.bno}">${item.title }</a></td>
									<td>${item.content }</td>
									<td><fmt:formatDate value="${item.regDate }"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- /.table-responsive -->
					
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->


	<script>
	 $(document).ready(function() {
	        $('#board').DataTable({
	            responsive: true
	        });
	    });
	</script>

	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	
