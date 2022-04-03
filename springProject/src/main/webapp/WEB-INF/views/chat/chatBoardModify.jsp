<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dain.css">
<style>
.ck-editor__editable_inline {
	min-height: 250px;
}
</style>
<!-- 중앙 컨텐츠 시작 -->
<script
	src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<div class="page-main ">

	<form:form modelAttribute="chatboard" action="update.do"
		id="update_form">
		<form:hidden path="chatboard_num" />
		<form:errors element="div" cssClass="error-color" />
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2"
						style="background-color: #eeeeee; text-align: center;"><img
						class="fit-picture"
						src="${pageContext.request.contextPath}/resources/images/disney.png";>
						게시글을 수정하세요 <img class="fit-picture"
						src="${pageContext.request.contextPath}/resources/images/disney.png";>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><form:input path="title" type="text" class="form-control"
							placeholder="제목" name="title" maxlength="50"></form:input></td>
				</tr>
				<tr>
					<td><form:textarea path="content" class="form-control"
							placeholder="내용" name="content" maxlength="2048"
							style="height: 350px;"></form:textarea></td>
				</tr>
			</tbody>
		</table>

		<c:if test="${dchatboard.mate_state==0}">
			<td style="width: 15%"><span
				class="badge rounded-pill bg-danger">모집 중!</span></td>
		</c:if>
		<c:if test="${dchatboard.mate_state==1}">
			<td style="width: 15%"><span
				class="badge rounded-pill bg-light text-dark">모집 마감</span></td>
		</c:if>
        <div>
		<input type="radio" name="mate_state" value="0" id="mate_state0">
			<c:if test="${chatboard.mate_state == 0}">
								<span class="badge rounded-pill bg-danger">모집 중!</span></td></c:if>
		<input type="radio" name="mate_state" value="1" id="smate_state1">
			<c:if test="${chatboard.mate_state == 1}">
								<span class="badge rounded-pill bg-light text-dark">모집 마감</span></td></c:if>
		</div>
		
		<div class="align-center">
			<button type="submit" value="수정" onclick="location.href='list.do'"
				class="btn btn-outline-primary">수정</button>
			<button type="button" onclick="location.href='list.do'"
				class="btn btn-outline-secondary">수정취소</button>
				
		</div>
	</form:form>
</div>
<section class="css-7klu3x"></section>
<!-- 중앙 컨텐츠 끝 -->
