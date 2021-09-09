<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			${board }
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>내용</th>
							<th>파일이름</th>
						</tr>
					</thead>
					<tbody>
						<tr class="odd gradeX">
							<td>${board.title }</td>
							<td>${board.writer }</td>
							<td><fmt:formatDate value="${board.regDate }"
									pattern="yyyy-MM-dd" /></td>
							<td>${board.content }</td>
							<td>
								<c:forEach var="attach" items="${board.attachList}">
									<a href="download?uuid=${attach.uuid }">${attach.fileName }</a><br>
								</c:forEach>						
							</td>
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
					<!-- 댓글 페이지 리스트 -->
					<div class="panel-footer">
	
					</div><!-- /end of 댓글 페이지 리스트 -->
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

<!-- edit reply Modal -->
      <div class="modal fade" id="editReplyModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">댓글 수정</h4>
            </div>
            <div class="modal-body">
            	<input type="hidden" id="hiddenRno" name='rno'>
              <div class="form-group">
                <label>Reply</label> 
                <input class="form-control" name='reply' value='내용'>
              </div>      
              <div class="form-group">
                <label>댓글 작성자</label> 
                <input class="form-control" name='replyer' value='글쓴이'>
              </div>
            </div>
			<div class="modal-footer">
		        <button id='replyEditBtn' type="button" class="btn btn-warning">수정</button>
		        <button id='modalCloseBtn' type="button" data-dismiss="modal" class="btn btn-default">취소</button>
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
			showList(${cri.pageNum });
			
		   //댓글 등록처리(post)
		   $("#saveReply").on("click", function() {
		      replyService.add(function (data) {       
		         $(".chat").append(makeLi(data));
		         showList(-1); //댓글 등록 후 댓글 마지막 페이지로
		      });
		   });
		   
		   function showList(page){
			   //목록조회(get)
			   replyService.getList({bno:bno, page:page}, function (replyCnt, list){
			      
			      if(page==-1){
			    	  pageNum =Math.ceil(replyCnt/10.0);
			    	  //alert(pageNum +"from showList page ==-1")
			    	  showList(pageNum);
			    	  return;
			      }
			      
			      var str = "";
			      if(list ===null || list.length ==0){
			    	  return;
			      }
			      
			      for (i = 0; i < list.length; i++) {
			         str += makeLi(list[i]);
			      }
			      $(".chat").html(str);
			      showReplyPage(replyCnt);
			   });//end of 댓글목록조회getList
			   
		   }//end of showList function
		  
		   //get replyPages fuunction
		   var pageNum =1;
		   var replyPageFooter = $(".panel-footer");
		   function showReplyPage(replyCnt){
			   var endNum = Math.ceil(pageNum/10.0)*10;
			   var startNum =endNum-9;

			   var prev = startNum !=1;
			   var next = false;
			   
			   if(endNum *10 >= replyCnt){
				   endNum = Math.ceil(replyCnt/10.0);
			   }
				   
			   if(endNum * 10 < replyCnt){
				   next = true;
			   }
		   		var str= "<ul class='pagination pull-right'>";
		   		
		   		if(prev){
		   			str+="<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
		   		}
		   		
		   		for(var i =startNum; i<=endNum; i++){
		   			var active=pageNum ==1?"active":"";
		   			
		   			str+="<li class='page-item"+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		   		}
		   		
		   		if(next){
		   			str+="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
		   		}
		   		
		   		str+='</ul><div>';
		   		//console.log(str);
		   		replyPageFooter.html(str);
		   }// end of get replyPages function
		   
		   //onClick event reply pagination
		   replyPageFooter.on('click','li a', function(e){
			   e.preventDefault();
			 
			   var targetPageNum=$(this).attr("href");
			   		  
			   showList(targetPageNum);
		   });//End of onClick event reply pagination
		   
		   
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

			//댓글 수정처리(모달띄우기)
			var modal=$(".modal");
			var modalInputReply=modal.find("input[name='reply']");
			var modalInputWriter =modal.find("input[name='replyer']");
			
			var modalEditBtn=$("#replyEditBtn");
			
			//댓글수정버튼 이벤트(모달띄우기)
			 $(".chat").on("click","#replyEdit", function(e) {
				 e.preventDefault();
				 let rno = $(this).attr('href');
				 replyService.read(rno, function(data){
					 $(modalInputReply).val(data.reply);
					 $(modalInputWriter).val(data.replyer).attr("disabled", "disabled");
					 $("#hiddenRno").val(rno);
					 $(".modal").modal("show");
					 
				 }, function(err){console.error(err)});
				 
			 });// End of 댓글수정버튼 이벤트(모달띄우기)
		   
			 $(modalEditBtn).on('click', function(e){
				 var rno = $("#hiddenRno").val();
				var editedReply={
						reply: modalInputReply.val(),
						rno:rno
				};
				
				replyService.update(editedReply, function(result){
					alert("댓글이 수정되었습니다.")
					modal.find("input").val();
					modal.modal("hide");
					showList(1);
				});
			 });
			 
			 
		   //삭제처리(delete)
		   $(".chat").on("click","#replyDelete", function(e) {
			   e.preventDefault();
			   let rno = $(this).attr('href');
			   console.log("rno==================="+ rno);
			   let li= $(this).closest('li');
			   console.log("list=================="+JSON.stringify(li));
			   
			   replyService.deleteReply(rno, function(count){
					console.log("count==========="+count);
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