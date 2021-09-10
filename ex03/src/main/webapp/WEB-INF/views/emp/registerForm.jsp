<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.require{
			color: red;
	}
	.emp{
		cursor:pointer;
	}
	.emp:hover{
			color: blue;
	}
</style>

<script>
$(function(){
	
	//validation function
	function validation(){
		if(registerEmpFrm.lastName.value==""){
			alert("직원의 성씨을 입력하세요");
			registerEmpFrm.lastName.focus();
			return false;
		}
		if(registerEmpFrm.employeeId.value==""){
			alert("직원의 아이디를 입력하세요");
			registerEmpFrm.employeeId.focus();
			return false;
		}
		if(registerEmpFrm.hireDate.value==""){
			alert("직원의 입사일을 입력하세요");
			registerEmpFrm.hireDate.focus();
			return false;
		}
		if(registerEmpFrm.email.value==""){
			alert("직원의 이메일을 입력하세요");
			registerEmpFrm.email.focus();
			return false;
		}
		if(registerEmpFrm.jobId.value==""){
			alert("직원의 직업코드를 입력하세요");
			registerEmpFrm.jobId.focus();
			return false;
		}
		
		return true;
	};
	
	
	//btn register on click event
	$("#btnRegister").on("click", function(){
		if( validation() ){
			registerEmpFrm.submit();
		}
	})
	
	
	//매니저검색버튼 이벤트
	$("#btnEmpSearch").on("click", function(){
		// 검색페이지를 ajax -> 모달 바디 넣고 모달
		$.ajax({
			url:"/app/emp/empSearch",
			success:function(data){
				$("#managerIdModal .modal-body").html(data);
				$("#managerIdModal").modal("show");
			}
		});
	}); //매니저검색버튼 끝
	
	 document.addEventListener('keydown', function(e){
		if(e.keyCode ===13){
			e.preventDefault();
		};
		return;
	})
	 
	$("#managerId").on("keydown",function(e){
		
		console.log(e.keyCode);
		$("#name").val("");
		if($("#managerId").val()==""){
			return;
		}
		if(e.keyCode ==13){
			
			$.ajax({
				url:"/app/emp/ajaxEmpSearch",
				data:{employeeId: $("#managerId").val()},
				success:function(data){
					console.log(data)
					if(data){
						$("#name").val(data.firstName);
					}else{
						$("#btnEmpSearch").click();
						$("#managerId").val("");
					}
				
				}
			});
			
		}
	})
	
});


	function closeModal(){
		alert("매니저 선택되었습니다!");
		$("#managerIdModal").modal('hide');  //안닫혀ㅠㅠ
	};
</script>

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
				
					<div class="col-lg-10 justify-items-center">
						<form name ="registerEmpFrm" id="registerEmpFrm" action="${not empty emp ?'update':'register'}" method="post">
							<c:if test="${empty emp }">
							<div class="form-group">
								<label>직원 아이디를 입력하세요</label><span class="require">*</span> <input id="employeeId"
									name="employeeId" class="form-control"
									placeholder="Employee_id" value="${emp.employeeId }" required>
							</div>
							</c:if>
							<div class="form-group">
								<label>직원의 성을 입력하세요</label><span class="require">*</span> <input id="lastName" name="lastName"
									class="form-control" placeholder="Last_name" value="${emp.lastName }" required>
							</div>
							<div class="form-group">
								<label>직원의 이름을 입력하세요</label> <input id="firstName"
									name="firstName" class="form-control" placeholder="First_Name" value="${emp.firstName }" required>
							</div>
							<div class="form-group">
								<label>직원의 이메일을 입력하세요</label><span class="require">*</span> <input id="email" name="email"
									class="form-control" placeholder="email" value="${emp.email }" required> 
									<span id="result"></span>
							</div>
							<div class="form-group">
								<label>직원의 입사일을 입력하세요</label><span class="require">*</span> <input type="date" id="hireDate" name="hireDate"
									class="form-control" value="${emp.hireDate }" required> 
							</div>
							<div class="form-group">
								<label>Job_Id</label><span class="require">*</span>
								<select name="jobId">
								<option value="">선택</option>
									<c:forEach var="job" items="${opt.jobs }">
									<option value="${job.jobId }">${job.jobTitle }: ${job.jobId }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label>DepartmentId</label>
								<select name="departmentId">
								<option value="">선택</option>
									<c:forEach var="dept" items="${opt.depts }">
									<option value="${dept.departmentId }">${dept.departmentName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label>ManagerId</label>
								<input type="text" id="managerId" name="managerId" class="form-control" placeholder="managerId">
								<input type="text" id="name" class="form-control" placeholder="managerName" disabled>
								<br>
								<button type="button" class="btn btn-primary" id="btnEmpSearch">
								 search!
								</button>
							</div>

							<button class="btn btn-success" type="button" id="btnRegister">등 록 하 기</button> &nbsp;&nbsp;&nbsp;
							<a class="btn btn-info" href="list">목 록 으 로</a>
						</form>
					</div>
					<div class="col-lg-2"></div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- manager search modal -->
	<div class="modal" tabindex="-1" role="dialog" id="managerIdModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">매니저를 찾아라!!!!!!!!!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>누가!!! 당신의 !!! 매니저인가!!!!!</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onClick="closeModal()" data-dismiss="modal"> 선 택 </button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
	<!--/ end of manager search modal -->
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>