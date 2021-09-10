<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

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
		$(function() {
			deptList();

			//dept삭제	

			//dept등록 -> 모달 띄워서 해보쟝
			$("#deptInsertModalBtn").on("click", function(){
				$("#deptInsertModal").modal("show");	
			});
			//end of register dept modal open
			
			
			//dept수정	

			//dept페이지 목록조회	
			function deptList() {
				$.ajax({
					url : "deptList",
					dataType : "json",
					success : function(data) {
						console.log(data);
						$.each(data, function(i, data) {
							$("<div>").append(
									$("<span>").html(data.departmentId))
									.append(
											$("<span>").html(
													"&nbsp;&nbsp;&nbsp;"))
									.append(
											$("<span>").html(
													data.departmentName))
									.append(
											$("<span>").html(
													"&nbsp;&nbsp;&nbsp;"))
									.append($("<span>").html(data.ManagerId))
									.append(
											$("<span>").html(
													"&nbsp;&nbsp;&nbsp;"))
									.append($("<span>").html(data.locationId))
									.appendTo($('#list'));
						})
					},
					error : function(err) {
						console.error(err);
					}
				});
			}

			//location 검색버튼 이벤트
			$("#btnLocSearch").on("click", function(){
				// 검색페이지를 ajax -> 모달 바디 넣고 모달
				$.ajax({
					url:"/app/emp/empSearch",
					success:function(data){
						$("#managerIdModal .modal-body").html(data);
						$("#managerIdModal").modal("show");
					}
				});
			}); //매니저검색버튼 끝
			
			
			
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
			
			//매니저 아이디 입력 엔터키 방지
			 document.addEventListener('keydown', function(e){
				if(e.keyCode ===13){
					e.preventDefault();
				};
				return;
			})//end of 매니저 아이디 입력 엔터키 방지
			 
			//매니저아이디 입력 검색
			$("#managerId").on("keydown",function(e){
				
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
			})//end of 매니저아이디 입력 검색
			
			//close modal function
			function closeModal(){
					alert("매니저 선택되었습니다!");
					$("#managerIdModal").modal('hide');  //안닫혀ㅠㅠ
				};//end of close modal function
			
			
		});
	</script>




</head>
<body>
	<div align="center">
		<br>
		<h3>부서관리</h3>
		<br>
		<div>
			<button id="deptInsertModalBtn" class="btn btn-success" >부서등록</button>&nbsp;&nbsp;&nbsp;
			<button id="deptUpdateModalBtn" class="btn btn-info" >부서정보수정</button>&nbsp;&nbsp;&nbsp;
			<button id="deptDeleteModalBtn" class="btn btn-danger">부서삭제</button>
			<br>
			<br>
		</div>

		<div id="list"></div>
	</div>



	<!-- dept insert modal -->
	<div class="modal" tabindex="-1" role="dialog" id="deptInsertModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">부서를 등록!!!!!!!!</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form name ="registerEmpFrm" id="registerEmpFrm" action="${not empty emp ?'update':'register'}" method="post">
							<c:if test="${empty dept }">
							<div class="form-group">
								<label>부서 아이디를 입력하세요</label><span class="require">*</span> <input id="deptId"
									name="deptId" class="form-control"
									placeholder="deptId" value="${dept.deptId }" required>
							</div>
							</c:if>
							
							<div class="form-group">
								<label>부서 이름을 입력하세요</label> <input id="departmentName"
									name="departmentName" class="form-control" placeholder="departmentName" value="${dept.departmentName }" required>
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
							
							<div class="form-group">
								<label>지역 아이디를 입력하세요</label><span class="require">*</span> 
								<input id="locationId" name="locationId" class="form-control" placeholder="locationId" value="${dept.locationId }" required>
									<input id="locationName" name="locationName" class="form-control" placeholder="locationName" disabled>  
									<br>
									<button type="button" class="btn btn-primary" id="btnLocSearch">Location search!
									</button>
							</div>
							<div class="modal-footer">
							<button class="btn btn-success" type="button" id="btnRegister">등 록 하 기</button> &nbsp;&nbsp;&nbsp;
							<button class="btn btn-info" type="button" data-dismiss="modal">취  소</button>
							</div>
						</form>
				</div>
			</div>
		</div>
	</div>
	<!--/ end of dept insert modal -->
	
	
	
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