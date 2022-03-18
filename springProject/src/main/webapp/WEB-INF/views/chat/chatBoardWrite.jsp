<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->

<div class="page-main">
	<h2>글쓰기</h2> <!-- Controller에서 자바빈(V0) 초기화하고 소문자 클래스명 -->
	<%-- <form:form modelAttribute="chatBoardVO" action="write.do" id="register_form" enctype="multipart/form-data">   --%>
	<form:form modelAttribute="chatBoardVO" action="write.do" id="register_form" >  
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="title">제목</form:label>
				<form:input path="title"/>
				<form:errors path="title" cssClass="error-color"/>
			</li>
			<%-- <li><b>내용</b></li>
			<li>
				<form:textarea path="content"/>
				<form:errors path="content" cssClass="error-color"/>
			</li> --%>
			<li>
				<form:label path="content">내용</form:label>
				<form:input path="content"/>
				<form:errors path="content" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="button" value="채팅하기" onclick=""> 
			<form:button>등록</form:button>
			<input type="button" value="목록" onclick="location.href='list.do'"> 
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->