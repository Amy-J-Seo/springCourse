<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div align="center">
	<div class="">
		<div>
			<h1>All employees</h1>
			<a href="registerForm" class="btn btn-primary">Add Employees</a><br><hr>
		</div>
		<div class="row">
		<div class="col-lg-1"></div>
				
					<div class="col-lg-10">
			<table class="table">
				<tr>
					<th width="100">ID</th>
					<th width="300">LAST NAME</th>
					<th width="200">HIRE DATE</th>
					<th width="300">JOB_ID</th>
					<th width="150">MANAGER_ID</th>
					<th width="150">DEPARTMENT ID</th>
				</tr>
				
				<c:forEach var="member" items="${list }">
				<tr>
					<td style="text-align:center;">${member.employeeId }</td>
					<td>&nbsp;&nbsp;&nbsp;<a href="get?employeeId=${member.employeeId }">${member.lastName }</a></td>
					<td  style="text-align:center;"><fmt:formatDate value="${member.hireDate }" pattern="yyyy-MM-dd" /></td>
					<td>${member.jobId }</td>
					<td style="text-align:center;">${member.managerId }</td>
					<td  style="text-align:center;">${member.departmentId }</td>
				</tr>
				</c:forEach>			
			</table>
			</div>
			<div class="col-lg-1"></div>
		</div>
		</div>
	</div>
</body>
</html>