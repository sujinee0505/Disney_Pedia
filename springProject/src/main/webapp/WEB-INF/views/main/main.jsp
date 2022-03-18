<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 메인 시작 -->
<div class="css-lufi3b">
	<div class="css-pbseb6-StyledHomeListTitleRow">
		<p class="css-16qa0p7">평점 순</p>
	</div>

	<div class="css-1qq59e8">
		<div class="css-1kd6k5d">
			<div class="css-9dnzub">
				<div class="css-174lxc3">
					<div class="css-119xxd7">
						<ul class="css-1ya1z7z-VisualUl">

							<li class="css-8y23cj"><c:forEach var="vote_average"
									begin="0" end="10" step="1" items="${vote_average}">
									<a href="${pageContext.request.contextPath}/contents/detail.do?id=${vote_average.id}"><div
											class="css-1qmeemv">
											<div class=" css-1rdb949-StyledLazyLoadingImage ezcopuc0">
												<img src="${vote_average.poster_path }"
													class="css-qhzw1o-StyledImg ezcopuc1">
											</div>
											<div class="css-10hm9rg"></div>
										</div>
										<div class="css-ixy093">
											<div class="css-5yuqaa">${vote_average.title }</div>
											<div class="css-1rxwuxd">
												<fmt:formatDate value="${vote_average.release_date }"
													pattern="yyyy-MM-dd" />
											</div>
											<div class="average css-xgmur2">
												<span>평균</span>
												<svg width="12" height="10" viewBox="0 0 12 10"
													xmlns="http://www.w3.org/2000/svg" fill="#555765"
													class="css-1g90l0x">
												<path fill-rule="evenodd" clip-rule="evenodd"
														d="M6 8.02L3.14233 9.91131C2.91094 10.0644 2.61352 9.84836 2.68767 9.58097L3.60334 6.27872L0.921531 4.14536C0.704379 3.97262 0.817982 3.62299 1.0952 3.61087L4.51878 3.46128L5.719 0.251483C5.81619 -0.00842059 6.18381 -0.00842094 6.281 0.251483L7.48122 3.46128L10.9048 3.61087C11.182 3.62299 11.2956 3.97262 11.0785 4.14536L8.39666 6.27872L9.31233 9.58097C9.38648 9.84836 9.08906 10.0644 8.85767 9.91131L6 8.02Z"></path></svg>
												<span>
												${Math.ceil((vote_average.vote_average)/2*10)/10}
												</span>
											</div>
											<div class="css-u4moi6">인기도 : ${vote_average.popularity }</div>
										</div></a>
								</c:forEach></li>
							<div class="css-ml096x"></div>
						</ul>

					</div>
				</div>
			</div>
			<div direction="left" class="css-mx7084"></div>
			<div direction="right" class="css-18v0vc9"></div>
			<div class="arrow_button css-1553dc" direction="left">
				<div class="css-1hestod"></div>
			</div>
			<div class="arrow_button css-147ng4f" direction="right">
				<div class="css-vp7uyl">
					<img
						src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIvPgogICAgICAgIDxwYXRoIGZpbGw9IiMyOTJBMzIiIHN0cm9rZT0iIzI5MkEzMiIgc3Ryb2tlLXdpZHRoPSIuMzUiIGQ9Ik0zLjQyOSAxMy40MDlMNC4zNTQgMTQuMjU4IDEwLjY4IDguNDYgMTEuMTQzIDguMDM2IDQuMzU0IDEuODEzIDMuNDI5IDIuNjYyIDkuMjkxIDguMDM2eiIvPgogICAgPC9nPgo8L3N2Zz4K"
						alt="forward">
				</div>
			</div>
		</div>
	</div>
</div>

</div>
<div class="css-lufi3b">
	<div class="css-pbseb6-StyledHomeListTitleRow">
		<p class="css-16qa0p7">최신 공개 순</p>
	</div>
	<div class="css-1qq59e8">
		<div class="css-1kd6k5d">
			<div class="css-9dnzub">
				<div class="css-174lxc3">
					<div class="css-119xxd7">
						<ul class="css-1ya1z7z-VisualUl">

							<li class="css-8y23cj"><c:forEach var="release_date"
									begin="0" end="10" step="1" items="${release_date}">

									<input value="" hidden="" id="">

									<a href="${pageContext.request.contextPath}/contents/detail.do"><div
											class="css-1qmeemv">
											<div class=" css-1rdb949-StyledLazyLoadingImage ezcopuc0">
												<img src="${release_date.poster_path }"
													class="css-qhzw1o-StyledImg ezcopuc1">
											</div>
											<div class="css-10hm9rg"></div>
										</div>
										<div class="css-ixy093">
											<div class="css-5yuqaa">${release_date.title }</div>
											<div class="css-1rxwuxd">
												<fmt:formatDate value="${release_date.release_date }"
													pattern="yyyy-MM-dd" />
											</div>
											<div class="average css-xgmur2">
												<span>평균</span>
												<svg width="12" height="10" viewBox="0 0 12 10"
													xmlns="http://www.w3.org/2000/svg" fill="#555765"
													class="css-1g90l0x">
												<path fill-rule="evenodd" clip-rule="evenodd"
														d="M6 8.02L3.14233 9.91131C2.91094 10.0644 2.61352 9.84836 2.68767 9.58097L3.60334 6.27872L0.921531 4.14536C0.704379 3.97262 0.817982 3.62299 1.0952 3.61087L4.51878 3.46128L5.719 0.251483C5.81619 -0.00842059 6.18381 -0.00842094 6.281 0.251483L7.48122 3.46128L10.9048 3.61087C11.182 3.62299 11.2956 3.97262 11.0785 4.14536L8.39666 6.27872L9.31233 9.58097C9.38648 9.84836 9.08906 10.0644 8.85767 9.91131L6 8.02Z"></path></svg>
												<span>
												${Math.ceil((release_date.vote_average)/2*10)/10}
												</span>
											</div>
											<div class="css-u4moi6">인기도 : ${release_date.popularity }</div>
										</div></a>
								</c:forEach></li>
							<div class="css-ml096x"></div>
						</ul>

					</div>
				</div>
			</div>
			<div direction="left" class="css-mx7084"></div>
			<div direction="right" class="css-18v0vc9"></div>
			<div class="arrow_button css-1553dc" direction="left">
				<div class="css-1hestod"></div>
			</div>
			<div class="arrow_button css-147ng4f" direction="right">
				<div class="css-vp7uyl">
					<img
						src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIvPgogICAgICAgIDxwYXRoIGZpbGw9IiMyOTJBMzIiIHN0cm9rZT0iIzI5MkEzMiIgc3Ryb2tlLXdpZHRoPSIuMzUiIGQ9Ik0zLjQyOSAxMy40MDlMNC4zNTQgMTQuMjU4IDEwLjY4IDguNDYgMTEuMTQzIDguMDM2IDQuMzU0IDEuODEzIDMuNDI5IDIuNjYyIDkuMjkxIDguMDM2eiIvPgogICAgPC9nPgo8L3N2Zz4K"
						alt="forward">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 메인 끝 -->