<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
test
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
																						<div class="css-bv6e27-ProfilePhotoImage"></div>
																					</div>
																					<div class="css-1agoci2">
																						권혜정<span src="" class="css-amcv0d"></span>
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
																					<div class="css-qxbzku-StyledText">다이애나의 표정과
																						몸짓을 통해 그녀의 숨막히는 삶을 고통스럽게 함께 겪는다. @왓챠시사회</div>
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
																		<li class="css-lzc9tv"><a title="여자에 대하여"
																			href="/ko-KR/decks/YavxV6oii7k1"><div
																					class="css-8vjban">
																					<div class="css-zc7t4e">
																						<div class="css-ff1m0l">
																							<div class=" css-5tj4gl-StyledSelf e1q5rx9q0">
																								<span
																									class="css-bhgne5-StyledBackground e1q5rx9q1"
																									style="background-image: url(&quot;https://an2-img.amz.wtchn.net/image/v2/tE_KEy9yTAT2c-Zh5Tldag.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk1UZ3dlREkxT0hFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk16STBNRFUwTURrd056QTBPRGczT1RnaWZRLmk0WVFLUDBTZDNTNURXdDhxcDdFVUh4d0hUMkxxdXhCQU4xZ01RZC1rWWM&quot;);"></span>
																							</div>
																						</div>
																						<div class="css-ff1m0l">
																							<div class=" css-5tj4gl-StyledSelf e1q5rx9q0">
																								<span
																									class="css-bhgne5-StyledBackground e1q5rx9q1"
																									style="background-image: url(&quot;https://an2-img.amz.wtchn.net/image/v2/wi0XabQg33Zt5GRSTbiocQ.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk1UZ3dlREkxT0hFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5EVXdNVGMxTkRBNU5UZ3dPVGszTVRJaWZRLm0wRWF4SUxWbmVPd0d1amdUdzVYNklvS3FHbmRTYmRmMkVjc0gwaGFZa2s&quot;);"></span>
																							</div>
																						</div>
																						<div class="css-ff1m0l">
																							<div class=" css-5tj4gl-StyledSelf e1q5rx9q0">
																								<span
																									class="css-bhgne5-StyledBackground e1q5rx9q1"
																									style="background-image: url(&quot;https://an2-img.amz.wtchn.net/image/v2/p-H4_zNexsTwJY8eTfiCcg.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk1UZ3dlREkxT0hFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5EQTFOemMyTmpNMU1UVTVORFEzTmpZaWZRLjdVVmpYQ01CMDdHMFlCQVdoemtDcW5OYUlKSHA0NGJsQVktQXlmV2VpNW8&quot;);"></span>
																							</div>
																						</div>
																						<div class="css-ff1m0l">
																							<div class=" css-5tj4gl-StyledSelf e1q5rx9q0">
																								<span
																									class="css-bhgne5-StyledBackground e1q5rx9q1"
																									style="background-image: url(&quot;https://an2-img.amz.wtchn.net/image/v2/3th5wQ8IaKSialTDxT2cPg.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk1UZ3dlREkxT0hFNE1DSmRMQ0p3SWpvaUwzWXhMM2c1WjNZMVpESmthbmd6ZVhGNWNYWnNkWGh0SW4wLmtXSGJ0UWZjaDdFdVZ5SlJjSWFBSHdsM3hKVnpOZVFpb3JtblRxcFpVNlE&quot;);"></span>
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
</body>
</html>