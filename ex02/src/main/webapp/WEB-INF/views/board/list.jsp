<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">게 시 판</h1>
			<a style="float:right; margin-bottom: 20px; margin-right: 20px;" class="btn btn-warning" href="registerForm">글  쓰  기</a>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="board">
						<thead>
							<tr>
								<th>Number</th>
								<th>Title</th>
								<th>Content</th>
								<th>Writer</th>
								<th>RegDate</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list }">
								<tr height="35">
									<td align="center">${item.bno }</td>
									<td><a class="move" href="${item.bno}">${item.title }</a> [${item.replycnt }]</td>
									<td>${item.content }</td>
									<td>${item.writer }</td>
									<td><fmt:formatDate value="${item.regDate }"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- /.table-responsive -->
					<!-- 넘겨줄 값이 많아서 폼을 만들어서 넘기겠다. 교재 311 -->
					<form id="actionForm" action="list" method="get">
						<select name="type">
						<option value=""
							<c:out value="${pageMaker.cri.type == null ? 'selected':'' }"/>
						>선택</option>
						<option value="T" 
							<c:out value="${pageMaker.cri.type eq 'T'? 'selected':'' }"/>
						>제목</option>
						<option value="C"
							<c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }"/>
						>내용</option>
						<option value="W"
							<c:out value="${pageMaker.cri.type eq 'W'? 'selected':'' }"/>
						>작성자</option>
						<option value="TC"
							<c:out value="${pageMaker.cri.type eq 'TC'? 'selected':'' }"/>
						>제목 or 내용</option>
						<option value="TW" 
							<c:out value="${pageMaker.cri.type eq 'TW'? 'selected':'' }"/>
						>제목 or 작성자</option>
						<option value="TWC"
							<c:out value="${pageMaker.cri.type eq 'TWC'? 'selected':'' }"/>
						>제목 or 내용 or 작성자</option>
						</select>
						<input type="text" name="keyword" value="${pageMaker.cri.keyword }">

		               <input type="hidden" id="pageNum" name="pageNum" value="1">
		               <input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount}">
		            	<button class='btn btn-default'>Search</button>
		            </form>
		            <div class="pull-right">
						<div id="pageButton">
				            <ul class="pagination">
								<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">이전</a></li>
								</c:if>
								
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
								<li class="paginate_button"><a href="${num }">${num }</a></li>
								</c:forEach>
								
								<c:if test="${pageMaker.next }">
								<li class="paginate_button next"><a href="${pageMaker.endPage+1 }">다음</a></li>
								</c:if>
							</ul>
						</div>
						<!--/.pageButton  -->
					<!-- /.pagination -->
					</div>
					<!-- /.pull-right -->
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
		 var actionForm = $('#actionForm');
		 
		 /* 타이틀 클릭 시 상세페이지로 넘어가면서 페이지넘&어마운트 같이 가져가기 */
		 $(".move").on('click', function(e){
			 e.preventDefault();
			 actionForm.append('<input type="hidden" id="bno" name="bno" value="'+ $(this).attr("href") +'">');
			 actionForm.attr("action", "get");
			 actionForm.submit();
		 });
		 
		 
		 /* 교재 312 */
		 $("#pageButton a").on("click", function(e){
			 e.preventDefault(); //a tag, submit
			 console.log('clicked')
			 var p=$(this).attr("href");
			 $('[name="pageNum"]').val(p);
			 
			 actionForm.submit();
		 });

			/* $('#board').DataTable({
	            responsive: true
	        });*/
	    });
	</script>
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	
