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
									<td><a class="move" href="${item.employeeId}">${item.lastName }</a></td>
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
					
					<!-- paging -->
					<div class="pull-right">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous">
									<a href="${pageMaker.startPage -1}">Previous</a>
								</li>
							</c:if>
							
							<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								<li class="paginate_button"><a href="${num }">${num }</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next">
									<a href="${pageMaker.endPage +1}">Next</a>
								</li>
							</c:if>
						</ul>
						<!-- pagination form -->
						<form id="actionForm" action="list" method="get">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						</form>
					</div>
					<!-- /.End of paging -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->


	<script>
	 var actionForm = $('#actionForm');

	 $(document).ready(function() {
		 /* emp last_name 클릭시 상세페이지 이동 */
		 $(".move").on("click", function(e){
			 e.preventDefault();
			 actionForm.append("<input type='hidden' name='employeeId' value='"+ $(this).attr("href")+"'>");
			 actionForm.attr("action", "get");
			 actionForm.submit();
			 
		 });/*/. end of emp last_name 클릭시 상세페이지 이동 */
		 
	      $(".paginate_button a").on("click", function(e){
	    	 e.preventDefault();
	    	 console.log('click');
	    	 actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	    	 actionForm.submit();
	      });
	    });
	</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>