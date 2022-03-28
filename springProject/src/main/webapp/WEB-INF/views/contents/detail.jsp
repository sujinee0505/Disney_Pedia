<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.rateit.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
	$(function() {
		header = function() {
			if ($(this).scrollTop() == 0) {
				$('#header').removeClass('css-6k8tqb').addClass('css-5brfx4');
				$('.css-q65tx9-StylelessButton').css('color',
						'rgba(255, 255, 255, 0.7)');
				$('#keyword').removeClass('css-13i5xe6')
						.addClass('css-1sc5b20');
				$('#label').removeClass('css-kyr608').addClass('css-y4utrt');
				$('#login-btn').removeClass('css-fn0ezc-StylelessButton')
						.addClass('css-1n4uax5-StylelessButton');
				$('#register-btn').removeClass('css-139vxi-StylelessButton')
						.addClass('css-1hpk3gd-StylelessButton');
			} else {
				$('#header').removeClass('css-5brfx4').addClass('css-6k8tqb');
				$('.css-q65tx9-StylelessButton').css('color', '#7e7e7e');
				$('#keyword').removeClass('css-1sc5b20')
						.addClass('css-13i5xe6');
				$('#label').removeClass('css-y4utrt').addClass('css-kyr608');
				$('#login-btn').removeClass('css-1n4uax5-StylelessButton')
						.addClass('css-fn0ezc-StylelessButton');
				$('#register-btn').removeClass('css-1hpk3gd-StylelessButton')
						.addClass('css-139vxi-StylelessButton');
			}
		}
		header();
		$(window).on('scroll', header);
		
		//코멘트 글자수체크
		/* $(document).on('keyup','textarea',function(){
			//입력한 글자수를 구함
			let inputLength = $(this).val().length;
			
			if(inputLength > 10000){//10000자를 넘어선 경우
				$(this).val($(this).val().substring(0,10000));
			}else{//10000자 이하인 경우
				let remain = 10000 - inputLength;
				remain += '/10000';
				if($(this).attr('id') == 'comment'){
					//등록폼 글자수
					$('#re_first .letter-count').text(remain);
				});
			}
		}); */
		//코멘트 커서
		$('#commentModal').on('shown.bs.modal', function() {
			$('#comment').trigger('focus')
		});
		$('#calendarModal').on('shown.bs.modal', function() {
		});
		$('#collectionsModal').on('shown.bs.modal', function() {
		});

		var user_num = ${user_num};
		var check = ${check}

		like = function() {
			if (user_num == 0) { // 로그인 안 한 상태에서 보고싶어요 눌렀을 경우
				alert('로그인 한 사용자만 가능합니다.');
				return;
			}
			if (user_num != 0) {
				$.ajax({
					url : 'contentsLike.do',
					type : 'post',
					dataType : 'json',
					data : {
						contents_num : $('#contents_num').val(),
						contents_type : $('#contents_type').val(),
						mem_num : user_num,
						check : check
					},
					success : function(param) {
						if (param.result == 'success') { // 보고싶어요
							alert('보고싶어요 성공');
							check = 1;
							$('#like')
							.removeClass(
									'css-1tc9iuk-StylelessButton-ContentActionButton')
							.addClass(
									'css-15hndx7-StylelessButton-ContentActionButton');
						} else if (param.result == 'cancel') { // 보고싶어요 취소
							alert('보고싶어요 취소');
							check = 0;
							$('#like')
							.removeClass(
									'css-15hndx7-StylelessButton-ContentActionButton')
							.addClass(
									'css-1tc9iuk-StylelessButton-ContentActionButton');
						}
					}
				});
			}
		}
	});
</script>
<div class="css-16jhzm7-Self e1ezac430">
	<div class="css-1ihluk0-Content e1ezac431">
		<div class="css-1iyk86f-Background e1ezac432">
			<section class="css-x864dh-Self e1svyhwg0">
				<div class="css-cshjoi-PosterContainer e1svyhwg1">

					<div class="css-oqg1df-BlurPosterBlock e1svyhwg2">
						<div color="#19131E" class="css-1brjyj2-LeftBackground e1svyhwg6"></div>
						<c:forEach var="images" items="${images}" begin="0" end="0">
							<div class="css-8cob0z-BlurPoster e1svyhwg4"
								style="background-image:url('https://image.tmdb.org/t/p/original${images }');">
								<div color="#19131E" class="css-vf68xy-LeftGradient e1svyhwg8"></div>
								<div color="#988970" class="css-hhk7ai-RightGradient e1svyhwg9"></div>
							</div>
						</c:forEach>
						<div color="#988970" class="css-13i7zir-RightBackground e1svyhwg7"></div>
						<div class="css-1ubeqqm-DimmedLayer e1svyhwg3"></div>
					</div>
					<div class="css-569z5v">
						<div class="css-1po9d5k">
							<div class="css-1d6udxb">
								<div class="css-11zdk8l-PosterWithRankingInfoBlock e1svyhwg10">
									<div class=" css-28gyaj-StyledLazyLoadingImage ezcopuc0">
										<img alt="포스터" src="${contents.poster_path }"
											class="css-qhzw1o-StyledImgezcopuc1"
											style="vertical-align: top; width: 100%; height: 100%; opacity: 1; object-fit: cover; transition: opacity 420ms ease 0s;">
									</div>
									<div class="css-r6qxq2-ContentMetaInfoBlock e1svyhwg11">
										<ul class="css-1v9zk7c-RankingInfoList e1svyhwg14">
											<li>들어갈<em>내용이</em></li>
											<li>없는데<em>어쩌죠</em></li>
										</ul>
										<h1 class="css-j40qn0-TitleOnPosterBlock e1svyhwg12">평균
											★${Math.ceil((contents.vote_average)/2*10)/10}</h1>
										<div class="css-11h0kfd-Detail e1svyhwg18">
											<fmt:formatDate value="${contents.release_date }"
												pattern="yyyy-MM" />
											· ${contents.genre }
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="css-1p7n6er-Pane e1svyhwg15">
					<div class="css-569z5v">
						<div class="css-1po9d5k">
							<div class="css-1d6udxb">
								<div class="css-13h49w0-PaneInner e1svyhwg16">
									<h1 class="css-171k8ad-Title e1svyhwg17">${contents.title }</h1>
									<div class="css-11h0kfd-Detail e1svyhwg18">
										<fmt:formatDate value="${contents.release_date }"
											pattern="yyyy-MM" />
										· ${contents.genre }
									</div>
									<div class="css-og1gu8-ContentRatings e1svyhwg20"
										style="white-space: nowrap;">평균
										★${Math.ceil((contents.vote_average)/2*10)/10}</div>
									<div class="css-5qj1gb-ContentActionSection e1svyhwg19">
										<div class="css-1jlb6q">
											<div class="css-yt2kjp">
												<div class="css-1k5zzs9">
													<span id="do_rating">평가하기</span>
													<!-- 평가 문구 노출영역 -->
													<span id="rating_text"></span>
												</div>
											</div>

											<!--=======별점 부분=======-->
											<%-- <div class="css-1m7ruyk"> --%>
											<div class="star_area">
												<div data-contentsid="${contents.id}" class="rateit"
													id="starRate" data-rateit-mode="font"
													style="font-size: 38px;">
													<%-- letter-spacing:-0.14em; --%>
												</div>
											</div>
											<script type="text/javascript">
												//ajax로 별점 전송

												$('.star_area .rateit')
														.bind(
																'rated reset',
																function(e) {
																	var ri = $(this);
																	//리셋버튼 누르면->value:0 
																	//how?-> e.type == 'reset'인지 체크, 맞으면 value를 null로 set.   
																	var value = ri
																			.rateit('value'); //별점값: value에 담음
																	var contentsID = ri
																			.data('contentsid'); //컨텐츠id: contentsID에 담음     

																	/*  $.ajax({
																	    url: 'starRating.do', 
																	    data: { id: productID, value: value }, //our data
																	    type: 'POST',
																	    success: function (data) {
																	        $('#response').append('<li>' + data + '</li>');

																	    },
																	    error: function (jxhr, msg, err) {
																	        $('#response').append('<li style="color:red">' + msg + '</li>');
																	    }
																	}); *///end of ajax
																});

												//별점에 따른 평가 문구 설정	    	
												$("#starRate")
														.bind(
																'rated',
																function(event,
																		value) { //rated시 이벤트 발생
																	$(
																			'#do_rating')
																			.hide(); //평가하기문구hide
																	if (value === 5) {
																		$(
																				'#rating_text')
																				.text(
																						'최고예요!');
																	}
																	if (value === 4.5) {
																		$(
																				'#rating_text')
																				.text(
																						'훌륭해요!');
																	}
																	if (value === 4) {
																		$(
																				'#rating_text')
																				.text(
																						'재미있어요');
																	}
																	if (value === 3.5) {
																		$(
																				'#rating_text')
																				.text(
																						'볼만해요');
																	}
																	if (value === 3) {
																		$(
																				'#rating_text')
																				.text(
																						'보통이에요');
																	}
																	if (value === 2.5) {
																		$(
																				'#rating_text')
																				.text(
																						'부족해요');
																	}
																	if (value === 2) {
																		$(
																				'#rating_text')
																				.text(
																						'별로예요');
																	}
																	if (value === 1.5) {
																		$(
																				'#rating_text')
																				.text(
																						'재미없어요');
																	}
																	if (value === 1) {
																		$(
																				'#rating_text')
																				.text(
																						'싫어요');
																	}
																	if (value === 0.5) {
																		$(
																				'#rating_text')
																				.text(
																						'최악이에요');
																		//0.5 hover시 리셋버튼 클릭어려워서 0.5클릭 시 리셋버튼 뜨게 설정
																		$(
																				'#rateit-reset-2')
																				.css(
																						"visibility",
																						"visible");
																	}
																});
												$("#starRate")
														.bind(
																'reset',
																function() { //reset버튼클릭시 이벤트 발생
																	$(
																			'#rating_text')
																			.text(
																					'평가하기'); //평가하기문구다시노출 
																	$(
																			'#rateit-reset-2')
																			.css(
																					"visibility",
																					"hidden"); //리셋버튼감추기
																});
											</script>
											<!--======별점 부분 끝======-->
										</div>
										<div class="css-s5x9hn-ContentActionDivider e1svyhwg21"></div>
										<div class="css-12uh5q5-ButtonBlock e1svyhwg22">
											<button id="like"
												class="<c:if test="${check ==1 }">css-15hndx7-StylelessButton-ContentActionButton</c:if>
											<c:if test="${check!=1 }">css-1tc9iuk-StylelessButton-ContentActionButton e1svyhwg23</c:if>"
												onclick="like()">
												<div
													class="Icon icPlus rotatingIcon css-1q1i623-SVG e1282e850">
													<div>
														<svg xmlns="http://www.w3.org/2000/svg" width="24"
															height="24" viewBox="0 0 24 24" fill="none"
															class="injected-svg"
															data-src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTIwLjUgMTMuMDkyOUgxMy4xNDI4VjIwLjVIMTAuODU3MVYxMy4wOTI5SDMuNVYxMC44MDcxSDEwLjg1NzFWMy41SDEzLjE0MjhWMTAuODA3MUgyMC41VjEzLjA5MjlaIiBmaWxsPSJjdXJyZW50Q29sb3IiLz4KPC9zdmc+Cg=="
															xmlns:xlink="http://www.w3.org/1999/xlink">
<path
																d="M20.5 13.0929H13.1428V20.5H10.8571V13.0929H3.5V10.8071H10.8571V3.5H13.1428V10.8071H20.5V13.0929Z"
																fill="currentColor"></path>
</svg>
													</div>
												</div>
												보고싶어요
											</button>
											<!-- ======코멘트 모달 설정부분====== -->
											<button data-bs-target="#commentModal" data-bs-toggle="modal"
												class="css-orm7r7-StylelessButton-ContentActionButton-ContentCommentButtonOnSm e1svyhwg25">
												<div class="Icon icPencil css-1q1i623-SVG e1282e850">
													<div>
														<svg xmlns="http://www.w3.org/2000/svg" width="24"
															height="24" viewBox="0 0 24 24" fill="none"
															class="injected-svg"
															data-src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTMgMTcuMjUyNVYyMS4wMDI1SDYuNzVMMTcuODEgOS45NDI1TDE0LjA2IDYuMTkyNUwzIDE3LjI1MjVaTTIwLjcxIDcuMDQyNUMyMS4xIDYuNjUyNSAyMS4xIDYuMDIyNSAyMC43MSA1LjYzMjVMMTguMzcgMy4yOTI1QzE3Ljk4IDIuOTAyNSAxNy4zNSAyLjkwMjUgMTYuOTYgMy4yOTI1TDE1LjEzIDUuMTIyNUwxOC44OCA4Ljg3MjVMMjAuNzEgNy4wNDI1WiIgZmlsbD0iY3VycmVudENvbG9yIi8+Cjwvc3ZnPgo="
															xmlns:xlink="http://www.w3.org/1999/xlink">
<path
																d="M3 17.2525V21.0025H6.75L17.81 9.9425L14.06 6.1925L3 17.2525ZM20.71 7.0425C21.1 6.6525 21.1 6.0225 20.71 5.6325L18.37 3.2925C17.98 2.9025 17.35 2.9025 16.96 3.2925L15.13 5.1225L18.88 8.8725L20.71 7.0425Z"
																fill="currentColor"></path>
</svg>
													</div>
												</div>
												코멘트
												<div class="css-4w39q2-StyledDropdownWrapper e1svyhwg28">
													<div class="css-ve4kut"></div>
												</div>
											</button>
											<button data-bs-target="#calendarModal"
												data-bs-toggle="modal"
												class="css-orm7r7-StylelessButton-ContentActionButton-ContentCommentButtonOnSm e1svyhwg25">
												<div class="Icon icPencil css-1q1i623-SVG e1282e850">
													<div>
														<img
															src="${pageContext.request.contextPath}/resources/images/cal.png"
															style="width: 21px; height: 21px; margin-right: 5px;">
													</div>
												</div>
												캘린더
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<div class="css-1bn16fq-ContentSections e1ezac433">
				<div class="css-bs9kkj">
					<div class="css-1po9d5k">
						<div class="css-uvsgck">
							<div class="css-1jnrrnc-ContentSectionsBlock e1ezac437">
								<div
									class="css-1jwavn9-RoundedCornerBlock-RoundedCornerBlock-RoundedCornerBlock-RoundedCornerBlock">
									<section class="css-1tywu13">
										<div class="css-1gkas1x-Grid e1689zdh0">
											<div class="css-1y901al-Row emmoxnt0"
												style="padding-top: 5px;">
												<header class="css-1ue9xs6">
													<h2 class="css-1wtjsst">기본 정보</h2>
													<div class="css-s289sk">
														<div class="css-1ugqy9j">
															<button
																style="color: #ff2f6e; border: none; background: none; cursor: pointer; display: none;"
																id="status" onclick="more()">더보기</button>
														</div>
													</div>
												</header>
											</div>
										</div>
										<div class="css-1gkas1x-Grid e1689zdh0">
											<div class="css-1y901al-Row emmoxnt0">
												<article class="css-1k6vajx-Overview eokm2780">
													<div class="css-wvh1uf-Summary eokm2781">
														${contents.title }<br> <span
															class="css-1t00yeb-OverviewMeta eokm2782"><fmt:formatDate
																value="${contents.release_date }" pattern="yyyy-MM" />
															· ${contents.genre }</span><br> <span
															class="css-1t00yeb-OverviewMeta eokm2782">${contents.runtime }</span>
													</div>
													<div class=" css-k82gae-StyledSelf eb5y16b0">
														<div class="css-kywn6v-StyledText" id="overview">${contents.overview }
															<c:if test="${empty contents.overview }">정보가 없습니다.</c:if>
														</div>
													</div>
												</article>
												<hr class="css-g67iqr" style="padding-top: 15px;">
											</div>
										</div>
									</section>
									<section class="css-1tywu13" id="content_credits">
										<div class="css-1gkas1x-Grid e1689zdh0">
											<div class="css-1y901al-Row emmoxnt0">
												<header class="css-1ue9xs6">
													<h2 class="css-1wtjsst">출연/제작</h2>
												</header>
											</div>
										</div>
										<div class="css-usdi1z">
											<div class="css-9dnzub scroll">
												<div class="css-174lxc3">
													<div class="css-1gkas1x-Grid e1689zdh0">
														<div class="css-13avw3k-PeopleUlRow e5xrf7a1">
															<ul
																class="e5xrf7a0 css-1br354h-VisualUl-PeopleStackableUl">
																<c:forEach var="crew" items="${crew }" begin="0" end="1"
																	step="1">
																	<li class="css-54rr1e"><a
																		class="css-1aaqvgs-InnerPartOfListWithImage" href=""><div
																				class="css-cssveg">
																				<div class="profilePhotoBlock css-13zlig9">
																					<div class="css-1wfv1im-ProfilePhotoImage">
																						<img class="css-1mt3oap-ProfilePhotoImage"
																							src="https://image.tmdb.org/t/p/original/${crew.profile_path }">
																					</div>
																				</div>
																			</div>
																			<div class="css-zoy7di">
																				<div class="css-qkf9j">
																					<div class="css-17vuhtq">${crew.name }</div>
																					<div class="css-1evnpxk-StyledSubtitle">감독</div>
																				</div>
																				<div></div>
																			</div></a></li>
																</c:forEach>
																<c:forEach var="cast" items="${cast }" begin="0"
																	end="14" step="1">
																	<li class="css-54rr1e"><a
																		class="css-1aaqvgs-InnerPartOfListWithImage" href=""><div
																				class="css-cssveg">
																				<div class="profilePhotoBlock css-13zlig9">
																					<div class="css-1wfv1im-ProfilePhotoImage">
																						<img class="css-1mt3oap-ProfilePhotoImage"
																							src="https://image.tmdb.org/t/p/original/${cast.profile_path }">
																					</div>
																				</div>
																			</div>
																			<div class="css-zoy7di">
																				<div class="css-qkf9j">
																					<div class="css-17vuhtq">${cast.name }</div>
																					<div class="css-1evnpxk-StyledSubtitle">출연</div>
																				</div>
																				<div></div>
																			</div></a></li>
																</c:forEach>
																<div class="css-6qnjre"></div>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="arrow_button css-1b9dnd0 left"
												style="display: none;">
												<button type="button" class="css-vp7uyl"
													style="margin-bottom: 15px;">
													<img
														src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIgdHJhbnNmb3JtPSJyb3RhdGUoMTgwIDYgOCkiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjMjkyQTMyIiBzdHJva2U9IiMyOTJBMzIiIHN0cm9rZS13aWR0aD0iLjM1IiBkPSJNMy40MjkgMTMuNDA5TDQuMzU0IDE0LjI1OCAxMC42OCA4LjQ2IDExLjE0MyA4LjAzNiA0LjM1NCAxLjgxMyAzLjQyOSAyLjY2MiA5LjI5MSA4LjAzNnoiIHRyYW5zZm9ybT0icm90YXRlKDE4MCA2IDgpIi8+CiAgICA8L2c+Cjwvc3ZnPgo="
														alt="forward">
												</button>
											</div>
											<div class="arrow_button css-pf83cl right">
												<button type="button" class="css-vp7uyl"
													style="margin-bottom: 15px;">
													<img
														src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIvPgogICAgICAgIDxwYXRoIGZpbGw9IiMyOTJBMzIiIHN0cm9rZT0iIzI5MkEzMiIgc3Ryb2tlLXdpZHRoPSIuMzUiIGQ9Ik0zLjQyOSAxMy40MDlMNC4zNTQgMTQuMjU4IDEwLjY4IDguNDYgMTEuMTQzIDguMDM2IDQuMzU0IDEuODEzIDMuNDI5IDIuNjYyIDkuMjkxIDguMDM2eiIvPgogICAgPC9nPgo8L3N2Zz4K"
														alt="forward">
												</button>
											</div>
										</div>
										<div class="css-1gkas1x-Grid e1689zdh0">
											<div class="css-1y901al-Row emmoxnt0">
												<hr class="css-g67iqr">
											</div>
										</div>
									</section>
									<section class="css-1tywu13">
										<div class="css-wpsvu8">
											<section class="css-e2gdle-Self e2ouywk0">
												<div class="css-1wjbj9j-Self e1adaxwi0"></div>
											</section>
											<div
												class="css-1nhig6u-RoundedCornerBlock-RoundedCornerBlock">
												<div class="css-1wdbx6y-LastDividerDisable e1ezac438">
													<div class="css-1gkas1x-Grid e1689zdh0">
														<div class="css-1y901al-Row emmoxnt0">
															<header class="css-1ue9xs6">
																<h2 class="css-1wtjsst">갤러리</h2>
																<span class="css-wzn7fp">${fn:length(images) }</span>
															</header>
														</div>
													</div>
													<div class="css-usdi1z">
														<div class="css-1x04fwb scroll">
															<div class="css-174lxc3">
																<div class="css-1gkas1x-Grid e1689zdh0">
																	<div class="css-1y901al-Row emmoxnt0">
																		<ul class="css-1cduxg0-VisualUl">
																			<c:forEach var="images" items="${images}">
																				<li class="css-1cw0vk0"><div
																						class="css-1qwe0o7-StyledSelf e1q5rx9q0">
																						<span
																							class="css-bhgne5-StyledBackground e1q5rx9q1"
																							style="background-image: url('https://image.tmdb.org/t/p/original${images }');"></span>
																					</div></li>
																			</c:forEach>
																			<div class="css-ml096x"></div>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
														<div class="arrow_button css-1b9dnd0 left"
															style="display: none;">
															<button type="button" class="css-vp7uyl"
																style="margin-bottom: 20px;">
																<img
																	src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIgdHJhbnNmb3JtPSJyb3RhdGUoMTgwIDYgOCkiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjMjkyQTMyIiBzdHJva2U9IiMyOTJBMzIiIHN0cm9rZS13aWR0aD0iLjM1IiBkPSJNMy40MjkgMTMuNDA5TDQuMzU0IDE0LjI1OCAxMC42OCA4LjQ2IDExLjE0MyA4LjAzNiA0LjM1NCAxLjgxMyAzLjQyOSAyLjY2MiA5LjI5MSA4LjAzNnoiIHRyYW5zZm9ybT0icm90YXRlKDE4MCA2IDgpIi8+CiAgICA8L2c+Cjwvc3ZnPgo="
																	alt="forward">
															</button>
														</div>
														<div class="arrow_button css-pf83cl right">
															<button type="button" class="css-vp7uyl"
																style="margin-bottom: 20px;">
																<img
																	src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIvPgogICAgICAgIDxwYXRoIGZpbGw9IiMyOTJBMzIiIHN0cm9rZT0iIzI5MkEzMiIgc3Ryb2tlLXdpZHRoPSIuMzUiIGQ9Ik0zLjQyOSAxMy40MDlMNC4zNTQgMTQuMjU4IDEwLjY4IDguNDYgMTEuMTQzIDguMDM2IDQuMzU0IDEuODEzIDMuNDI5IDIuNjYyIDkuMjkxIDguMDM2eiIvPgogICAgPC9nPgo8L3N2Zz4K"
																	alt="forward">
															</button>
														</div>
													</div>
												</div>
											</div>
											<div class="css-1s816gj-VisibleBlockOnlyMdScreen e1ezac4311"></div>
										</div>
										<div class="css-1gkas1x-Grid e1689zdh0">
											<div class="css-1y901al-Row emmoxnt0">
												<hr class="css-g67iqr">
											</div>
										</div>
									</section>
									<section class="css-1tywu13">
										<div class="css-1gkas1x-Grid e1689zdh0">
											<div class="css-1y901al-Row emmoxnt0">
												<header class="css-1ue9xs6">
													<h2 class="css-1wtjsst">코멘트</h2>
													<div class="css-s289sk">
														<div class="css-1ugqy9j">
															<button
																style="color: #ff2f6e; border: none; background: none; cursor: pointer;">더보기</button>
														</div>
													</div>
												</header>
											</div>
										</div>
										<div class="css-usdi1z">
											<div class="css-1x04fwb scroll">
												<div class="css-174lxc3">
													<div class="css-1gkas1x-Grid e1689zdh0">
														<div class="css-1y901al-Row emmoxnt0">
															<ul
																class="ew8mnl61 css-nh9j5x-VisualUl-CommentHorizontalUl">

																<li class="css-1fryc54"><div class="css-17dwc6k">
																		<div class="css-4obf01">
																			<div class="css-1cvf9dk">
																				<a title=""
																					class="css-1f9m1s4-StylelessLocalLink eovgsd01"
																					href=""><div class="css-107z6xc">
																						<div class="css-bv6e27-ProfilePhotoImage">
																							<img
																								src="${pageContext.request.contextPath}/resources/images/face.png"
																								style="object-fit: cover; width: 100%; height: 100%;">
																						</div>
																					</div>
																					<div class="css-1agoci2">
																						박수진<span src="" class="css-amcv0d"></span>
																					</div></a>
																			</div>
																			<div class="css-yqs4xl">
																				<img
																					src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM0QTRBNEEiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEyIDE3Ljk4bC02LjAxNSA0LjM5MmMtLjUwOC4zNzItMS4xOTQtLjEyNi0uOTk4LS43MjVsMi4zMTctNy4wODEtNi4wMzUtNC4zNjdjLS41MS0uMzY5LS4yNDctMS4xNzUuMzgyLTEuMTc0bDcuNDQ3LjAxNiAyLjI4Ni03LjA5MWMuMTkyLS42IDEuMDQtLjYgMS4yMzMgMGwyLjI4NiA3LjA5IDcuNDQ3LS4wMTVjLjYyOS0uMDAxLjg5LjgwNS4zOCAxLjE3NGwtNi4wMzMgNC4zNjcgMi4zMTYgNy4wOGMuMTk2LjYtLjQ5IDEuMDk4LS45OTkuNzI2TDEyIDE3Ljk4eiIvPgo8L3N2Zz4K"
																					width="16px" height="16px" alt="star"><span>4.0</span>
																			</div>
																		</div>
																		<div class="css-ob93md">
																			<a class="css-1f9m1s4-StylelessLocalLink eovgsd01"
																				href="/ko-KR/comments/7JVEod85eV29y"><div
																					class=" css-12rbc09-StyledSelf eb5y16b0">
																					<div class="css-qxbzku-StyledText">3명의
																						스파이더맨을거치면서 더이상의 특별한 스파이더맨은 없을 줄 알았다. 뉴유니버스는 내 생각이
																						틀렸다고,우린 이렇게 새롭게 태어날 수 있다고 말하는 작품같았다. 만화책을 그대로
																						스크린으로 옮겨놓은 듯한 이 작품은 굉장히 속도감있고 유쾌하며 힙하다. 스토리는 그렇게
																						특별하다고 볼 수 없을지도 모른다. 그런데 이 작품은 기존의 스파이더맨을 영리하게 비틀어서
																						얘기한다. 뻔한장면이 될뻔한 이야기를 뻔하지 않게 재밌게 표현할 줄 아는 작품이다.
																						이야기는 템포조절이 유려하고 각 캐릭터의 이해도가 높아 더 몰입할 수 있게 만들었다.</div>
																				</div></a>
																		</div>
																		<div class="css-1atijos">
																			<span
																				src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iIzc4Nzg3OCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik02Ljc1IDkuNDg1aC0zYTEgMSAwIDAgMC0xIDF2MTBhMSAxIDAgMCAwIDEgMWgzYTEgMSAwIDAgMCAxLTF2LTEwYTEgMSAwIDAgMC0xLTFNMjAuNjU3IDguNTY2YTIuMzYzIDIuMzYzIDAgMCAwLTEuNzc5LS44MTNIMTYuNjJsLjE2NC0uNjI3Yy4xMzctLjUyOC4yMDEtMS4xMi4yMDEtMS44NjMgMC0xLjkxOS0xLjM3NS0yLjc3OC0yLjczOC0yLjc3OC0uNDQ0IDAtLjc2Ni4xMjMtLjk4Ni4zNzYtLjIuMjI3LS4yODIuNTMtLjI0My45MzVsLjAzIDEuMjMtMi45MDMgMi45NGMtLjU5My42LS44OTQgMS4yMy0uODk0IDEuODcydjkuNjQ3YS41LjUgMCAwIDAgLjUuNWg3LjY4N2EyLjM4OCAyLjM4OCAwIDAgMCAyLjM0OC0yLjA3bDEuNDQ1LTcuNDUyYTIuNDQgMi40NCAwIDAgMC0uNTc0LTEuODk3Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																				width="18px" height="18px" class="css-64x8kr"></span><em>84</em>
																		</div>
																		<div class="css-hy68ty">
																			<button class="css-1h18l7j-StylelessButton">좋아요</button>
																		</div>
																	</div></li>
																<div class="css-ml096x"></div>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="arrow_button css-1b9dnd0 left"
												style="display: none;">
												<button type="button" class="css-vp7uyl"
													style="margin-bottom: 40px;">
													<img
														src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIgdHJhbnNmb3JtPSJyb3RhdGUoMTgwIDYgOCkiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjMjkyQTMyIiBzdHJva2U9IiMyOTJBMzIiIHN0cm9rZS13aWR0aD0iLjM1IiBkPSJNMy40MjkgMTMuNDA5TDQuMzU0IDE0LjI1OCAxMC42OCA4LjQ2IDExLjE0MyA4LjAzNiA0LjM1NCAxLjgxMyAzLjQyOSAyLjY2MiA5LjI5MSA4LjAzNnoiIHRyYW5zZm9ybT0icm90YXRlKDE4MCA2IDgpIi8+CiAgICA8L2c+Cjwvc3ZnPgo="
														alt="forward">
												</button>
											</div>
											<div class="arrow_button css-pf83cl right">
												<button type="button" class="css-vp7uyl"
													style="margin-bottom: 40px;">
													<img
														src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIvPgogICAgICAgIDxwYXRoIGZpbGw9IiMyOTJBMzIiIHN0cm9rZT0iIzI5MkEzMiIgc3Ryb2tlLXdpZHRoPSIuMzUiIGQ9Ik0zLjQyOSAxMy40MDlMNC4zNTQgMTQuMjU4IDEwLjY4IDguNDYgMTEuMTQzIDguMDM2IDQuMzU0IDEuODEzIDMuNDI5IDIuNjYyIDkuMjkxIDguMDM2eiIvPgogICAgPC9nPgo8L3N2Zz4K"
														alt="forward">
												</button>
											</div>
										</div>
										<div class="css-1gkas1x-Grid e1689zdh0">
											<div class="css-1y901al-Row emmoxnt0">
												<hr class="css-g67iqr">
											</div>
										</div>
									</section>

									<sectionclass="css-1tywu13">
									<div class="css-1po9d5k">
										<div class="css-uvsgck">
											<section class="css-1tywu13">
												<div class="css-1gkas1x-Grid e1689zdh0">
													<div class="css-1y901al-Row emmoxnt0">
														<header class="css-1ue9xs6">
															<h2 class="css-1wtjsst">이 작품이 담긴 컬렉션</h2>
														</header>
													</div>
												</div>
												<div class="css-usdi1z">
													<div class="css-1x04fwb">
														<div class="css-174lxc3">
															<div class="css-1gkas1x-Grid e1689zdh0">
																<div class="css-1y901al-Row emmoxnt0">
																	<ul
																		class="ejtmadi0 css-30r08r-VisualUl-DeckHorizontalUl">
																		<li class="css-lzc9tv"><a title="다양한 스파이디"
																			href="/ko-KR/decks/YavxV6oii7k1"><div
																					class="css-8vjban">
																					<div class="css-zc7t4e">
																						<div class="css-ff1m0l">
																							<div class=" css-5tj4gl-StyledSelf e1q5rx9q0">
																								<span
																									class="css-bhgne5-StyledBackground e1q5rx9q1"
																									style="background-image: url('https://image.tmdb.org/t/p/original//fmjCL1PCAqO5kr8ztOT5UXTouVw.jpg');"></span>
																							</div>
																						</div>
																						<div class="css-ff1m0l">
																							<div class=" css-5tj4gl-StyledSelf e1q5rx9q0">
																								<span
																									class="css-bhgne5-StyledBackground e1q5rx9q1"
																									style="background-image: url('https://image.tmdb.org/t/p/original//5xZac4wWUlXQmEBqIIKJ9rqXnUh.jpg');"></span>
																							</div>
																						</div>
																						<div class="css-ff1m0l">
																							<div class=" css-5tj4gl-StyledSelf e1q5rx9q0">
																								<span
																									class="css-bhgne5-StyledBackground e1q5rx9q1"
																									style="background-image: url('https://image.tmdb.org/t/p/original//dKdcyyHUR5WTMnrbPdYN5y9xPVp.jpg');"></span>
																							</div>
																						</div>
																						<div class="css-ff1m0l">
																							<div class=" css-5tj4gl-StyledSelf e1q5rx9q0">
																								<span
																									class="css-bhgne5-StyledBackground e1q5rx9q1"
																									style="background-image: url('https://image.tmdb.org/t/p/original//dA4S18rnLx4sWW8agmLLKUvRM7n.jpg');"></span>
																							</div>
																						</div>
																					</div>
																				</div>
																				<ul class="css-19qbuza-VisualUl">
																					<li class="css-iia7hw"><div
																							class=" css-sloxdm-StyledSelf eb5y16b0">
																							<div class="css-1fucs4t-StyledText eb5y16b1">다양한
																								스파이디</div>
																						</div></li>
																					<li class="css-305x3e">좋아요 2746</li>
																				</ul></a></li>
																		<div class="css-ml096x"></div>
																	</ul>
																</div>
															</div>
														</div>
													</div>
													<div class="arrow_button css-38kpup left">
														<div class="css-1hestod"></div>
													</div>
													<div class="arrow_button css-pf83cl right">
														<div class="css-vp7uyl">
															<img
																src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIvPgogICAgICAgIDxwYXRoIGZpbGw9IiMyOTJBMzIiIHN0cm9rZT0iIzI5MkEzMiIgc3Ryb2tlLXdpZHRoPSIuMzUiIGQ9Ik0zLjQyOSAxMy40MDlMNC4zNTQgMTQuMjU4IDEwLjY4IDguNDYgMTEuMTQzIDguMDM2IDQuMzU0IDEuODEzIDMuNDI5IDIuNjYyIDkuMjkxIDguMDM2eiIvPgogICAgPC9nPgo8L3N2Zz4K"
																alt="forward">
														</div>
													</div>
												</div>
												<div class="css-1gkas1x-Grid e1689zdh0">
													<div class="css-1y901al-Row emmoxnt0">
														<hr class="css-g67iqr">
													</div>
												</div>
											</section>
										</div>
									</div>
									</section>
									<section class="css-rwltgb">
										<div class="css-1gkas1x-Grid e1689zdh0">
											<div class="css-1y901al-Row emmoxnt0">
												<header class="css-1ue9xs6">
													<h2 class="css-1wtjsst">비슷한 작품</h2>
												</header>
											</div>
										</div>
										<div class="css-1gkas1x-Grid e1689zdh0">
											<div class="css-1y901al-Row emmoxnt0">
												<ul class="css-27z1qm-VisualUl-ContentGrid e14whxmg0">
													<c:forEach var="reco" items="${reco }" begin="0" end="9"
														step="1">
														<li class="css-1hp6p72"><a title="${reco.title }"
															href="${pageContext.request.contextPath}/contents/detail.do?type=${reco.type }&id=${reco.id}"><div
																	class="css-1qmeemv">
																	<div
																		class=" css-1rdb949-StyledLazyLoadingImage ezcopuc0">
																		<img src="${reco.poster_path }"
																			class="css-qhzw1o-StyledImg ezcopuc1">
																	</div>
																</div>
																<div class="css-ixy093">
																	<div class="css-niy0za">${reco.title }</div>
																	<div>
																		<div class="css-m9i0qw">평균
																			★${Math.ceil((reco.vote_average)/2*10)/10}</div>
																		<div class="css-1vvt4am">
																			<c:if test="${reco.type eq 'movie' }">영화</c:if>
																			<c:if test="${reco.type eq 'tv' }">시리즈</c:if>
																		</div>
																	</div>
																</div></a></li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</section>
								</div>
							</div>
						</div>

					</div>

					<div class="css-ppmf8q-HiddenBlockOnlyMdScreen e1ezac4310"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--코멘트 모달 틀-->
<div class="modal fade" id="commentModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-comment">
		<div class="modal-content">
			<jsp:include page="/WEB-INF/views/contents/comment.jsp" />
		</div>
	</div>
</div>
<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-comment">
		<div class="modal-content">
			<jsp:include page="/WEB-INF/views/contents/calendar.jsp" />
		</div>
	</div>
</div>
<div class="modal fade" id="collectionsModal" tabindex="-1"
	role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-comment">
		<div class="modal-content">
			<jsp:include page="/WEB-INF/views/contents/collections.jsp" />
		</div>
	</div>
</div>