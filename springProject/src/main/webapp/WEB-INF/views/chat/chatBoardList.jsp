<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- jstl -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" 	href="${pageContext.request.contextPath}/resources/css/mj.css"/>


<!-- 중앙 컨텐츠 시작 -->
<script type="text/javascript">
	/*  
	$(function () {
		$('#list_search_btn').submit(function () {
			if($('#keyword').val().trim()==''){
				Swal.fire({
				      icon: 'warning',
				      title: '검색어를 입력하세요!',
				      text: '찾을 수가 없네요',
				      showConfirmButton: false,
				    });
				  };
				$('#keyword').val('').focus();
				return false;
			}); 
		});
	*/
	/*
	$(function () {
		$('#list_search_form').submit(function () {
			if($('#keyword').val().trim()==''){
				alert('검색어를 입력하세요');
				$('#keyword').val('').focus();
				return false;
			}
		});
	});
	*/
</script>

<div class="page-main" id="chatBoardList_main">
	
	<!-- 캐러셀 -->
	<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active carousel-fade" data-bs-interval="2000">
	      <img src="${pageContext.request.contextPath}/resources/images/board/1woody_br.jpg" class="img-responsive d-block img-rounded" id="woody">
		     <div class="carousel-caption ">
	       		 <h2><b>디즈니 메이트</b></h2>
	      		 <p>혼자 디즈니플러스를 이용하기 부담스럽다면?!</p>
     		 </div>
	    </div>
	    <div class="carousel-item carousel-fade" data-bs-interval="2500" >
	      <img src="${pageContext.request.contextPath}/resources/images/board/2disney_br.jpg" class="d-block img-rounded" id="disney">
	      	<div class="carousel-caption d-none d-md-block ">
	       		 <h2><b>구해보세요</b></h2>
	      		 <p>게시글을 등록해 보세요. 메이트를 구하실 수 있습니다!</p>
     		</div>
	    </div>
	    <div class="carousel-item carousel-fade" data-bs-interval="2500" >
	      <img src="${pageContext.request.contextPath}/resources/images/board/3starwars_br.jpg" class="d-block img-rounded" id="starwars">
	      	<div class="carousel-caption d-none d-md-block ">
	       		 <h2><b>채팅 기능으로 연락해 보세요</b></h2>
	      		 <p>누군가가 당신과 메이트 하기를 기다리고 있어요!</p>
     		</div>
	    </div>
	    <div class="carousel-item carousel-fade" data-bs-interval="2500">
	      <img src="${pageContext.request.contextPath}/resources/images/board/4marvel_br.jpg" class="d-block img-rounded" id="marvel">
	      	<div class="carousel-caption d-none d-md-block ">
	       		 <h2><b>내가 만들어가는 디즈니 피디아!</b></h2>
	      		 <p>평점을 등록하고 리뷰도 작성하세요! 캘린더에 나만의 시청내역을 기록할 수 도 있어요.</p>
     		</div>
	    </div>
	  </div>
	<!--   <button class="carousel-control-prev w-auto h-auto" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button> -->
	</div>
	<!-- 캐러셀 -->

	

<!-- 유효성체크를 자바스크립트로 사용할 것이기에 form HTML태그 사용-->
<div id="container_table">
	<!--  
<div class="container row">
	<form action="list.do" id="list_search_form" method="get">
		<ul class="search row">
			<li class=>
				<select name="keyfield" id="keyfield" class="form-select" >
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>
						제목
					</option>
					<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>
						닉네임
					</option>
					<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>
						내용
					</option>
					<option value="4" <c:if test="${param.keyfield==4}">selected</c:if>>
						제목+내용
					</option>
				</select>
			</li>
		-->		
	<form action="list.do" id="list_search_form" method="get">
		<ul class="search" id="list_search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>
						제목
					</option>
					<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>
						닉네임
					</option>
					<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>
						내용
					</option>
					<option value="4" <c:if test="${param.keyfield==4}">selected</c:if>>
						제목+내용
					</option>
				</select>
			</li>
			
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="검색">
			</li>
			<li>
				<input type="button"
					value="목록" onclick="location.href='list.do'">
			</li>
			<!--  
			<li>
				<c:if test="${!empty user_num}">
				<button class="btn  btn-primary"  
							id="write_btn" 
							onclick="location.href='write.do'">게시글 작성</button>
				</c:if>
			</li>
			-->
		</ul>
	</form>
	<br><hr style="size:2px; width:90%; align:center;"/><br>
	
			<c:if test="${!empty user_num}">
				<div class="row" id="row_write">
				<!-- <li class="col-md-4 "> -->
					<button class="col-sm-1 offset-sm-1 btn  btn-primary"  
							id="write_btn" 
							onclick="location.href='write.do'">게시글 작성</button>
				<!-- </li> -->
				</div>
			</c:if>

</div>

<c:if test="${count==0}">
	<div class="result-display">
		<div>표시할 게시물이 없습니다</div>
	</div>
</c:if>

	<c:if test="${count > 0}">
		<div class="row" id="table_header">
		<div class="table-responsive-md col-sm-9 mx-auto" id="chatBoardList1">
			<table class="table" id="table_header" style="table-layout: fixed">
				<tr class="table-primary">
					<th style="width: 15%">번호</th>
					<th style="width: 35%">제목</th>
					<th style="width: 10%">작성자</th>
					<th style="width: 15%">등록일</th>
					<th style="width: 15%">메이트현황</th>
					<th style="width: 10%">조회수</th>
				</tr>
			</table>
			
			
			<table class="table  table-hover" id="table_body" style="table-layout: fixed">
				<c:forEach var="dchatboard" items="${list}">
					<tr id="chatboardList"
						onClick="location.href='detail.do?chatboard_num=${dchatboard.chatboard_num}'">
						<td style="width: 15%">
							${dchatboard.chatboard_num}
						</td>
						<td style="width: 35%">
							${dchatboard.title}
						</td>
						<td style="width: 10%">
							${dchatboard.name}
						</td>
						<td style="width: 15%">
							${dchatboard.reg_date}
						</td>
								
						<c:if test="${dchatboard.mate_state==0}">
							<td style="width: 15%">
								<span class="badge rounded-pill bg-danger">모집 중!</span>
							</td>
						</c:if>
						<c:if test="${dchatboard.mate_state==1}">
							<td style="width: 15%">
								<span class="badge rounded-pill bg-light text-dark">모집 마감</span>
							</td>
						</c:if> 
						
						<td style="width: 10%">
							${dchatboard.hit}
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</div>
	
		<div class="align-center pagination row">
			<ul class="pagination pagination-sm" style="justify-content: center;">
				<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
				<li class="page-item page-link">${pagingHtml}</li>
				<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
			</ul>
		</div>
		<!-- <div class="align-center">${pagingHtml}</div> -->
	
	</c:if>

	
</div>

<!-- 중앙 컨텐츠 끝 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
