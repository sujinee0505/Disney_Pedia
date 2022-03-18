<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script type="text/javascript">

</script>
</head>
<!-- 상단 시작 -->
<header class="css-6k8tqb">
	<nav>
		<div class="css-1gkas1x-Grid e1689zdh0">
			<div class="css-1djzg97">
				<ul class="css-6v7b8v-VisualUl">
					<li class="css-t686xv"><a
						href="${pageContext.request.contextPath}/main/main.do"><img
							src="${pageContext.request.contextPath}/resources/images/logo.png"
							width="150px"></a></li>
					<li class="categories css-bj71cw"><button
							onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
							class="css-x6oby2-StylelessButton">영화</button></li>
					<li class="categories css-bj71cw"><button
							onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
							class="css-q65tx9-StylelessButton">TV</button></li>
					<li class="categories css-bj71cw"><button
							onclick="location.href='${pageContext.request.contextPath}/chatboard/list.do'"
							class="css-q65tx9-StylelessButton">채팅방</button></li>
					<li class="css-1c3wwgb"><div class="css-1xm32e0">
							<div class="css-1okeg7p">
								<form action="#">
									<label class="css-kyr608"><input type="text"
										autocomplete="off" placeholder="콘텐츠를 검색해보세요."
										name="searchKeyword" value="" class="css-13i5xe6">
										<div value="false" class="css-ikj5sk">
											<span aria-label="clear" role="button" class="css-14vwb0g"></span>
										</div></label>
								</form>
							</div>
						</div></li>
					<c:if test="${empty user_num}">
					<!--onclick="location.href='${pageContext.request.contextPath}/member/login.do'"-->
					<!-- data-target="#myModal" data-toggle="modal" data-remote="${pageContext.request.contextPath}/member/login.do" -->					
					<!-- 로그인 -->
						<li class="css-bj71cw">
						<button id="login-btn" 			
						onclick="location.href='${pageContext.request.contextPath}/member/login.do'"			
						class="css-fn0ezc-StylelessButton">로그인</button></li> 
					<!-- 로그인 -->
					
						<li class="css-bj71cw"><button
								onclick="location.href='${pageContext.request.contextPath}/member/registerUser.do'"
								class="css-139vxi-StylelessButton">회원가입</button></li>
					</c:if>
					<%-- <c:if test="${mem_num != null }">
						<li class="css-bj71cw"><a href="/ko-KR/review"><span
								class="css-1kqg656">여기 뭐였죠</span></a></li>
						<li class="css-bj71cw"><a title="회원 page" href=""><div
									class="css-ipiine">
									<div class="css-1wkpkpw-ProfilePhotoImage"></div>
								</div></a></li>
					</c:if> --%>
					<c:if test="${!empty user_num}">
					[<span>${user_id}</span>]
					<li class="css-bj71cw"><button
								onclick="location.href='${pageContext.request.contextPath}/member/logout.do'"
								class="css-fn0ezc-StylelessButton" id="header_logout">로그아웃</button></li>
					 </c:if>
					<c:if test="${!empty user_num && empty user_photo}">
				    	<a href="${pageContext.request.contextPath}/member/myPage.do">
			    		<img src="${pageContext.request.contextPath}/resources/images/face.png" 
			    	                        width="25" height="25" class="my-photo"></a>
			   		 </c:if>
			   		 <c:if test="${!empty user_num && !empty user_photo}">
				    	<a href="${pageContext.request.contextPath}/member/myPage.do">
				    	<img src="${pageContext.request.contextPath}/member/photoView.do" 
				    	                        width="25" height="25" class="my-photo"></a>
				    </c:if>

				</ul>
			</div>
		</div>
	</nav>
</header>
<header class="css-1xl5dyt">
	<ul class="css-6v7b8v-VisualUl">
		<li class="css-ysxfln"><button
				onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
				class="css-q3jh7f-StylelessButton">영화</button></li>
		<li class="css-ysxfln"><button
				onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
				class="css-1ezx7y8-StylelessButton">TV</button></li>
		<li class="css-ysxfln"><button
				onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
				class="css-1ezx7y8-StylelessButton">채팅방</button></li>
	</ul>
</header>
<!-- 상단 끝 -->

