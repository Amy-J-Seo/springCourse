<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	This is sample a jsp
</h1>

<form action="/sample/ex05">
<!-- 이 모든 것을 리스트 보로 한번에 받을 수 있대 -->
<input name="list[0].name"><input name="list[0].age"><br>
<input name="list[1].name"><input name="list[1].age"><br>
<input name="list[2].name"><input name="list[2].age"><br>
<button>send</button>
</form>


</body>
</html>
