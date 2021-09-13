<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@  taglib  prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>커스텀 로그인</h2>
<form action="login" method="post">
<!-- 교재 633 -->
<input type="text" name="${_csrf.parameterName}" value="${_csrf.token }">
<input type="text" name="id">
<input type="password" name="password">
<button>로그인</button>
</form>


</body>
</html>