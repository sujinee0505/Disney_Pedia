<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dain.css">

<!-- 중앙 컨텐츠 시작 -->
<!-- ckedior 라이브러리 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/uploadAdapter.js"></script>
<div class="page-main">
     
     
	<form:form modelAttribute="chatBoardVO" action="write.do" id="register_form" >  
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="title">제목</form:label>
				<form:input path="title"/>
				<form:errors path="title" cssClass="error-color"/>
			</li>
					<li>내용</li>
			<li>
				<form:textarea path="content"/>
				<form:errors path="content" cssClass="error-color"/>   
				<script>
				 function MyCustomUploadAdapterPlugin(editor) {
					    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        return new UploadAdapter(loader);
					    }
					}
				 
				 ClassicEditor
		            .create( document.querySelector( '#content' ),{
		            	extraPlugins: [MyCustomUploadAdapterPlugin]
		            })
		            .then( editor => {
						window.editor = editor;
					} )
		            .catch( error => {
		                console.error( error );
		            } );
			    </script>     
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