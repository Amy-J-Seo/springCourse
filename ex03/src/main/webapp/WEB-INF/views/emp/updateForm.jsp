<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div class="row">
			<div class="col-lg-12">
				<h1>직원정보 수정하기</h1>
				<hr>
			</div>
			<div class="panel-body">
				<div class="row ">
				<div class="col-lg-2"></div>
				
					<div class="col-lg-8">
						<form id="editEmpFrm" action="modify" method="post">
							<div class="form-group">
								<label>직원 아이디</label> <input id="employeeId"
									name="employeeId" class="form-control"
									placeholder="Employee_id" value="">
							</div>
							<div class="form-group">
								<label>직원의 성을 입력하세요</label> <input id="lastName" name="lastName"
									class="form-control" placeholder="Last_name">
							</div>
							<div class="form-group">
								<label>직원의 이름을 입력하세요</label> <input id="firstName"
									name="firstName" class="form-control" placeholder="First_Name">
							</div>
							<div class="form-group">
								<label>직원의 이메일을 입력하세요</label> <input id="email" name="email"
									class="form-control" placeholder="email">
							</div>
							<div class="form-group">
								<label>Job_Id</label> <label class="radio-inline"> <input
									type="radio" name="jobId" id="jobId" value="AD_PRES" checked>President
								</label> <label class="radio-inline"> <input type="radio"
									name="jobId" id="jobId" value="AD_VP">Administration
									Vice President
								</label> <label class="radio-inline"> <input type="radio"
									name="jobId" id="jobId" value="AD_ASST">Administration
									Assistant
								</label> <label class="radio-inline"> <input type="radio"
									name="jobId" id="jobId" value="AC_MGR">Accounting
									Manager
								</label> <label class="radio-inline"> <input type="radio"
									name="jobId" id="jobId" value="AC_ACCOUNT">Public
									Accountant
								</label> <label class="radio-inline"> <input type="radio"
									name="jobId" id="jobId" value="SA_MAN">Sales Manager
								</label> <label class="radio-inline"> <input type="radio"
									name="jobId" id="jobId" value="SA_REP">Sales
									Representative
								</label> <label class="radio-inline"> <input type="radio"
									name="jobId" id="jobId" value="ST_MAN">Stock Manager
								</label> <label class="radio-inline"> <input type="radio"
									name="jobId" id="jobId" value="ST_CLERK">Stock Clerk
								</label> <label class="radio-inline"> <input type="radio"
									name="jobId" id="jobId" value="IT_PROG">Programmer
								</label> <label class="radio-inline"> <input type="radio"
									name="jobId" id="jobId" value="MK_MAN">Marketing
									Manager
								</label> <label class="radio-inline"> <input type="radio"
									name="jobId" id="jobId" value="MK_REP">Marketing
									Representative
								</label>
							</div>

							<button class="btn btn-success">수 정 하 기</button> &nbsp;&nbsp;&nbsp;
							<a class="btn btn-info" href="list">목 록 으 로</a>
						</form>
					</div>
					<div class="col-lg-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>