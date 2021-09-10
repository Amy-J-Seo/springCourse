<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
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
		<div>
			<h1>${member.lastName }'s Information</h1><br><br>
		</div>
		<div>
			<a class="btn btn-success" href="updateForm?employeeId=${member.employeeId }">UPDATE 원래껏</a>&nbsp;&nbsp;&nbsp;
			<a class="btn btn-info" href="registerForm?employeeId=${member.employeeId }">UPDATE 인서트폼 사용</a>&nbsp;&nbsp;&nbsp;
			<button class="btn btn-danger">DELETE</button>
			<br><br>
		</div>
		<div class="row">
			<div class="col-lg-2"></div>
				
					<div class="col-lg-8">
			<table class="table">
				<tr>
					<th width="200">ID</th>
					<td width="400">&nbsp;&nbsp;${member.employeeId }</td>
				</tr>
				<tr>
					<th>NAME</th>
					<td>&nbsp;&nbsp;${member.firstName }, ${member.lastName }</td>
				</tr>
				<tr>
					<th>HIRE DATE</th>
					<td>&nbsp;&nbsp;<fmt:formatDate value="${member.hireDate }"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>JOB_ID</th>
					<td>&nbsp;&nbsp;${member.jobId }</td>
				</tr>
				<tr>
					<th>MANAGER_ID</th>
					<td>&nbsp;&nbsp;${member.managerId }</td>
				</tr>
				<tr>
					<th>DEPARTMENT ID</th>
					<td>&nbsp;&nbsp;${member.departmentId }</td>
				</tr>
				<tr>
				<th>EMAIL</th>
				<td>&nbsp;&nbsp;${member.email }</td>
				</tr>
				<tr>
				<th>PHONE NUMBER</th>
				<td>&nbsp;&nbsp;${member.phoneNumber }</td>
				</tr>
			</table>
			</div>
			<div class="col-lg-2"></div>
			<br>
			
		</div>
		<a class="btn btn-info" href="list">목 록 으 로</a>
	</div>
</body>
</html>