<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		//비밀번호 변경 체크
		$('#passwd').keyup(function(){
			if($('#confirm_passwd').val() != '' 
					&& $('#confirm_passwd').val() != $(this).val()){
				$('#message_id').text('비밀번호 불일치').css('color','red');	
			}else if($('#confirm_passwd').val() != '' 
					&& $('#confirm_passwd').val() == $(this).val()){
				$('#message_id').text('비밀번호 일치').css('color','#000');
			}                                 
		});
		$('#confirm_passwd').keyup(function(){
			if($('#future_passwd').val() != '' 
					&& $('#future_passwd').val() != $(this).val()){
				$('#message_id').text('비밀번호 불일치').css('color','red');
			}else if($('#future_passwd').val() != '' 
					&& $('#future_passwd').val() == $(this).val()){
				$('#message_id').text('비밀번호 일치').css('color','#000');
			}
		});
		
		$('#change_form').submit(function(){
			if($('#now_passwd').val().trim() == ''){
				alert('현재 비밀번호를 입력하세요!');
				$('#now_passwd').val('').focus();
				return false;
			}
			if($('#future_passwd').val().trim() == ''){
				alert('변경할 비밀번호를 입력하세요!');
				$('#future_passwd').val('').focus();
				return false;
			}
			if($('#confirm_passwd').val().trim() == ''){
				alert('변경할 비밀번호 확인을 입력하세요!');
				$('#confirm_passwd').val('').focus();
				return false;
			}
			if($('#future_passwd').val() != $('#confirm_passwd').val()){
				$('#message_id').text('비밀번호 불일치').css('color','red');
				return false;
			}
		});
	});
</script>
<style>
body {
	background: #F1F3FA;
}

ul li {
	list-style: none;
	text-align: center !important;
}
</style>
<div id="root">
	<form:form modelAttribute="memberVO" acceptCharset="changePassword.do" id="change_form">
		<form:errors element="div" cssClass="error-color" />
		<div class="css-5jq76">
			<div class="css-1xm32e0">
				<section class="css-18gwkcr">
					<div class="css-egiga7-Self e19zkogf0">
						<div class="css-19rw4yc-Container e19zkogf1">
							<div class="css-1xqcv4t">
								<div class="css-19lj1vd-RoundedCornerBlock-RoundedCornerBlock">
									<section class="css-q4evg3-MyPage e19zkogf2">
										<div class="css-1gkas1x-Grid e1689zdh0">
											<div class="css-1y901al-Row emmoxnt0">
												<header class="css-1hjjbcz-ProfileHeader e19zkogf4">
													<div class="css-1gry5r7">
													<h3 class="passtitle">비밀 번호 변경</h3>
													<p class="passtitle2">변경할 비밀번호를 입력해주세요.</p>
													</div>
													<ul>
														<li>
															<form:password class="passwd" path="now_passwd" placeholder="현재 비밀번호를 입력해주세요." /> 
															<form:errors path="now_passwd" cssClass="error-color" />
														</li>
														<li>
															<form:password class="passwd" id="future_passwd" path="passwd" placeholder="새 비밀번호를 입력해주세요."/> 
															<form:errors path="passwd" cssClass="error-color" />
														</li>
														<li>
															<input type="password" id="confirm_passwd" class="passwd" placeholder="새 비밀번호를 한 번 더 입력해주세요."> 
															<span id="message_id"></span>
														</li>
													</ul>
													<div class="profile-userbuttons">
														<form:button class="modibtn">수정</form:button>
														<input type="button" class="homebtn" value="이전으로" onclick="location.href='${pageContext.request.contextPath}/member/update.do'">
													</div>
											</div>
										</header>
										</div>
									</section>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->