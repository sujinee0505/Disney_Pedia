<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 중앙 컨텐츠 시작 -->
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
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
						alert('ID 중복체크 오류');
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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	font-family: 'Varela Round', sans-serif;
}

.modal-login {
	width: 320px;
	margin: 30px auto;
}

.modal-login .modal-content {
	border-radius: 1px;
	border: none;
}

.modal-login .modal-header {
	position: relative;
	justify-content: center;
	background: #f2f2f2;
}

.modal-login .modal-body {
	padding: 30px;
}

.modal-login .modal-footer {
	background: #f2f2f2;
}

.modal-login h4 {
	text-align: center;
	font-size: 26px;
}

.modal-login label {
	font-weight: normal;
	font-size: 13px;
}

.modal-login .form-control, .modal-login .btn {
	min-height: 38px;
	border-radius: 2px;
}

.modal-login .hint-text {
	text-align: center;
}

.modal-login .close {
	position: absolute;
	top: 15px;
	right: 15px;
}

.modal-login .checkbox-inline {
	margin-top: 12px;
}

.modal-login input[type="checkbox"] {
	margin-top: 2px;
}

.modal-login .btn {
	min-width: 100px;
	background: #3498db;
	border: none;
	line-height: normal;
}

.modal-login .btn:hover, .modal-login .btn:focus {
	background: #248bd0;
}

.modal-login .hint-text a {
	color: #999;
}

.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}
</style>
</head>
<body>
	<!-- 모달창 띄우는 부분 -->
	<div class="text-center">
		<a href="#myModal2" class="trigger-btn" data-toggle="modal">회원가입</a>
	</div>

	<!-- Modal HTML -->
	<div id="myModal2" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">

				<form:form modelAttribute="memberVO" action="registerUser.do"
					id="register_form">
					<div class="modal-header">
						<h4 class="modal-title">회원가입</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<%-- <form:label path="name">이름</form:label> --%>
							<form:input placeholder="이름" path="name" type="text"
								class="form-control" required="required" />
							<form:errors path="name" cssClass="error-color" />
						</div>

						<div class="form-group">
							<%-- <form:label path="id">아이디</form:label> --%>
							<form:input placeholder="아이디 " path="id" type="text"
								class="form-control" required="required" />
							<input type="button" id="confirmId" value="ID중복체크"> <span
								id="message_id"></span>
							<form:errors path="id" cssClass="error-color" />
						</div>

						<div class="form-group">
							<%-- <form:label path="passwd">비밀번호</form:label> --%>
							<form:password placeholder="비밀번호 " path="passwd"
								class="form-control" required="required" />
						</div>

						<div class="form-group">
							<form:button class="btn btn-primary form-control">회원가입</form:button>
						</div>

						<div class="clearfix">
							이미 가입하셨나요? 
							<a href='${pageContext.request.contextPath}/member/login.do'>로그인</a>
						</div>

					</div>
					<div class="modal-footer">
						<div class="form-group social">
							<input type="button" class="btn btn-primary form-control"
								value="소셜 로그인 들어갈부분">
						</div>

					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
<!-- 중앙 컨텐츠 끝 -->