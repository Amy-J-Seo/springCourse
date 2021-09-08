<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글 상세보기</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">DataTables Advanced Tables</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<tr class="odd gradeX">
							<td>${board.title }</td>
							<td>${board.writer }</td>
							<td><fmt:formatDate value="${board.regDate }"
									pattern="yyyy-MM-dd" /></td>
							<td>${board.content }</td>
						</tr>

					</tbody>
				</table>
				<!-- /.table-responsive -->

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div >
	
	<!-- /.col-lg-12 -->
	
	<!-- add reply -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>댓글 등록</h4>
		</div>
		<div class="panel-body">
			<form id="replyForm" method="post" action="../replies">
				<input type="hidden" name="bno" value="${board.bno }">
				<input name="replyer" value="user00" style="width:100px">
				<input name="reply">
				<button id="saveReply" type="button" class="btn btn-primary">댓글쓰기</button>
			</form>
		</div>
	</div>
	<!-- reply list -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>댓글 목록</h4>
				</div>
				<div class="panel-body">
					<ul class="chat">
						
					</ul>
					<!-- /end ul -->
				</div>
			</div>
			<!-- /end panel -->
		</div>
		<!-- end col -->
	</div>
	<!-- /end row -->
</div>
<!-- /.row -->

<br>
<div align="center">
	<a class="btn btn-primary"
		href="list?pageNum=${cri.pageNum }&amount=${cri.amount}">목록</a>
	<a id="toListBtn" class="btn btn-warning" href="editForm?bno=${board.bno}&pageNum=${cri.pageNum }&amount=${cri.amount}">수정</a>
	<button class="btn btn-danger"
		data-toggle="modal" data-target="#deleteModal">삭제</button>
</div>

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
			<div class="modal-body">${board.title } 이 글을 정말로 삭제 하시겠습니까?????????</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<a type="button" class="btn btn-primary" href="remove?bno=${board.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}" >삭!!!제!!!</a>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<script src="../resources/js/reply.js"></script>
<script>
/* 페이지 로드 이벤트 */
	let bno="${board.bno}";
	let str = "";
	   $(function() {
		      $(".delete").on("click", function() {
		         $('#frm').attr("action", "delete");
		         $('#frm').submit();
		      })
		   });
		   
		   $(function() {
		   //등록처리(post)
		   $("#saveReply").on("click", function() {
		      replyService.add(function (data) {       
		         $(".chat").append(makeLi(data));
		      });
		   });

		   /* $.ajax({
		      url : "../reply/",
		      method : "post",
		      data : $("#replyForm").serialize(),
		      dataType : "json",
		      success : function(data) {
		         console.log(data);
		         str = '<li class="left clearfix">'
		            + '   <div>'   
		            + '      <div class="header">'
		            + '         <strong class="primary-font">' + data.replyer + '</strong>'
		            + '         <small class="pull-right text-muted">'+ data.replyDate +'</small>'
		            + '      </div>'
		            + '      <p>'+ data.reply +'</p>'
		            + '   </div>'
		            + '</li>';
		                      
		         $(".chat").append(str);
		         } 
		   });*/
		   
		   //목록조회(get)
		   replyService.getList({bno:bno}, function (datas){
		      str = "";
		      for(i=0; i<datas.length; i++) {
		         str += makeLi(datas[i]);
		      }
		      $(".chat").html(str);
		   })
		   
		   function makeLi(data) {
		      return '<li class="left clearfix">'
		            + '   <div>'   
		            + '      <div class="header">'
		            + '         <strong class="primary-font">' + data.replyer + '</strong>'
		            + '         <small class="pull-right text-muted">'+ data.replyDate +'</small>'
		            + '      </div>'
		            + '  	 <div id="replyBtns">'   
		            + '     	 <span>'+ data.reply +'</span>'
		            + '    		<a style="float:right;" href="'+data.rno+'" id="replyDelete" class="btn btn-danger">삭제</a>'	
		            + '   		 <a style="float:right;" href="'+data.rno+'" id="replyEdit" class="btn btn-warning">수정</a>'
		            + '      </div>'
		            + '   </div>'
		            + '</li>'
		   }
		   /* $.ajax({
		      url : "../reply/",
		      data : {bno:bno},   //"bno=512"
		      dataType : "json",
		      success : function(datas) {
		      //console.log(datas);
		      str = "";
		      for(i=0; i<datas.length; i++) {
		         str += '<li class="left clearfix">'
		            + '   <div>'   
		            + '      <div class="header">'
		            + '         <strong class="primary-font">' + datas[i].replyer + '</strong>'
		            + '         <small class="pull-right text-muted">'+ datas[i].replyDate +'</small>'
		            + '      </div>'
		            + '      <p>'+ datas[i].reply +'</p>'
		            + '   </div>'
		            + '</li>';
		         }
		         $(".chat").html(str);
		      }
		   }) */
		   
		   //삭제처리(delete)
		   $(".chat").on("click","#replyDelete", function(e) {
			   e.preventDefault();
			   let rno = $('#replyDelete').attr('href');
			   let li= $(this).closest('li');
			   replyService.deleteReply(rno, function(count){
					console.log(count);
					 if(count ===true){
					alert("댓글 삭제 완료");
					$(li).remove();
					}
				}, function(err){
					alert('Error...');
				});
		   });
		   
		  
		   
		   
		});
	
	
	
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>