<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<form:form modelAttribute="chatBoardVO" action="update.do" id="upate_form"
	               enctype="multipart/form-data">
		<form:hidden path="chatboard_num"/>
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="title">제목</form:label>
				<form:input path="title"/>
				<form:errors path="title" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="content">내용</form:label>
				<form:textarea path="content"/>
				<form:errors path="content" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="upload">파일업로드</form:label>
				<input type="file" name="upload" id="upload">
				<c:if test="${!empty boardVO.filename}">
				<br>
				<span id="file_detail">(${boardVO.filename})파일이 등록되어 있습이다.
				다시 업로드하면 기존 파일은 삭제됩니다.
				<input type="button" value="파일삭제" id="file_del">
				</span>
<script type="text/javascript">
	$(function(){
		$('#file_del').click(function(){
			let choice = confirm('삭제하시겠습니까?');
			if(choice){
				$.ajax({
					url:'deleteFile.do',
					data:{chatboard_num:${chatBoardVO.chatboard_num}},
					type:'post',
					dataType:'json',
					cache:false,
					timeout:30000,
					success:function(param){
						if(param.result == 'logout'){
							alert('로그인 후 사용하세요');
						}else if(param.result == 'success'){
							$('#file_detail').hide();	
						}else{
							alert('파일 삭제 오류 발생');
						}
					},
					error:function(){
						alert('네트워크 오류 발생');
					}
				});
			}
		});
	});
</script>				
				</c:if>
			</li>
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="등록" 
			                         onclick="location.href='list.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->