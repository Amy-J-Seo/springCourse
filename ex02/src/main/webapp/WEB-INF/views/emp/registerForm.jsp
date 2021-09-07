<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<br>
		<div class="panel panel-default">
			<div class="panel-heading">직원 등록하기</div>
			
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<form role="form" action="/app/emp/register" method="post">
							<div class="form-group">
								<label>직원 아이디를 입력하세요</label> <input id="employeeId" name="employeeId" class="form-control" placeholder="Employee_id">
							</div>
							<div class="form-group">
								<label>직원의 성을 입력하세요</label> <input id="lastName" name="lastName" class="form-control" placeholder="Last_name">
							</div>
							<div class="form-group">
								<label>직원의 이름을 입력하세요</label> <input id="firstName" name="firstName" class="form-control" placeholder="First_Name">
							</div>
							<div class="form-group">
								<label>직원의 이메일을 입력하세요</label> <input id="email" name="email" class="form-control" placeholder="email">
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
