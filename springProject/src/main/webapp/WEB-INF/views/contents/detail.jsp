<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.star-rating-svg.js"></script>
<script type="text/javascript">
	$(function() {
		var width = $('.scroll').width();
		$(document).on('click', '.right', function() {
			var scrollX = $(this).siblings('.scroll').scrollLeft();
			$(this).siblings('.scroll').scrollLeft(scrollX + width);
		});
		$(document).on('click', '.left', function() {
			var scrollX = $(this).siblings('.scroll').scrollLeft();
			$(this).siblings('.scroll').scrollLeft(scrollX - width);
		});
		$('.scroll').scroll(
				function() {
					if ($(this).scrollLeft() + $(this).innerWidth() >= $(this)
							.prop('scrollWidth')) {
						$(this).parent().find('.right').hide();
					} else {
						$(this).parent().find('.right').show();
					}
				});
		$('.scroll').scroll(function() {
			if ($(this).scrollLeft() == 0) {
				$(this).parent().find('.left').hide();
			} else if ($(this).scrollLeft() != 0) {
				$(this).parent().find('.left').show();
			}
		});

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

		more = function() {
			var status = $('#status').text();
			if (status == '더보기') {
				$('#overview').css('display', 'block');
				$('#status').text('접기');
			} else if (status == '접기') {
				$('#overview').css('display', '-webkit-box');
				$('#status').text('더보기');
			}
		}
		$(document).ready(
				function() {
					var height = $('#overview').height();
					if (height > 96) {
						$('#overview').removeClass('css-kywn6v-StyledText')
								.addClass('css-kywn7v-StyledText');
						$('#status').show();
					}
				});

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
								style="background-image:url('https://image.tmdb.org/t/p/original/${images }');">
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
												<div class="css-1k5zzs9">평가하기</div>
											</div>
											<!--=======별점 부분=======-->
											<!-- <div class="css-1m7ruyk"> -->
											<div class="star_area">
												<div class="my-rating-2"></div>
											</div>
											<script type="text/javascript">
												$(".my-rating-2").starRating({
													totalStars : 5,
													emptyColor : 'lightgray',
													hoverColor : 'gold',
													strokeWidth : 0,
													useGradient : false
												});
											</script>
											<!--======별점 부분 끝======-->
										</div>
										<div class="css-s5x9hn-ContentActionDivider e1svyhwg21"></div>
										<div class="css-12uh5q5-ButtonBlock e1svyhwg22">
											<button
												class="css-1tc9iuk-StylelessButton-ContentActionButton e1svyhwg23">
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
											<button
												class="css-3p9quy-StylelessButton-ContentActionButton-ContentCommentButtonOnXs e1svyhwg24">
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
											</button>
											<button
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
										<div class="css-1gkas1x-Grid e1689zdh0">
											<div class="css-1y901al-Row emmoxnt0">
												<header class="css-1ue9xs6">
													<h2 class="css-1wtjsst">코멘트</h2>
													<div class="css-s289sk">
														<div class="css-1ugqy9j">
															<a href="/ko-KR/contents/mOgjGVz/comments">더보기</a>
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
																				<a title="권혜정"
																					class="css-1f9m1s4-StylelessLocalLink eovgsd01"
																					href="/ko-KR/users/2mwvgYmarxMa7"><div
																						class="css-107z6xc">
																						<div class="css-bv6e27-ProfilePhotoImage"></div>
																					</div>
																					<div class="css-1agoci2">
																						권혜정<span
																							src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZD0iTTQuNzcwNDYgMC41NjI0NTlDNS4yNDMyOCAtMC4xNTY0MzIgNi4zMTE0NyAtMC4xOTMwNyA2LjgzNTM1IDAuNDkyMTU1QzcuMTczMzcgMC45MzM3ODggNy43NzM4NSAxLjEwMTEzIDguMzAxODEgMC45MDAxMjFDOS4xMTk4IDAuNTg4MjA1IDEwLjAwNjIgMS4xNjc0OCAxMC4wMTQ0IDIuMDIxMDRDMTAuMDE5NSAyLjU2OTYxIDEwLjQwNTUgMy4wNDc4OCAxMC45NTM5IDMuMTg1NTJDMTEuODA0NiAzLjM5OTQxIDEyLjE3MDIgNC4zNzQ3NiAxMS42NjA2IDUuMDY4OUMxMS4zMzE4IDUuNTE2NDggMTEuMzUzMiA2LjEyMTQ5IDExLjcxMzcgNi41NDYyOUMxMi4yNzIzIDcuMjA0NzggMTEuOTc3MiA4LjIwMTkyIDExLjE0MzggOC40NzIyNUMxMC42MDY3IDguNjQ3NTIgMTAuMjU3NCA5LjE1MDU0IDEwLjI5MTEgOS42OTkxMkMxMC4zNDQyIDEwLjU0OTcgOS41MDE3NCAxMS4xODc0IDguNjYzMzIgMTAuOTMxOUM4LjEyMjA4IDEwLjc2NzYgNy41MzQ4OCAxMC45NzQ1IDcuMjI5NTQgMTEuNDM3OUM2Ljc1NjcyIDEyLjE1NjggNS42ODc1MSAxMi4xOTI1IDUuMTY0NjUgMTEuNTA4MkM0LjgyNjYzIDExLjA2NTYgNC4yMjYxNSAxMC44OTgzIDMuNjk4MTkgMTEuMTAwM0MyLjg4MDIgMTEuNDEyMiAxLjk5Mzc4IDEwLjgzMTkgMS45ODQ1OSA5Ljk4MDM0QzEuOTgwNTEgOS40Mjk3OCAxLjU5NTUxIDguOTUyNSAxLjA0NjEgOC44MTM4N0MwLjE5NTQyOCA4LjU5OTk5IC0wLjE3MDE2NiA3LjYyNjYxIDAuMzM5NDE5IDYuOTMyNDdDMC42NjgyNDkgNi40ODM5MSAwLjY0NjgwNCA1Ljg3NzkgMC4yODYzMTYgNS40NTMxQy0wLjI3MjI4NyA0Ljc5NDYxIDAuMDIyODQzIDMuNzk5NDUgMC44NTYxNTIgMy41MjcxNUMxLjM5MzMxIDMuMzUyODcgMS43NDM1OSAyLjg1MDgzIDEuNzA4ODYgMi4zMDEyN0MxLjY1NTc2IDEuNDUwNjggMi40OTgyNiAwLjgxMTk5MiAzLjMzNjY4IDEuMDY4NDZDMy44Nzc5MiAxLjIzMjgzIDQuNDY1MTIgMS4wMjU4OCA0Ljc3MDQ2IDAuNTYyNDU5WiIgZmlsbD0iIzBFMEYxMCIvPgogIDxwYXRoIGQ9Ik03LjY5NzMzIDIuNDUwMkw3LjI4NjEyIDcuNzkzOTJMNy4xNzc3NCA3Ljc5ODI4TDYuNDUyMjYgMy45Nzk3NUg1LjI2MTIzTDQuNjY1NTggNy44OTE1N0w0LjUzNTc1IDcuODk2OEwzLjk1MDk2IDMuOTc5NzVIMi41TDMuODEwMjcgOS43MTU4Mkw1LjMxNTI4IDkuNjE0MzlMNS44NDU3NCA1Ljk3MTdINS45NjQ5OEw2LjU2MDM1IDkuNTMwMTFMOC4wNzY1MSA5LjQyNzIzTDkuMTA1MTEgMi40NTAySDcuNjk3MzNaIiBmaWxsPSIjRkYwNTU4Ii8+Cjwvc3ZnPgo="
																							class="css-amcv0d"></span>
																					</div></a>
																			</div>
																			<div class="css-yqs4xl">
																				<img
																					src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM0QTRBNEEiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEyIDE3Ljk4bC02LjAxNSA0LjM5MmMtLjUwOC4zNzItMS4xOTQtLjEyNi0uOTk4LS43MjVsMi4zMTctNy4wODEtNi4wMzUtNC4zNjdjLS41MS0uMzY5LS4yNDctMS4xNzUuMzgyLTEuMTc0bDcuNDQ3LjAxNiAyLjI4Ni03LjA5MWMuMTkyLS42IDEuMDQtLjYgMS4yMzMgMGwyLjI4NiA3LjA5IDcuNDQ3LS4wMTVjLjYyOS0uMDAxLjg5LjgwNS4zOCAxLjE3NGwtNi4wMzMgNC4zNjcgMi4zMTYgNy4wOGMuMTk2LjYtLjQ5IDEuMDk4LS45OTkuNzI2TDEyIDE3Ljk4eiIvPgo8L3N2Zz4K"
																					width="16px" height="16px" alt="star"><span>3.0</span>
																			</div>
																		</div>
																		<div class="css-ob93md">
																			<a class="css-1f9m1s4-StylelessLocalLink eovgsd01"
																				href="/ko-KR/comments/7JVEod85eV29y"><div
																					class=" css-12rbc09-StyledSelf eb5y16b0">
																					<div class="css-16v3tro-StyledText eb5y16b1">다이애나의
																						표정과 몸짓을 통해 그녀의 숨막히는 삶을 고통스럽게 함께 겪는다. @왓챠시사회</div>
																				</div></a>
																		</div>
																		<div class="css-1atijos">
																			<span
																				src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iIzc4Nzg3OCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik02Ljc1IDkuNDg1aC0zYTEgMSAwIDAgMC0xIDF2MTBhMSAxIDAgMCAwIDEgMWgzYTEgMSAwIDAgMCAxLTF2LTEwYTEgMSAwIDAgMC0xLTFNMjAuNjU3IDguNTY2YTIuMzYzIDIuMzYzIDAgMCAwLTEuNzc5LS44MTNIMTYuNjJsLjE2NC0uNjI3Yy4xMzctLjUyOC4yMDEtMS4xMi4yMDEtMS44NjMgMC0xLjkxOS0xLjM3NS0yLjc3OC0yLjczOC0yLjc3OC0uNDQ0IDAtLjc2Ni4xMjMtLjk4Ni4zNzYtLjIuMjI3LS4yODIuNTMtLjI0My45MzVsLjAzIDEuMjMtMi45MDMgMi45NGMtLjU5My42LS44OTQgMS4yMy0uODk0IDEuODcydjkuNjQ3YS41LjUgMCAwIDAgLjUuNWg3LjY4N2EyLjM4OCAyLjM4OCAwIDAgMCAyLjM0OC0yLjA3bDEuNDQ1LTcuNDUyYTIuNDQgMi40NCAwIDAgMC0uNTc0LTEuODk3Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																				width="18px" height="18px" class="css-64x8kr"></span><em>84</em><span
																				src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM3ODc4NzgiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTkuODU3IDE3Ljc4Nkw2IDIxdi00LjkxYy0xLjg0MS0xLjM3My0zLTMuMzY5LTMtNS41OUMzIDYuMzU4IDcuMDMgMyAxMiAzczkgMy4zNTggOSA3LjVjMCA0LjE0Mi00LjAzIDcuNS05IDcuNS0uNzM5IDAtMS40NTYtLjA3NC0yLjE0My0uMjE0eiIvPgo8L3N2Zz4K"
																				width="18px" height="18px" class="css-q0vi8"></span><em>0</em>
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
																		<li class="css-lzc9tv"><a title="여자에 대하여"
																			href="/ko-KR/decks/YavxV6oii7k1"><div
																					class="css-8vjban">
																					<div class="css-zc7t4e">
																						<div class="css-ff1m0l">
																							<div class=" css-5tj4gl-StyledSelf e1q5rx9q0">
																							</div>
																						</div>

																					</div>
																				</div>
																				<ul class="css-19qbuza-VisualUl">
																					<li class="css-iia7hw"><div
																							class=" css-sloxdm-StyledSelf eb5y16b0">
																							<div class="css-1fucs4t-StyledText eb5y16b1">여자에
																								대하여</div>
																						</div></li>
																					<li class="css-305x3e">좋아요<!-- --> <!-- -->2736
																					</li>
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