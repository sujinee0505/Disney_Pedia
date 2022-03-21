<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
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

	});
</script>
<section class="css-18gwkcr">
	<section class="css-le8j8b">
		<div class="css-1jehmiq">
			<div class="css-10zg79x-pageMarginStyle">"${param.keyword }"의
				검색결과</div>
		</div>
		<div class="css-15qcwbn-StyledTabBarContainer e1szkzar1">
			<ul class="css-1gwdxtz-VisualUl-StyledTabBarUl e1szkzar2">
				<li class="css-s8lqsd-StyledTab e1szkzar0">콘텐츠</li>
				<li class="css-4tchbd-StyledTab e1szkzar0">컬렉션</li>
				<li class="css-4tchbd-StyledTab e1szkzar0">유저</li>
			</ul>
		</div>
		<div class="css-ipmqep-StyledTabContentContainer e1szkzar3">
			<div class="css-12hxjcc-StyledHideableBlock e1pww8ij0">
				<section class="css-9ebwyf-pageMarginStyle">
					<section class="css-1s4ow07">
						<div class="css-usdi1z">
							<div class="css-9dnzub scroll">
								<div class="css-174lxc3">
									<ul class="css-1bk3hui-VisualUl">
										<c:forEach var="search_result" items="${search_result }">
											<li class="css-8y23cj"><a
												title="${search_result.title }"
												href="${pageContext.request.contextPath}/contents/detail.do?type=${search_result.type }&id=${search_result.id}"><div
														class="css-1qmeemv">
														<div class=" css-1rdb949-StyledLazyLoadingImage ezcopuc0">
															<img
																src="https://image.tmdb.org/t/p/original/${search_result.poster_path }"
																class="css-qhzw1o-StyledImg ezcopuc1">
														</div>
													</div>
													<div class="css-ixy093">
														<div class="css-31iyzt">${search_result.title }</div>
														<div class="css-1thqxgo">
															<fmt:formatDate value="${search_result.release_date }"
																pattern="yyyy-MM-dd" />
														</div>
														<div class="css-jgn78h">
															<c:if test="${search_result.type eq 'movie' }">영화</c:if>
															<c:if test="${search_result.type eq 'tv' }">시리즈</c:if>
														</div>
													</div></a></li>
										</c:forEach>
										<div class="css-ml096x"></div>
									</ul>
								</div>
							</div>
							<div class="arrow_button css-1b9dnd0 left" style="display: none;">
								<button type="button" class="css-vp7uyl"
									style="margin-bottom: 60px;">
									<img
										src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIgdHJhbnNmb3JtPSJyb3RhdGUoMTgwIDYgOCkiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjMjkyQTMyIiBzdHJva2U9IiMyOTJBMzIiIHN0cm9rZS13aWR0aD0iLjM1IiBkPSJNMy40MjkgMTMuNDA5TDQuMzU0IDE0LjI1OCAxMC42OCA4LjQ2IDExLjE0MyA4LjAzNiA0LjM1NCAxLjgxMyAzLjQyOSAyLjY2MiA5LjI5MSA4LjAzNnoiIHRyYW5zZm9ybT0icm90YXRlKDE4MCA2IDgpIi8+CiAgICA8L2c+Cjwvc3ZnPgo="
										alt="forward">
								</button>
							</div>
							<div class="arrow_button css-pf83cl right">
								<button type="button" class="css-vp7uyl"
									style="margin-bottom: 60px;">
									<img
										src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIvPgogICAgICAgIDxwYXRoIGZpbGw9IiMyOTJBMzIiIHN0cm9rZT0iIzI5MkEzMiIgc3Ryb2tlLXdpZHRoPSIuMzUiIGQ9Ik0zLjQyOSAxMy40MDlMNC4zNTQgMTQuMjU4IDEwLjY4IDguNDYgMTEuMTQzIDguMDM2IDQuMzU0IDEuODEzIDMuNDI5IDIuNjYyIDkuMjkxIDguMDM2eiIvPgogICAgPC9nPgo8L3N2Zz4K"
										alt="forward">
								</button>
							</div>
						</div>
						<hr class="css-cf9e76">
					</section>
					<section class="css-11yyw1d">
						<div class="css-1gkas1x-Grid e1689zdh0">
							<div class="css-1y901al-Row emmoxnt0">
								<header class="css-1ue9xs6">
									<h2 class="css-1wtjsst">영화</h2>
									<!-- <div class="css-s289sk">
										<div class="css-1ugqy9j">
											<a
												href="/ko-KR/searches/movies?query=%EC%96%B4%EB%B2%A4%EC%A0%B8%EC%8A%A4">더보기</a>
										</div>
									</div> -->
								</header>
							</div>
						</div>
						<div class="css-usdi1z">
							<div class="css-9dnzub" id="scroll">
								<div class="css-174lxc3">
									<ul class="css-1a4f9b-VisualUl">
										<c:forEach var="search_result" items="${search_result }">
											<c:if test="${search_result.type eq 'movie' }">
												<li class="css-1iuimiv"><a
													title="${search_result.title }"
													class="css-1aaqvgs-InnerPartOfListWithImage"
													href="/ko-KR/contents/mdBzNnP"><div class="css-cssveg">
															<div class=" css-14fymwm-StyledSelf e1q5rx9q0">
																<span class="css-bhgne5-StyledBackground e1q5rx9q1"
																	style="background-image:url('https://image.tmdb.org/t/p/original/${search_result.poster_path }');"></span>
															</div>
														</div>
														<div class="css-zoy7di">
															<div class="css-qkf9j">
																<div class="css-x62r3q">${search_result.title }</div>
																<div class="css-h25two">
																	<fmt:formatDate value="${search_result.release_date }"
																		pattern="yyyy-MM-dd" />
																</div>
															</div>
															<div></div>
														</div></a></li>
											</c:if>
										</c:forEach>
										<div class="css-6qnjre"></div>
									</ul>
								</div>
								<div class="arrow_button css-1b9dnd0 left"
									style="display: none;">
									<button type="button" class="css-vp7uyl"
										style="margin-bottom: 60px;">
										<img
											src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIgdHJhbnNmb3JtPSJyb3RhdGUoMTgwIDYgOCkiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjMjkyQTMyIiBzdHJva2U9IiMyOTJBMzIiIHN0cm9rZS13aWR0aD0iLjM1IiBkPSJNMy40MjkgMTMuNDA5TDQuMzU0IDE0LjI1OCAxMC42OCA4LjQ2IDExLjE0MyA4LjAzNiA0LjM1NCAxLjgxMyAzLjQyOSAyLjY2MiA5LjI5MSA4LjAzNnoiIHRyYW5zZm9ybT0icm90YXRlKDE4MCA2IDgpIi8+CiAgICA8L2c+Cjwvc3ZnPgo="
											alt="forward">
									</button>
								</div>
								<div class="arrow_button css-pf83cl right">
									<button type="button" class="css-vp7uyl"
										style="margin-bottom: 60px;">
										<img
											src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIvPgogICAgICAgIDxwYXRoIGZpbGw9IiMyOTJBMzIiIHN0cm9rZT0iIzI5MkEzMiIgc3Ryb2tlLXdpZHRoPSIuMzUiIGQ9Ik0zLjQyOSAxMy40MDlMNC4zNTQgMTQuMjU4IDEwLjY4IDguNDYgMTEuMTQzIDguMDM2IDQuMzU0IDEuODEzIDMuNDI5IDIuNjYyIDkuMjkxIDguMDM2eiIvPgogICAgPC9nPgo8L3N2Zz4K"
											alt="forward">
									</button>
								</div>
							</div>
							<hr class="css-g67iqr">
					</section>
					<section class="css-11yyw1d">
						<div class="css-1gkas1x-Grid e1689zdh0">
							<div class="css-1y901al-Row emmoxnt0">
								<header class="css-1ue9xs6">
									<h2 class="css-1wtjsst">TV 시리즈</h2>
									<!-- <div class="css-s289sk">
										<div class="css-1ugqy9j">
											<a
												href="/ko-KR/searches/tv_seasons?query=%EC%96%B4%EB%B2%A4%EC%A0%B8%EC%8A%A4">더보기</a>
										</div>
									</div> -->
								</header>
							</div>
						</div>
						<div class="css-usdi1z">
							<div class="css-9dnzub">
								<div class="css-174lxc3">
									<ul class="css-e9dkp8-VisualUl">
										<c:forEach var="search_result" items="${search_result }">
											<c:if test="${search_result.type eq 'tv' }">
												<li class="css-1iuimiv"><a title="어벤져스 - 유나이티드 데이 스탠드"
													class="css-1aaqvgs-InnerPartOfListWithImage"
													href="/ko-KR/contents/tPDy5Al"><div class="css-cssveg">
															<div class=" css-14fymwm-StyledSelf e1q5rx9q0">
																<span class="css-bhgne5-StyledBackground e1q5rx9q1"
																	style="background-image:url('https://image.tmdb.org/t/p/original/${search_result.poster_path }');"></span>
															</div>
														</div>
														<div class="css-zoy7di">
															<div class="css-qkf9j">
																<div class="css-x62r3q">${search_result.title }</div>
																<div class="css-h25two">
																	<fmt:formatDate value="${search_result.release_date }"
																		pattern="yyyy-MM-dd" />
																</div>
															</div>
															<div></div>
														</div></a></li>
											</c:if>
										</c:forEach>
										<div class="css-6qnjre"></div>
									</ul>
								</div>
							</div>

							<div class="arrow_button css-1b9dnd0 left" style="display: none;">
								<button type="button" class="css-vp7uyl"
									style="margin-bottom: 60px;">
									<img
										src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIgdHJhbnNmb3JtPSJyb3RhdGUoMTgwIDYgOCkiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjMjkyQTMyIiBzdHJva2U9IiMyOTJBMzIiIHN0cm9rZS13aWR0aD0iLjM1IiBkPSJNMy40MjkgMTMuNDA5TDQuMzU0IDE0LjI1OCAxMC42OCA4LjQ2IDExLjE0MyA4LjAzNiA0LjM1NCAxLjgxMyAzLjQyOSAyLjY2MiA5LjI5MSA4LjAzNnoiIHRyYW5zZm9ybT0icm90YXRlKDE4MCA2IDgpIi8+CiAgICA8L2c+Cjwvc3ZnPgo="
										alt="forward">
								</button>
							</div>
							<div class="arrow_button css-pf83cl right">
								<button type="button" class="css-vp7uyl"
									style="margin-bottom: 60px;">
									<img
										src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIvPgogICAgICAgIDxwYXRoIGZpbGw9IiMyOTJBMzIiIHN0cm9rZT0iIzI5MkEzMiIgc3Ryb2tlLXdpZHRoPSIuMzUiIGQ9Ik0zLjQyOSAxMy40MDlMNC4zNTQgMTQuMjU4IDEwLjY4IDguNDYgMTEuMTQzIDguMDM2IDQuMzU0IDEuODEzIDMuNDI5IDIuNjYyIDkuMjkxIDguMDM2eiIvPgogICAgPC9nPgo8L3N2Zz4K"
										alt="forward">
								</button>
							</div>
						</div>
						<hr class="css-g67iqr">
					</section>
				</section>
			</div>
		</div>
	</section>
</section>