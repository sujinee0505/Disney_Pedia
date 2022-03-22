<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  --%>
<!DOCTYPE html>
<head>
<!-- <meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
</head>	
<body>
<!-- Modal contents(1) : 일반 폼 태그 버전 -->   

 
<!-- Modal Header -->
<div class="modal-header">
	<h4 class="modal-title">로그인</h4>
	<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>

<!-- Modal body -->
<div class="modal-body">
	<form action="${pageContext.request.contextPath}/member/login.do" method="post" class="form-horizontal"
		role="form">

		<label class="sr-only">ID</label> <input type="text" id="id" name="id"
			class="form-control" placeholder="ID" required autofocus><BR>
		<label class="sr-only">Password</label> <input type="password"
			id="passwd" name="passwd" class="form-control" placeholder="Password"
			required><br>

		<button class="btn btn-lg btn-primary btn-block" type="submit">
			로그인</button>
	</form>
</div>

<!-- Modal footer -->
<div class="modal-footer">
	footer
</div>
</body>


<!--======================= Modal contents(1) : 스프링 폼 태그 버전 ========================-->   
<%-- 
 <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
							로그인
						  </button>
 
  <div id="myModal" class="modal fade">  <!-- tabindex="-1" role="dialog" -->
    <div class="modal-dialog">
        <div class="modal-content">
       
       
<!-- Modal Header -->
<div class="modal-header">
	<h4 class="modal-title">로그인</h4>
	<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>

<!-- Modal body -->
<div class="modal-body">
	<form:form modelAttribute="memberVO" action="login.do"
					id="login_form">

		<label class="sr-only">ID</label> <input type="text" id="id" name="id"
			class="form-control" placeholder="ID" required autofocus><BR>
		<label class="sr-only">Password</label> <input type="password"
			id="passwd" name="passwd" class="form-control" placeholder="Password"
			required><br>

		<button class="btn btn-lg btn-primary btn-block" type="submit">
			로그인</button>
	</form:form>
</div>

<!-- Modal footer -->
<div class="modal-footer">
	footer
</div>


			</div>
		</div>
	</div>
	
</body>--%>
</html>