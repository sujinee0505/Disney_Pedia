<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="css-18gwkcr">
	<div class="css-fr521c-StyledSectionContainer e1rmcw6u2">
		<div class="css-1d7xpnn-CommentContainer e1rmcw6u3">
			<section class="css-0">
				<div class="css-1p3jp2v">
					<div class="css-1cvf9dk">
						<a title="${comment.name }"
							class="css-1f9m1s4-StylelessLocalLink eovgsd01"
							href="/ko-KR/users/6ewxadRLk5Q1m"><div class="css-1byz60h">
								<div class="css-1l9hju7-ProfilePhotoImage"><img
									width="20" height="20"	class="my-photo"
										src="${pageContext.request.contextPath}/member/photoView.do?user_num=${comment.mem_num}"></div>
							</div>
							<div class="css-1sg2lsz">
								<div class="css-a7gqjg">
									${comment.name }<span
										src="${pageContext.request.contextPath}/member/photoView.do?user_num=${comment.mem_num}"
										class="css-19w3a64"></span>
								</div>
								<div class="css-1hy7aba">
									<fmt:formatDate value="${comment.reg_date }" pattern="yy/MM/dd" />
								</div>
							</div></a><a title="티탄" class="css-1f9m1s4-StylelessLocalLink eovgsd01"
							href="/ko-KR/contents/mWLyRm0"><div class="css-0">
								<div class="css-dbu6le">${contents.title}</div>
								<div class="css-1futg35">${contents.contents_type}
									·
									<fmt:formatDate value="${contents.release_date }"
										pattern="yyyy/MM" />
								</div>
							</div></a>
						<div class="css-1edcxeb">
							<div class="css-1cxhrll">
								<img
									src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM0QTRBNEEiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEyIDE3Ljk4bC02LjAxNSA0LjM5MmMtLjUwOC4zNzItMS4xOTQtLjEyNi0uOTk4LS43MjVsMi4zMTctNy4wODEtNi4wMzUtNC4zNjdjLS41MS0uMzY5LS4yNDctMS4xNzUuMzgyLTEuMTc0bDcuNDQ3LjAxNiAyLjI4Ni03LjA5MWMuMTkyLS42IDEuMDQtLjYgMS4yMzMgMGwyLjI4NiA3LjA5IDcuNDQ3LS4wMTVjLjYyOS0uMDAxLjg5LjgwNS4zOCAxLjE3NGwtNi4wMzMgNC4zNjcgMi4zMTYgNy4wOGMuMTk2LjYtLjQ5IDEuMDk4LS45OTkuNzI2TDEyIDE3Ljk4eiIvPgo8L3N2Zz4K"
									width="16px" height="16px" alt="star"><span> <c:if
										test="${comment.star > 0 }">${comment.star }</c:if> <c:if
										test="${comment.star == 0 }">평가하기</c:if>
								</span>
							</div>
						</div>
					</div>
					<a title="${contents.title}"
						class="css-1f9m1s4-StylelessLocalLink eovgsd01"
						href="/ko-KR/contents/mWLyRm0"><div
							class=" css-mnjeq6-StyledLazyLoadingImage ezcopuc0">
							<img alt="${contents.title}의 포스터" src="${contents.poster_path }"
								class="css-qhzw1o-StyledImg ezcopuc1">
						</div></a>
				</div>
				<div class="css-cb09zq">
					<div class="css-1g78l7j">
						<span>${comment.content }</span>
					</div>
				</div>
				<div class="css-hkgyal">
					<div class="css-prw2jl">
						<span class="css-1n0dvqq">좋아요 281</span><span class="css-0">댓글
							6</span>
					</div>
				</div>
				<section class="css-0">
					<hr class="css-god8tc">
					<div class="css-1gkas1x-Grid e1689zdh0">
						<div class="css-1y901al-Row emmoxnt0">
							<div class="css-cxqjs3">
								<button id="deckLike"
									class="css-135c2b4-StylelessButton-StyledActionButton e19d4hrp0">
									<div class="css-1umclh2-StyledIconContainer e19d4hrp1">
										<svg viewBox="0 0 20 20" class="css-vkoibk">
														<path class="fillTarget" fill-rule="evenodd"
												clip-rule="evenodd"
												d="M5.6252 7.9043H3.1252C2.6652 7.9043 2.29187 8.27763 2.29187 8.73763V17.071C2.29187 17.531 2.6652 17.9043 3.1252 17.9043H5.6252C6.08604 17.9043 6.45854 17.531 6.45854 17.071V8.73763C6.45854 8.27763 6.08604 7.9043 5.6252 7.9043Z"
												fill="#87898B"></path>
														<path class="fillTarget" fill-rule="evenodd"
												clip-rule="evenodd"
												d="M11.71 4.34525L11.7017 3.99359L11.6825 3.14525L11.6809 3.09692L11.6759 3.04942C11.6684 2.96942 11.6792 2.93442 11.6775 2.93275C11.6917 2.92442 11.7534 2.90442 11.8725 2.90442C12.115 2.90442 13.3225 2.97609 13.3225 4.38692C13.3225 4.93359 13.2775 5.35859 13.1809 5.72692L12.8375 7.03275C12.8034 7.16525 12.9025 7.29442 13.0392 7.29442H14.3892H15.7317C16.0575 7.29442 16.3684 7.43692 16.585 7.68442C16.7975 7.93025 16.9009 8.25609 16.87 8.58275L15.6717 14.7703L15.6634 14.8119L15.6584 14.8536C15.59 15.3961 15.0959 15.8211 14.5334 15.8211H8.54169V8.19942C8.54169 7.89109 8.71169 7.56275 9.04835 7.22359L11.3417 4.90025L11.5775 4.66109C11.71 4.52359 11.71 4.34525 11.71 4.34525ZM17.5275 6.86525C17.0734 6.34275 16.4184 6.04442 15.7317 6.04442H14.3892C14.5167 5.56025 14.5725 5.02942 14.5725 4.38692C14.5725 2.50942 13.1734 1.65442 11.8725 1.65442C11.3825 1.65442 11 1.80775 10.7367 2.11025C10.5667 2.30359 10.3792 2.64442 10.4325 3.17359L10.4517 4.02192L8.15835 6.34525C7.58335 6.92692 7.29169 7.55109 7.29169 8.19942V16.2378C7.29169 16.6978 7.66502 17.0711 8.12502 17.0711H14.5334C15.7342 17.0711 16.7559 16.1603 16.8992 15.0078L18.1067 8.77192C18.1925 8.08109 17.9809 7.38692 17.5275 6.86525Z"
												fill="#87898B"></path></svg>
									</div>
									좋아요
								</button>
								<button
									class="css-135c2b4-StylelessButton-StyledActionButton e19d4hrp0">
									<div class="css-1umclh2-StyledIconContainer e19d4hrp1">
										<svg viewBox="0 0 20 20" class="css-vkoibk">
														<path class="fillTarget" fill-rule="evenodd"
												clip-rule="evenodd"
												d="M9.99963 2.08325C5.65046 2.08325 2.12546 5.02159 2.12546 8.64575C2.12546 10.5891 3.13962 12.3358 4.74962 13.5374L4.61129 17.2416C4.61129 17.4899 4.81462 17.6591 5.03046 17.6591C5.12129 17.6591 5.21462 17.6291 5.29462 17.5616L8.12462 15.0208C8.72629 15.1433 9.35379 15.2083 9.99963 15.2083C14.3496 15.2083 17.8746 12.2699 17.8746 8.64575C17.8746 5.02159 14.3496 2.08325 9.99963 2.08325ZM9.99962 3.33325C13.653 3.33325 16.6246 5.71659 16.6246 8.64575C16.6246 11.5749 13.653 13.9583 9.99962 13.9583C9.44962 13.9583 8.90296 13.9041 8.37379 13.7966C8.29129 13.7791 8.20796 13.7708 8.12462 13.7708C7.81962 13.7708 7.52046 13.8833 7.28962 14.0908L5.93462 15.3074L5.99879 13.5841C6.01462 13.1733 5.82712 12.7808 5.49796 12.5349C4.14879 11.5291 3.37546 10.1116 3.37546 8.64575C3.37546 5.71659 6.34712 3.33325 9.99962 3.33325Z"
												fill="#87898B"></path></svg>
									</div>
									댓글
								</button>
							</div>
						</div>
					</div>
					<hr class="css-god8tc">
				</section>
			</section>
			<section class="css-1r5nwql">
				<div class="css-0">
					<div class="css-1m1whp6">
						<div class="css-ov1ktg">
							<a class="css-255jr8" href="/ko-KR/users/RE952Nd0M5Q72"><div
									class="css-ksm2an"></div></a>
							<div class="css-199ku80">
								<div class="css-1sg2lsz">
									<a class="css-255jr8" href="/ko-KR/users/RE952Nd0M5Q72"><div
											class="css-72k174">김창식</div> </a>
									<div class="css-maxfbg">3개월 전</div>
								</div>
								<div class="css-yb0jaq">나도
									이렇게생각했는뎈ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</div>
								<div class="css-ov1ktg">
									<div class="css-1d8juai">
										<div class="Icon like css-1tuvmpc-SVG e1282e850">
											<div>
												<svg xmlns="http://www.w3.org/2000/svg" width="14"
													height="14" viewBox="0 0 14 14" fill="none"
													class="injected-svg"
													data-src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0zLjkzNzgzIDUuNTMzMkgyLjE4NzgzQzEuODY1ODMgNS41MzMyIDEuNjA0NDkgNS43OTQ1NCAxLjYwNDQ5IDYuMTE2NTRWMTEuOTQ5OUMxLjYwNDQ5IDEyLjI3MTkgMS44NjU4MyAxMi41MzMyIDIuMTg3ODMgMTIuNTMzMkgzLjkzNzgzQzQuMjYwNDEgMTIuNTMzMiA0LjUyMTE2IDEyLjI3MTkgNC41MjExNiAxMS45NDk5VjYuMTE2NTRDNC41MjExNiA1Ljc5NDU0IDQuMjYwNDEgNS41MzMyIDMuOTM3ODMgNS41MzMyWiIgZmlsbD0iIzg3ODk4QiIvPgo8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZD0iTTguMTk3MzMgMy4wNDE3OUw4LjE5MTQ5IDIuNzk1NjJMOC4xNzgwOCAyLjIwMTc5TDguMTc2OTEgMi4xNjc5NUw4LjE3MzQxIDIuMTM0N0M4LjE2ODE2IDIuMDc4NyA4LjE3NTc0IDIuMDU0MiA4LjE3NDU4IDIuMDUzMDRDOC4xODQ0OSAyLjA0NzIgOC4yMjc2NiAyLjAzMzIgOC4zMTEwOCAyLjAzMzJDOC40ODA4MyAyLjAzMzIgOS4zMjYwOCAyLjA4MzM3IDkuMzI2MDggMy4wNzA5NUM5LjMyNjA4IDMuNDUzNjIgOS4yOTQ1OCAzLjc1MTEyIDkuMjI2OTEgNC4wMDg5NUw4Ljk4NjU4IDQuOTIzMDRDOC45NjI2NiA1LjAxNTc5IDkuMDMyMDggNS4xMDYyIDkuMTI3NzQgNS4xMDYySDEwLjA3MjdIMTEuMDEyNUMxMS4yNDA2IDUuMTA2MiAxMS40NTgyIDUuMjA1OTUgMTEuNjA5OCA1LjM3OTJDMTEuNzU4NiA1LjU1MTI5IDExLjgzMDkgNS43NzkzNyAxMS44MDkzIDYuMDA4MDRMMTAuOTcwNSAxMC4zMzkzTDEwLjk2NDcgMTAuMzY4NUwxMC45NjEyIDEwLjM5NzZDMTAuOTEzMyAxMC43Nzc0IDEwLjU2NzQgMTEuMDc0OSAxMC4xNzM3IDExLjA3NDlINS45Nzk0OVY1LjczOTdDNS45Nzk0OSA1LjUyMzg3IDYuMDk4NDkgNS4yOTQwNCA2LjMzNDE2IDUuMDU2NjJMNy45Mzk0OSAzLjQzMDI5TDguMTA0NTggMy4yNjI4N0M4LjE5NzMzIDMuMTY2NjIgOC4xOTczMyAzLjA0MTc5IDguMTk3MzMgMy4wNDE3OVpNMTIuMjY5NiA0LjgwNTc5QzExLjk1MTcgNC40NDAwNCAxMS40OTMyIDQuMjMxMiAxMS4wMTI1IDQuMjMxMkgxMC4wNzI3QzEwLjE2MiAzLjg5MjI5IDEwLjIwMTEgMy41MjA3IDEwLjIwMTEgMy4wNzA5NUMxMC4yMDExIDEuNzU2NyA5LjIyMTY2IDEuMTU4MiA4LjMxMTA4IDEuMTU4MkM3Ljk2ODA4IDEuMTU4MiA3LjcwMDMzIDEuMjY1NTQgNy41MTU5OSAxLjQ3NzI5QzcuMzk2OTkgMS42MTI2MiA3LjI2NTc0IDEuODUxMiA3LjMwMzA4IDIuMjIxNjJMNy4zMTY0OSAyLjgxNTQ1TDUuNzExMTYgNC40NDE3OUM1LjMwODY2IDQuODQ4OTUgNS4xMDQ0OSA1LjI4NTg3IDUuMTA0NDkgNS43Mzk3VjExLjM2NjVDNS4xMDQ0OSAxMS42ODg1IDUuMzY1ODMgMTEuOTQ5OSA1LjY4NzgzIDExLjk0OTlIMTAuMTczN0MxMS4wMTQyIDExLjk0OTkgMTEuNzI5NCAxMS4zMTIzIDExLjgyOTcgMTAuNTA1NUwxMi42NzUgNi4xNDA0NUMxMi43MzUxIDUuNjU2ODcgMTIuNTg2OSA1LjE3MDk1IDEyLjI2OTYgNC44MDU3OVoiIGZpbGw9IiM4Nzg5OEIiLz4KPC9zdmc+Cg=="
													xmlns:xlink="http://www.w3.org/1999/xlink">
<path fill-rule="evenodd" clip-rule="evenodd"
														d="M3.93783 5.5332H2.18783C1.86583 5.5332 1.60449 5.79454 1.60449 6.11654V11.9499C1.60449 12.2719 1.86583 12.5332 2.18783 12.5332H3.93783C4.26041 12.5332 4.52116 12.2719 4.52116 11.9499V6.11654C4.52116 5.79454 4.26041 5.5332 3.93783 5.5332Z"
														fill="#87898B"></path>
<path fill-rule="evenodd" clip-rule="evenodd"
														d="M8.19733 3.04179L8.19149 2.79562L8.17808 2.20179L8.17691 2.16795L8.17341 2.1347C8.16816 2.0787 8.17574 2.0542 8.17458 2.05304C8.18449 2.0472 8.22766 2.0332 8.31108 2.0332C8.48083 2.0332 9.32608 2.08337 9.32608 3.07095C9.32608 3.45362 9.29458 3.75112 9.22691 4.00895L8.98658 4.92304C8.96266 5.01579 9.03208 5.1062 9.12774 5.1062H10.0727H11.0125C11.2406 5.1062 11.4582 5.20595 11.6098 5.3792C11.7586 5.55129 11.8309 5.77937 11.8093 6.00804L10.9705 10.3393L10.9647 10.3685L10.9612 10.3976C10.9133 10.7774 10.5674 11.0749 10.1737 11.0749H5.97949V5.7397C5.97949 5.52387 6.09849 5.29404 6.33416 5.05662L7.93949 3.43029L8.10458 3.26287C8.19733 3.16662 8.19733 3.04179 8.19733 3.04179ZM12.2696 4.80579C11.9517 4.44004 11.4932 4.2312 11.0125 4.2312H10.0727C10.162 3.89229 10.2011 3.5207 10.2011 3.07095C10.2011 1.7567 9.22166 1.1582 8.31108 1.1582C7.96808 1.1582 7.70033 1.26554 7.51599 1.47729C7.39699 1.61262 7.26574 1.8512 7.30308 2.22162L7.31649 2.81545L5.71116 4.44179C5.30866 4.84895 5.10449 5.28587 5.10449 5.7397V11.3665C5.10449 11.6885 5.36583 11.9499 5.68783 11.9499H10.1737C11.0142 11.9499 11.7294 11.3123 11.8297 10.5055L12.675 6.14045C12.7351 5.65687 12.5869 5.17095 12.2696 4.80579Z"
														fill="#87898B"></path>
</svg>
											</div>
										</div>
										4
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</section>
