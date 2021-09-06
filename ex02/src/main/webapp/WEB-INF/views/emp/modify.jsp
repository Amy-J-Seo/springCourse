<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<br>
		<div class="panel panel-default">
			<div class="panel-heading">직원정보 수정하기! </div>
			
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<form role="form" action="/app/emp/modify" method="post">
						<input type="hidden" id="employeeId" name="employeeId" value="${member.employeeId }">
							<div class="form-group">
								<label>직원 아이디</label> <input id="employeeId" name="employeeId" class="form-control" value="${member.employeeId }" disabled>
							</div>
							<div class="form-group">
								<label>직원의 성을 입력하세요</label> <input id="lastName" name="lastName" class="form-control" value="${member.lastName }" disabled>
							</div>
							<div class="form-group">
								<label>직원의 이름을 입력하세요</label> <input id="firstName" name="firstName" class="form-control" value="${member.firstName }" disabled>
							</div>
							<div class="form-group">
								<label>직원의 이메일을 입력하세요</label> <input id="email" name="email" class="form-control" placeholder="${member.email }" required>
							</div>
							<div class="form-group">
								<label>직원의 전화번호를 입력하세요</label> <input id="phoneNumber" name="phoneNumber" class="form-control" placeholder="Enter Phone Number" required>
							</div>
							 <div class="form-group">
                                            <label>Job_Id</label>
                                            <label class="radio-inline">
                                                <input type="radio" name="jobId" id="jobId" value="AD_PRES" checked>President
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="jobId" id="jobId" value="AD_VP">Administration Vice President
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="jobId" id="jobId" value="AD_ASST">Administration Assistant
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="jobId" id="jobId" value="AC_MGR">Accounting Manager
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="jobId" id="jobId" value="AC_ACCOUNT">Public Accountant
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="jobId" id="jobId" value="SA_MAN">Sales Manager
                                            </label>
                                             <label class="radio-inline">
                                                <input type="radio" name="jobId" id="jobId" value="SA_REP">Sales Representative
                                            </label>
                                             <label class="radio-inline">
                                                <input type="radio" name="jobId" id="jobId" value="ST_MAN">Stock Manager
                                            </label>
                                             <label class="radio-inline">
                                                <input type="radio" name="jobId" id="jobId" value="ST_CLERK">Stock Clerk
                                            </label>
                                             <label class="radio-inline">
                                                <input type="radio" name="jobId" id="jobId" value="IT_PROG">Programmer
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="jobId" id="jobId" value="MK_MAN">Marketing Manager
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="jobId" id="jobId" value="MK_REP">Marketing Representative
                                            </label>
                                        </div>
                                        <div class="form-group">
											<label>직원의 급여를 입력하세요</label> <input id="salary" name="salary" class="form-control" placeholder="Enter salary" required>
										</div>
										<div class="form-group">
											<label>직원의 커미션을 입력하세요</label> <input id="commissionPct" name="commissionPct" class="form-control" placeholder="Enter commissionPct Not a must" >
										</div>
										<div class="form-group">
											<label>직원의 매니저 아이디를 입력하세요</label> <input id="managerId" name="managerId" class="form-control" placeholder="Enter managerId" required>
										</div>
										<div class="form-group">
											<label>직원의 부서번호를 입력하세요</label> <input id="departmentId" name="departmentId" class="form-control" placeholder="Enter departmentId" required>
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
