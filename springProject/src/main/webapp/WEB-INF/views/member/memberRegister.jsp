<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		let checkId = 0;
		
		//아이디 중복 체크
		$('#confirmId').click(function(){
			if($('#id').val().trim()==''){
				$('#message_id').css('color','red').text('아이디를 입력하세요');
				$('#id').val('').focus();
				return;
			}
			
			$.ajax({
				url:'confirmId.do',
				type:'post',
				data:{id:$('#id').val()},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result == 'idNotFound'){
						$('#message_id').css('color','#000').text('등록가능ID');
						checkId = 1;
					}else if(param.result == 'idDuplicated'){
						$('#message_id').css('color','red').text('중복된ID');
						$('#id').val('').focus();
						checkId = 0;
					}else if(param.result == 'notMatchPattern'){
						$('#message_id').css('color','red').text('영문,숫자 4~12');
						$('#id').val('').focus();
						checkId = 0;
					}else{
						checkId=0;
						alert('ID중복체크 오류');
					}
				},
				error:function(){
					checkId = 0;
					alert('네트워크 오류 발생');
				}
			});
		});//end of click
		
		//아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
		$('#register_form #id').keyup(function(){
			checkId=0;
			$('#message_id').text('');
		});
		
		//submit 이벤트 발생시 아이디 중복 체크 여부 확인
		$('#register_form').submit(function(){
			if(checkId == 0){
				$('#message_id').css('color','red').text('아이디 중복 체크 필수');
				if($('#id').val().trim()==''){
					$('#id').val('').focus();
				}
				return false;
			}
		});
	});
</script>
<div class="page-main">
	<h2>회원 가입</h2>
	<form:form modelAttribute="memberVO" action="registerUser.do" id="register_form">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="id">아이디</form:label>
				<form:input path="id" placeholder="영문,숫자 4~12"/>
				<input type="button" id="confirmId" value="ID중복체크">
				<span id="message_id"></span>
				<form:errors path="id" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="name">이름</form:label>
				<form:input path="name"/>
				<form:errors path="name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="passwd">비밀번호</form:label>
				<form:password path="passwd" placeholder="영문,숫자 4~12"/>
				<form:errors path="passwd" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->