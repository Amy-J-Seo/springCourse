<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">멤 버 게 시 판</h1>
			<a style="float:right; margin-bottom: 20px; margin-right: 20px;" class="btn btn-warning" href="registerForm">직원 등록하기</a>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Member</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="board">
						<thead>
							<tr>
								<th>Employee Id</th>
								<th>Last name</th>
								<th>Job id</th>
								<th>Hire date</th>
								<th>Manager id</th>
								<th>Department id</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list }">
								<tr height="35">
									<td align="center">${item.employeeId }</td>
									<td><a href="get?employeeId=${item.employeeId}">${item.lastName }</a></td>
									<td>${item.jobId }</td>
									<td><fmt:formatDate value="${item.hireDate }"
											pattern="yyyy-MM-dd" /></td>
									<td>${item.managerId }</td>
									<td>${item.departmentId }</td>
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