<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>


<h3>사원목록</h3>

<c:forEach items="${empList }" var="emp">
<div class="emp">
<span>${emp.employeeId }</span>
<span>${emp.firstName } ${emp.lastName }</span>
<span>${emp.email }</span>
</div>
</c:forEach>

<script>
$(function(){
	$(".emp").on("click", function(){
		var span=$(this).find("span");
		$("#managerId").val(span.eq(0).text());
		$("#name").val(span.eq(1).text());
		$("#managerIdModal").modal('hide'); //?????안닫혀...
	})
});

</script>