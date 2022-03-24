<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- jstl -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 중앙 컨텐츠 시작 -->
<link rel="stylesheet" type="text/css"
	href="{pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function () {
		$('#search_form').submit(function () {
			if($('#keyword').val().trim()==''){
				alert('검색어를 입력하세요');
				$('#keyword').val('').focus();
				return false;
			}
		});
	});
		$(document).on$('#carouselExampleIndicators').submit(function () {
	
</script>
<!-- 임시css -->
<style>
div.page-main {
	margin-top: 100px;
}

tr#chatboardList {
	cursor: pointer;
}
</style>

<div class="page-main">
	<h2>채팅 게시판 목록 (임시 테스트용ui)</h2>
<!-- 캐러셀 -->
<!--  
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath}/resources/images/board/1woody.jpg" class="d-block w-50" alt="toystory">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/images/board/2disney.jpg" class="d-block w-50" alt="disney">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/images/board/3starwars.jpg" class="d-block w-50" alt="starwars">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/images/board/4marvel.jpg" class="d-block w-50" alt="marvel">
    </div>
  </div>
  <button class="carousel-control-prev carousel-ctrlbtn" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next carousel-ctrlbtn" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
-->
<!-- 캐러셀 -->

<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath}/resources/images/board/1woody.jpg" class="img-responsive d-block w-100 " alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/images/board/2disney.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/images/board/3starwars.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/images/board/4marvel.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
	
</div>


	<c:if test="${!empty user_num}">
		<div class="align-right">
			<input type="button" value="글쓰기" onclick="location.href='write.do'">
		</div>
	</c:if>

<!-- 유효성체크를 자바스크립트로 사용할 것이기에 form HTML태그 사용-->
<form action="list.do" id="search_form" method="get">
	<ul class="search">
		<li><select name="keyfield" id="keyfield">
				<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>
					제목</option>
				<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>
					ID</option>
				<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>
					내용</option>
				<option value="4" <c:if test="${param.keyfield==4}">selected</c:if>>
					제목+내용</option>
		</select></li>
		<li><input type="search" name="keyword" id="keyword"
			value="${param.keyword}"></li>
		<li><input type="submit" value="검색"> <input type="button"
			value="목록" onclick="location.href='list.do'"></li>
	</ul>
</form>


<c:if test="${count==0}">
	<div class="result-display">표시할 게시물이 없습니다</div>
</c:if>

<c:if test="${count > 0}">
	<div class="table-responsive-lg">
		<table class="table  ">
			<tr class="table-primary">
				<th>번호</th>
				<th width="400">제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>메이트현황</th>
				<th>조회수</th>
			</tr>
		</table>
		<table class="table  table-hover">
			<c:forEach var="dchatboard" items="${list}">
				<tr id="chatboardList"
					onClick="location.href='detail.do?chatboard_num=${dchatboard.chatboard_num}'">
					<td>${dchatboard.chatboard_num}</td>
					<%-- <td><a href="detail.do?chatboard_num=${dchatboard.chatboard_num}">${dchatboard.title}</a></td> --%>
					<td width="400">${dchatboard.title}</td>
					<td>${dchatboard.name}</td>
					<td>${dchatboard.reg_date}</td>
							
					<c:if test="${dchatboard.mate_state==0}">
						<td><span class="badge rounded-pill bg-danger">모집 중!</span></td>
					</c:if>
					<c:if test="${dchatboard.mate_state==1}">
						<td><span class="badge rounded-pill bg-light text-dark">모집 마감</span></td>
					</c:if> 
					
					<td>${dchatboard.hit}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div class="align-center pagination">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item page-link">${pagingHtml}</li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</div>
	<!-- <div class="align-center">${pagingHtml}</div> -->



</c:if>

<!-- 중앙 컨텐츠 끝 -->


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
