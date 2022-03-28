<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(function() {
		//커서
		$('#myModal').on('shown.bs.modal', function() {
			$('#id').trigger('focus')
		})
		$('#myModal2').on('shown.bs.modal', function() {
			$('#name').trigger('focus')
		})

		let checkId = 0;

		//아이디 중복 체크
		$('#confirmId').click(
				function() {
					/* if($('#id').val().trim()==''){
						$('#message_id').css('color','red').text('아이디를 입력하세요');
						$('#id').val('').focus();
						return;
					} */

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
</head>
<!-- 상단 시작 -->
<header class="css-6k8tqb" id="header">
	<nav>
		<div class="css-1gkas1x-Grid e1689zdh0">
			<div class="css-1djzg97">
				<ul class="css-6v7b8v-VisualUl">
					<li class="css-t686xv"><a
						href="${pageContext.request.contextPath}/main/main.do"><img
							src="${pageContext.request.contextPath}/resources/images/logo.png"
							height="62px;"></a></li>
					<li class="categories css-bj71cw"><button
							onclick="location.href='${pageContext.request.contextPath}/main/main.do?type=movie'"
							class="<c:if test="${param.type eq 'movie' && empty param.id  }">css-x6oby2-StylelessButton</c:if>
							<c:if test="${param.type ne 'movie' || !empty param.id }">css-q65tx9-StylelessButton</c:if>">영화</button></li>
					<li class="categories css-bj71cw"><button
							onclick="location.href='${pageContext.request.contextPath}/main/main.do?type=tv'"
							class="<c:if test="${param.type eq 'tv' && empty param.id  }">css-x6oby2-StylelessButton</c:if><c:if test="${param.type ne 'tv' || !empty param.id }">css-q65tx9-StylelessButton</c:if>">TV</button></li>
					<li class="categories css-bj71cw"><button
							onclick="location.href='${pageContext.request.contextPath}/chatboard/list.do'"
							class="css-q65tx9-StylelessButton">채팅방</button></li>
					<li class="css-1c3wwgb"><div class="css-1xm32e0">
							<div class="css-1okeg7p">
								<form
									action="${pageContext.request.contextPath}/contents/search.do"
									method="get">
									<label class="css-kyr608" id="label"><input type="text"
										autocomplete="off" placeholder="콘텐츠를 검색해보세요." name="keyword"
										value="${param.keyword}" class="css-13i5xe6" id="keyword">
										<div value="false" class="css-ikj5sk">
											<span aria-label="clear" role="button" class="css-14vwb0g"></span>
										</div></label>
								</form>
							</div>
						</div></li>
					<c:if test="${empty user_num ||  user_num ==0 }">
						<!--onclick="location.href='${pageContext.request.contextPath}/member/login.do'"-->
						<!-- data-target="#myModal" data-toggle="modal" data-remote="${pageContext.request.contextPath}/member/login.do" -->
						<!-- 로그인 -->
						<li class="css-bj71cw">
							<%--<button id="login-btn"
								onclick="location.href='${pageContext.request.contextPath}/member/login.do'"
								class="css-fn0ezc-StylelessButton">로그인</button>--%>
							<button id="login-btn" type="button"
								class="css-fn0ezc-StylelessButton" data-bs-toggle="modal"
								data-bs-target="#myModal">로그인</button>
						</li>
						<!-- 로그인 -->
						<li class="css-bj71cw">
							<%-- <button id="register-btn"
								onclick="location.href='${pageContext.request.contextPath}/member/registerUser.do'"
								class="css-139vxi-StylelessButton">회원가입</button></li> --%>
							<button id="register-btn" type="button" class="css-139vxi-StylelessButton"
								data-bs-toggle="modal" data-bs-target="#myModal2">회원가입
							</button>
					</c:if>
					<%-- <c:if test="${mem_num != null }">
						<li class="css-bj71cw"><a href="/ko-KR/review"><span
								class="css-1kqg656">여기 뭐였죠</span></a></li>
						<li class="css-bj71cw"><a title="회원 page" href=""><div
									class="css-ipiine">
									<div class="css-1wkpkpw-ProfilePhotoImage"></div>
								</div></a></li>
					</c:if> --%>
					<c:if test="${!empty user_num && user_num !=0}">
						<li class="css-bj71cw"><button
								onclick="location.href='${pageContext.request.contextPath}/member/logout.do'"
								class="css-fn0ezc-StylelessButton" id="header_logout">로그아웃</button></li>
					</c:if>
					<c:if test="${!empty user_num &&user_num != 0 && empty user_photo}">
						<a
							href="${pageContext.request.contextPath}/member/myPage.do?user_num">
							<img
							src="${pageContext.request.contextPath}/resources/images/face.png"
							width="25" height="25" class="my-photo">
						</a>
					</c:if>
					<c:if test="${!empty user_num && user_num !=0 && !empty user_photo}">
						<a
							href="${pageContext.request.contextPath}/member/myPage.do?user_num=0">
							<img
							src="${pageContext.request.contextPath}/member/photoView.do?user_num=0"
							width="25" height="25" class="my-photo">
						</a>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>
</header>
<!-- 상단 끝 -->
<!--로그인 모달 틀-->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<jsp:include page="/WEB-INF/views/member/memberLogin.jsp" />
		</div>
	</div>
</div>

<!--회원가입 모달 틀-->
<div id="myModal2" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<jsp:include page="/WEB-INF/views/member/memberRegister.jsp" />
		</div>
	</div>
</div>