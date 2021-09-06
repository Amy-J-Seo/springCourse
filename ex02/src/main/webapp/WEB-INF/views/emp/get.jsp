<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">멤버 상세보기</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">멤버</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<h1>${member.lastName }</h1>
				<h3>${member.employeeId }</h3>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
		
<br>
<div align="center">
	<a class="btn btn-primary"
		href="${pageContext.request.contextPath }/emp/list">목록</a> <a
		class="btn btn-warning"
		href="${pageContext.request.contextPath }/emp/modify?employeeId=${member.employeeId }">수정</a>
	<button class="btn btn-danger"
		data-toggle="modal" data-target="#deleteModal">삭제</button>
</div>
		
		
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->


<!--delete Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">정말로 삭제하시겠습니까?</h4>
			</div>
			<div class="modal-body">${member.employeeId } : ${member.lastName } 이 직원을 정말로 삭제 하시겠습니까?????????</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<a type="button" class="btn btn-primary" href="${pageContext.request.contextPath }/emp/remove?employeeId=${member.employeeId }" >삭!!!제!!!</a>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
