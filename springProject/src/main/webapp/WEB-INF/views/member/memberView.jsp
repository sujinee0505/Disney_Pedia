<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 중앙 컨텐츠 시작 -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		//프로필 사진 업로드
		$('#photo_btn').click(function() {
			$('#photo_choice').show();
			$(this).hide();
		});
		//처음 화면에 보여지는 이미지 읽기
		let photo_path = $('.my-photo').attr('src');
		let my_photo;
		$('#upload').change(
				function() {
					my_photo = this.files[0];
					if (!my_photo) {
						$('.my-photo').attr('src', photo_path);
						return;
					}
					if (my_photo.size > 1024 * 1024) {
						alert(Math.round(my_photo.size / 1024)
								+ 'kbytes(1024kbytes까지만 업로드 가능)');
						$('.my-photo').attr('src', photo_path);
						$(this).val('');
						return;
					}
					//이미지 미리보기
					var reader = new FileReader();
					reader.readAsDataURL(my_photo);

					reader.onload = function() {
						$('.my-photo').attr('src', reader.result);
					};
				});//end of change

		//이미지를 서버에 전송
		$('#photo_submit').click(function() {
			if ($('#upload').val() == '') {
				alert('파일을 선택하세요!');
				$('#upload').focus();
				return;
			}
			//파일 전송
			var form_data = new FormData();
			form_data.append('upload', my_photo);

			$.ajax({
				url : 'updateMyPhoto.do',
				type : 'post',
				data : form_data,
				dataType : 'json',
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(param) {
					if (param.result == 'logout') {
						alert('로그인 후 사용하세요');
					} else if (param.result == 'success') {
						alert('프로필 사진이 수정되었습니다.');
						photo_path = $('.my-photo').attr('src');
						$('#upload').val('');
						$('#photo_choice').hide();
						$('#photo_btn').show();
					} else {
						alert('파일 전송 오류 발생');
					}
				},
				error : function() {
					alert('네트워크 오류 발생');
				}
			});
		});//end of click

		$('#photo_reset').click(function() {
			$('.my-photo').attr('src', photo_path);
			$('#upload').val('');
			$('#photo_choice').hide();
			$('#photo_btn').show();
		});

	});
</script>
<style>
div {
	display: block;
}

body {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 1.42857143;
	color: #333;
	background-color: #fff;
}

body {
	margin: 0;
	font-family: var(- -bs-body-font-family);
	font-size: var(- -bs-body-font-size);
	font-weight: var(- -bs-body-font-weight);
	line-height: var(- -bs-body-line-height);
	color: var(- -bs-body-color);
	text-align: var(- -bs-body-text-align);
	background-color: var(- -bs-body-bg);
	-webkit-text-size-adjust: 100%;
	-webkit-tap-highlight-color: transparent;
}

section {
	display: block;
}

li {
	list-style: none
}

ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

input[type=button] {
	display: inline-block;
	outline: 0;
	cursor: pointer;
	border: none;
	padding: 0 56px;
	width: 300px;
	height: 45px;
	line-height: 45px;
	border-radius: 7px;
	background-color: #0070f3;
	color: white;
	font-weight: 400;
	font-size: 16px;
	box-shadow: 0 4px 14px 0 rgb(0 118 255/ 39%);
	transition: background 0.2s ease, color 0.2s ease, box-shadow 0.2s ease;
	margin: auto;
}

input[type=button]: hover {
	background: rgba(0, 118, 255, 0.9);
	box-shadow: 0 6px 20px rgb(0 118 255/ 23%);
}
</style>
<div id="root">
	<div class="css-5jq76">
		<div class="css-1xm32e0">
			<section class="css-18gwkcr">
				<div class="css-egiga7-Self e19zkogf0">
					<div class="css-19rw4yc-Container e19zkogf1">
						<div class="css-1xqcv4t">
							<div class="css-19lj1vd-RoundedCornerBlock-RoundedCornerBlock">
								<section class="css-q4evg3-MyPage e19zkogf2">
									<div class="css-ewkqyn-WallPaper e19zkogf3">
										<ul>
											<li><c:if test="${empty member.photo_name}">
													<img
														src="${pageContext.request.contextPath}/resources/images/face.png"
														width="200" height="200" class="my-photo">
												</c:if> <c:if test="${!empty member.photo_name}">
													<img
														src="${pageContext.request.contextPath}/member/photoView.do"
														width="200" height="200" class="my-photo">
												</c:if></li>
										</ul>
									</div>
									<div class="css-1gkas1x-Grid e1689zdh0">
										<div class="css-1y901al-Row emmoxnt0">
											<header class="css-1hjjbcz-ProfileHeader e19zkogf4">
												<div class="css-1gry5r7"></div>
												<div class="css-5inudd-NameBlock e19zkogf5">
													<h1 class="css-aizam7-Name e19zkogf6">${member.name}</h1>
												</div>
												<div class="css-7w44b1-AboutMe e19zkogf9">
													<div class=" css-sloxdm-StyledSelf eb5y16b0">
														<div class="css-1fucs4t-StyledText eb5y16b1">${member.introduction}</div>
													</div>
												</div>
												<div class="profile-userbuttons">
													<input type="button" value="프로필수정"
														onclick="location.href='update.do'"> <a
														href="${pageContext.request.contextPath}/main/main.do">
														<img
														src="${pageContext.request.contextPath}/resources/images/review.png"
														width="40" height="40">
													</a> <a href="${pageContext.request.contextPath}/main/main.do">
														<img
														src="${pageContext.request.contextPath}/resources/images/list.png"
														width="40" height="40">
													</a> <a
														href="${pageContext.request.contextPath}/calendar/calendar.do?mem_num=${member.mem_num}">
														<img
														src="${pageContext.request.contextPath}/resources/images/cal.png"
														width="40" height="40">
													</a>
												</div>
										</div>
										</header>

										<div class="css-usdi1z">
											<div class="css-9dnzub">
												<div class="css-174lxc3">
													<div class="css-1gkas1x-Grid e1689zdh0">
														<div class="css-1y901al-Row emmoxnt0">
															<ul
																class="e19zkogf12 css-i1bo8u-VisualUl-CategoryArchivesUl">
																<li
																	class="css-1u4jvye-CategoryArchivesListItem e19zkogf13"><a
																	background="[object Object]"
																	class="css-h3f67w-CategoryArchivesLink e19zkogf14"
																	href="/ko-KR/users/87Gv7NW3MDqE6/contents/movies"><ul
																			class="css-reeb92-VisualUl-CategoryArchives e19zkogf15">
																			<li
																				class="css-r3hbc5-CategoryArchivesName e19zkogf16">영화</li>
																			<li
																				class="css-7xoi89-CategoryArchivesRatedCount e19zkogf17">★61</li>
																			<li
																				class="css-kcevqh-CategoryArchivesWishedCount e19zkogf18">보고싶어요<strong>
																					1</strong></li>
																		</ul></a></li>
																<li
																	class="css-1u4jvye-CategoryArchivesListItem e19zkogf13"><a
																	background="[object Object]"
																	class="css-1gw6y00-CategoryArchivesLink e19zkogf14"
																	href="/ko-KR/users/87Gv7NW3MDqE6/contents/tv_seasons"><ul
																			class="css-1x0nmo-VisualUl-CategoryArchives e19zkogf15">
																			<li
																				class="css-r3hbc5-CategoryArchivesName e19zkogf16">TV
																				프로그램</li>
																			<li
																				class="css-7xoi89-CategoryArchivesRatedCount e19zkogf17">★3</li>
																			<li
																				class="css-kcevqh-CategoryArchivesWishedCount e19zkogf18">보고싶어요<strong>
																					0</strong></li>
																		</ul></a></li>
																<div class="css-ml096x"></div>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>