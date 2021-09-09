<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <!-- jQuery -->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<br>
		<div class="panel panel-default">
			<div class="panel-heading">게시글 작성하기! </div>
			
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<form action="register" method="post" id="frm">
							<div class="form-group">
								<label>제목을 입력하세요</label> <input id="title" name="title" class="form-control" placeholder="Title">
							</div>
							<div class="form-group">
								<label>작성자</label> <input id="writer" name="writer" class="form-control" placeholder="Writer">
							</div>
							<div class="form-group">
								<label>본문을 입력하세요</label>
								<textarea id="content" name="content" class="form-control" rows="3"></textarea>
							</div>
							
							<!-- 미리보기 부분 -->
							<div class="uploadREsult"></div>
							<!-- 등록.취소버튼 -->
							<div style="float:right;">
							<button id="btnRegister" type="button" class="btn btn-warning">등록</button>
							<button type="reset" class="btn btn-danger">취소</button>
							</div>
						</form>
						<!-- 첨부파일만 떼 와서 ajax로 보내고 나머지는 등록 -->
							<div class="form-group">
								<label>File input</label> <input type="file" name="uploadFile" multiple="multiple">
								<button id="uploadBtn" class="bnt btn-primary" type="button">첨부파일 등록</button>
							</div>
							<div>
							<ul id="uploaded"></ul>
							</div>
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



<script>
/* 페이지 로드 이벤트 */
$(function(){
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB

	function checkExtension(fileName, fileSize) {

		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}

		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	//uploadBtn 눌렀을 때 이벤트 설정 교재502페이지
	$('#uploadBtn').on("click", function(e){
		e.preventDefault();
		//console.log(document.frm);
		var formData = new FormData(document.frm);
		//console.log("formData writer+content: "+ FormData)
		var inputFile = $("[name='uploadFile']");
		var files = inputFile[0].files;
		//console.log(files);
		
		for(var i=0; i<files.length; i++){
			if(!checkExtension(  files[i].name, files[i].size)  ){
				return;
			}
			formData.append("uploadFile", files[i]);
		}
		
		console.log("formData file: "+ formData)
		$.ajax({
			url:'../uploadAjaxAction',
			processData:false,
			contentType:false,
			data: formData,
			method:'POST',
			success:function(datas){
				console.log(datas);
				var str="";
				for(i=0;i<datas.length;i++){
					var obj=datas[i]
					var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
				    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				      
					str += "<li "
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='../resources/img/attach.png'></a>";
					str += "</div>";
					str +"</li>";
				}
				$("#uploaded").html(str);
				alert("file uploaded");
			},
			error: function(reject){
				console.error(reject);
			}
		})
	}); //end of uploadBtn event
	
	
	//btnRegister event  textbook 564page
	$("#btnRegister").on('click', function(e){
		var str = "";
		$("#uploaded li").each(function(idx, obj){
			var jobj = $(obj); //제이쿼리 객체로 변환시켜주자.
			str += "<input type='hidden' name='attachList["+idx+"].fileName' value='"+jobj.data("filename")+"'>";
		    str += "<input type='hidden' name='attachList["+idx+"].uuid' value='"+jobj.data("uuid")+"'>";
		    str += "<input type='hidden' name='attachList["+idx+"].uploadPath' value='"+jobj.data("path")+"'>";
		    str += "<input type='hidden' name='attachList["+idx+"].fileType' value='1'>"; //"+ jobj.data("type")+" 벨류안에 불린이어야하는데 지금 이거 안들어가서 오류
		});
		$("#frm").append(str).submit();
		
	});//end of btnRegister event
	
	//attachment btn delete event
	$("#uploaded").on("click", "button", function(e){
		if(confirm("Remove this file?")){
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	});//end of attachment btn delete event
	
	
	
});/* 페이지로드이벤트 끝 */
</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
