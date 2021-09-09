<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax file upload</title>
  <!-- jQuery -->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
  
</head>
<body>
<!-- 이건 폼태그 필요없대 -->
<div>
<form id="frm" name="frm">
<input type="text" name="writer">
<input type="text" name="content">
</form>
<!-- 파일은 검사해서 추가할 것임 -->
<input type="file" name="uploadFile" multiple="multiple">

</div>
<button type="button" id="uploadBtn">Upload</button>
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
			url:'uploadAjaxAction',
			processData:false,
			contentType:false,
			data: formData,
			method:'POST',
			success:function(result){
				console.log(result);
				alert("file uploaded");
			},
			error: function(reject){
				console.error(reject);
			}
		})
		
	
	}); //end of uploadBtn event
	
	
});/* 페이지로드이벤트 끝 */
</script>
</body>
</html>