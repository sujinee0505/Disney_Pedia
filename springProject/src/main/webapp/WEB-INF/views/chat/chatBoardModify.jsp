<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dain.css">
<style>
.ck-editor__editable_inline{
	min-height:250px;
}
</style>

<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<!-- ckedior 라이브러리 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/uploadAdapter.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<div class="page-main ">

	<form:form modelAttribute="chatboard" action="update.do" id="update_form">
	            <!--enctype="multipart/form-data">-->
		<form:hidden path="chatboard_num"/>
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
	     		<form:label path="title"><b>제목</b></form:label>
				<form:input path="title"/>
				<form:errors path="title" cssClass="error-color"/>
			</li>
			<li>
			<label><b>모집 여부</b></label>
				<input type="radio" name="mate_state" value="0" id="mate_state0" <c:if test="${chatboard.mate_state == 0}">checked</c:if>>구하는중
				<input type="radio" name="mate_state" value="1" id="smate_state1" <c:if test="${chatboard.mate_state == 1}">checked</c:if>>모집완료
              </li>		
					<li><b>내용</b></li>
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
			<!-- 
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
			</li> -->		
		<div class="align-center">
		    <button type="submit" value="수정" onclick="location.href='list.do'" class="btn btn-outline-primary">수정</button>
			<button type="button"  onclick="location.href='list.do'" class="btn btn-outline-secondary">수정취소</button>
			
		</div>
	</form:form>
</div>
<section class="css-7klu3x"></section>
<!-- 중앙 컨텐츠 끝 -->
