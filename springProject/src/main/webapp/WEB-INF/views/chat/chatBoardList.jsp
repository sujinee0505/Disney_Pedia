<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- jstl -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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

<!-- 임시 css -->
<style>
div#boardListmain {
	margin-top: 100px;
}
tr#chatboardList {
	cursor: pointer;
}
.result-display{
border:2px solid; 
border-radius: 5px;
margin-bottom:200px; margin-top:100px;
margin-left:200px;
width: 50%; height: 300px;
text-align: center;
vertical-align: middle;
/* display:table-cell; */
}
.result-display div{
text-align: center;
position:absolute;
}
div#chatBoardList1{
margin-top: 50px;
margin-bottom: 100px;
}
table#chatBoardList2{
margin-top: 0px;
}
div.carousel-item img{
margin: 0 auto;

}
</style>

<div class="page-main" id="boardListmain">
	<!-- 캐러셀 -->
	<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active ">
	      <img src="${pageContext.request.contextPath}/resources/images/board/1woody.jpg" class="img-responsive d-block h-auto ">
		     <div class="carousel-caption  w-auto h-auto" style="outline:2px dotted green;">
	       		 <h5>1같이 볼 친구들을</h5>
	      		 <p>Some representative placeholder content for the third slide.</p>
     		 </div>
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/resources/images/board/2disney.jpg" class="d-block w-auto h-auto">
	      	<div class="carousel-caption d-none d-md-block w-auto h-auto">
	       		 <h5>2 구해보세요</h5>
	      		 <p>Some representative placeholder content for the third slide.</p>
     		</div>
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/resources/images/board/3starwars.jpg" class="d-block w-auto h-auto">
	      	<div class="carousel-caption d-none d-md-block w-auto h-auto">
	       		 <h5>3 채팅으로 연락하세요</h5>
	      		 <p>Some representative placeholder content for the third slide.</p>
     		</div>
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/resources/images/board/4marvel.jpg" class="d-block w-auto h-auto">
	      	<div class="carousel-caption d-none d-md-block w-auto h-auto">
	       		 <h5>4 디즈니메이트</h5>
	      		 <p>Some representative placeholder content for the third slide.</p>
     		</div>
	    </div>
	  </div>
	  <button class="carousel-control-prev w-auto h-auto" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	<!-- 캐러셀 -->

	
	




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
			</select>
		</li>
		<li><input type="search" name="keyword" id="keyword" value="${param.keyword}"></li>
		<li><input type="submit" value="검색"> 
	</ul>
</form>
	
	<c:if test="${!empty user_num}">
		<div class="align-right">
			<input type="button" value="글쓰기" onclick="location.href='write.do'">
		</div>
	</c:if>


	<c:if test="${count==0}">
	<div class="result-display">
		<div>표시할 게시물이 없습니다</div>
	</div>
	</c:if>

	<c:if test="${count > 0}">
		<div class="table-responsive-lg" id="chatBoardList1">
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
			<table class="table  table-hover" id="chatBoardList2">
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

	
</div>

<!-- 중앙 컨텐츠 끝 -->


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
