<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div>

<form method="post" enctype="multipart/form-data" action="uploadFormAction">
      <input type="file" name="uploadFile" multiple="multiple"> <!-- multiple 주면 한번에 동시에 가능하대 -->
      <!-- <input type="file" name="uploadFile">
      <input type="file" name="uploadFile"> -->
      <button>등록</button>
   </form>

</div>


</body>
</html>