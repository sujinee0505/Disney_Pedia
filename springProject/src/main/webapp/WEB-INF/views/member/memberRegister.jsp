<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	//커서
	$('#myModal2').on('shown.bs.modal', function() {
		$('#name').trigger('focus')
	})

	let checkId = 0;

	//아이디 중복 체크
	$('#confirmId').click(
			function() {

				$.ajax({
					url : '../member/confirmId.do',
					type : 'post',
					data : {
						id : $('#id').val()
					},
					dataType : 'json',
					cache : false,
					timeout : 30000,
					success : function(param) {
						if (param.result == 'idNotFound') {
							$('#message_id').css('color', '#000').text(
									'등록가능ID');
							checkId = 1;
						} else if (param.result == 'idDuplicated') {
							$('#message_id').css('color', 'red').text(
									'중복된ID');
							$('#id').val('').focus();
							checkId = 0;
						} else if (param.result == 'notMatchPattern') {
							$('#message_id').css('color', 'red').text(
									'영문,숫자 4~12');
							$('#id').val('').focus();
							checkId = 0;
						} else {
							checkId = 0;
							alert('ID 중복체크 오류');
						}
					},
					error : function() {
						checkId = 0;
						alert('네트워크 오류 발생');
					}
				});
			});//end of click

	//아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
	$('#register_form #id').keyup(function() {
		checkId = 0;
		$('#message_id').text('');
	});

	//submit 이벤트 발생시 아이디 중복 체크 여부 확인
	$('#register_form').submit(function() {
		if (checkId == 0) {
			$('#message_id').css('color', 'red').text('아이디 중복 체크 필수');
			if ($('#id').val().trim() == '') {
				$('#id').val('').focus();
			}
			return false;
		}
	});
});
</script>
<!DOCTYPE html>
<body>   
<!-- Modal Header -->
<div>
	<img src="${pageContext.request.contextPath}/resources/images/logo.png" height="86px;" class="sign-logo">
	<h4 class="modal-title">회원가입</h4>
</div>
<!-- Modal body -->
<div class="modal-body">
	<form action="${pageContext.request.contextPath}/member/registerUser.do" method="post" class="form-horizontal"
		role="form" id="signUp_form">
		
			<div class="form-group">
			<input type="text" id="name" name="name" class="form-control" 
			placeholder="이름" autofocus required>
			</div><p>
			
			<div class="form-group">
			<input type="text" id="id" name="id" class="form-control" 
			placeholder="아이디"  required>
			</div><p>
			<!-- <input type="button" id="confirmId" value="중복체크" class="btn btn-danger btn-xs"><BR>
			중복체크 메시지 부분
			<span id="message_id"></span>	
			<p> -->
						
			<div class="form-group">
			<input type="password" id="passwd" name="passwd" 
			class="form-control" placeholder="비밀번호" required>
			</div><p>	
		
			<div class="form-group">
			<button class="btn btn-3 form-control sign-btn" type="submit">
			회원가입
			</button>
			</div><p>
	
			<div class="alter">
			이미 가입하셨나요? 		
			<a href="#" data-bs-toggle="modal" data-bs-target="#myModal" class="alter_text">
			로그인</a>
			</div>	<p>		
		</form>
</div> <!-- 모달바디끝 -->
<div class="modal-footer">
	<div class="social_login align-center">
			social sign up
	</div>
</div>

</body>
</html>