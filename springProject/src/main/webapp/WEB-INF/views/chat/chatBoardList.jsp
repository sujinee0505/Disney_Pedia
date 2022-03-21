<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- jstl -->
    
<!-- 중앙 컨텐츠 시작 -->
  
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
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
</script>


<div class="page-main">
	<h2>채팅 게시판 목록 (임시 테스트용ui)</h2>
	
	<div class="align-right">
		<input type="button" value="글쓰기" onclick="location.href='write.do'"> 
	</div>
	
</div>
<div>

	<!-- 유효성체크를 자바스크립트로 사용할 것이기에 form HTML태그 사용-->
	<form action="list.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>
						제목
					</option>
					<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>
						ID
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
				<input type="button" value="목록" onclick="location.href='list.do'">
			</li>
		</ul>
	</form>
	
	<c:if test="${!empty user_num}">
		<div class="align-right">
			<input type="button" value="글쓰기" onclick="location.href='write.do'"> 
		</div>
	</c:if>
	
	<c:if test="${count==0}">
		<div class="result-display">표시할 게시물이 없습니다</div>
	</c:if>
	
	<c:if test="${count > 0}">
		<table>
			<tr>
				<th>번호</th>
				<th width="400">제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="chatboard" items="${mav}">
				<tr>
					<td>${chatboard.board_num}</td>
					<td><a href="detail.do?board_num=${chatBoard.chatBoard_num}">${chatBoard.title}</a></td>
					<td>${chatboard.name}</td>
					<td>${chatboard.reg_date}</td>
					<td>${chatboard.hit}</td>
				</tr>
			</c:forEach>
			
		</table>	
		<div class="align-center">${pagingHtml}</div>
	</c:if>
</div>



<!-- 중앙 컨텐츠 끝 -->