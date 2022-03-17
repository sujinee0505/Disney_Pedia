<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main">
	<h2>회원정보수정</h2>
	<form:form modelAttribute="memberVO" action="update.do" id="modify_form">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="name">이름</form:label>
				<form:input path="name"/>
				<form:errors path="name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="introduction">소개</form:label>
				<form:textarea path="introduction"/>
				<form:errors path="introduction" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->    