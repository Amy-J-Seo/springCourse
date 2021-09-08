<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <!-- jQuery -->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
$(document).ready(function(){
	//addEventListener와 동일. 이벤트 여려개 추가 가능
	$('#btn1').on('click', function(){
		$.ajax({
			url:"ajax1",
			method: "get",
			//async:false, //동기식으로 호출
			//data: "writer=" +$("#writer").val(),
			data: {
				writer: $("#writer").val()
			},
			dataType:"json", //text, json, xml, 생략하면 그냥 string이래
			success: function(data){
				$('#result').append(data.writer+ "<br>");
				$('#result').append(data.content+ "<br>");
			},
			error: function(reject){
				console.error(reject);
			}
			
		});
		
	}); //end of btn1 click
	//btn2 addEventListener
	$('#btn2').on('click', function(){
		$.ajax({
			url:"ajax2",
			method:"post",
			data:JSON.stringify({
				writer: $("#writer").val()
			}),
			contentType:"application/json",
			dataType:"json",
			success: function(data){
//				$('#result').append($("<p/>").append(data.content)
//											 .append(<br>)
//											.append(data.writer));
				$('#result').append($(`<p>\${data.writer} : \${data.content}</p>`));
			},1
			error: function(reject){
				console.error(reject);
			}
		});
		
	});//end of btn2 addEvent
	//p tag onclick --작동안함. 왜냐하면 아직 피태그 안만들어졌는데 달아버려서
	//그래서 jquery 책에 그룹 이벤트랑 위임 찾아보래.
	//동적으로 추가된 태그에도 미리 이벤트를 지정
	$("#result").on('click',"p", function(){
		$(this).remove();
	})//end of ptag onclick
	
	}); //end of doc.ready();
</script>

</head>
<body>
<div align="center">
<input type="text" name="writer" id="writer"><br>
<button type="button" id="btn1">String(쿼리문자열)</button>
<button type="button" id="btn2">Yaaaaaa(JSON)</button>
<div id="result"></div>
</div>

</body>
</html>