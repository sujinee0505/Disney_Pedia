<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><!-- 조건체크 -->
						<!-- 이미지일경우 보여지게 하고 이미지아닐경우 다운로드하도록 functions이용할 것. -->
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/chatboard.reply.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/videoAdapter.js"></script>

<style>
/* 상 우 하 좌/상 좌우 하/상하 좌우 */
div#boardView{
margin:200px auto;
width:80%;
outline:1px dotted red;
}
div#boardView h2{
outline:1px dotted red;
margin:10px auto;
padding-left:10px;
text-align: left;
}
div#boardView_middle{
inline-block;
}
div#photo_1 img{
outline:2px dotted green;
/* float: left; width: 300px; */ 
width: 50px; 

}
#name_2{
outline:2px dotted yellow;
/* width: 10%; */

}
div#boardView_middle div#date_3{
outline:2px dotted blue;
/* width: 10%; */

}
div#boardView_content{
outline:2px dotted green;
height: 200px;
}
div#boardView_hit{
outline:2px dotted yellow;
text-align: right;
}

img#eye_img{
width: 30px; 
opacity: 70%;

}

</style>

<div class="page-main " id="boardView">

	 <h2>
		<c:if test="${chatboard.mate_state==0}">
			<span class="badge rounded-pill bg-danger">모집 중!</span>
		</c:if>
		<c:if test="${chatboard.mate_state==1}">
			<span class="badge rounded-pill bg-light text-dark">모집 마감</span>
		</c:if>
		&nbsp;
		${chatboard.title}
	</h2> 
	<div id="boardView_middle" class="col-12">
		<div id="photo_1" class="col-4">
			<c:if test="${chatboard.photo==null}">
				<img src="${pageContext.request.contextPath}/resources/images/face.png">
			</c:if>
			<c:if test="${chatboard.photo!=null}">
				<%-- <img src="${pageContext.request.contextPath}/resources/images/face.png"> --%>
				<!-- db에 프로필 사진 안올라가는 이슈 대기중 -->
			</c:if>
		</div>
		<div id="name_2" class="col-4">
		 ${chatboard.name}
		</div>
		<div id="date_3" class="col-4">
		작성일 : ${chatboard.reg_date}
		</div>
	</div>
	
	<hr size="2" width="100%" >
	
	<div id="boardView_content">
		${chatboard.content}
	</div>
	<div id="boardView_hit">
		<img id="eye_img" src="${pageContext.request.contextPath}/resources/images/board/eye.png">
		${chatboard.hit}
	</div>
	
	
	<div id="boardView_button">
		<input type="button" value="목록" onclick="location.href='list.do'">
		
		<c:if test="${!empty user_num && user_num == chatboard.mem_num}">
			<input type="button" value="수정" onclick="location.href='update.do?chatboard_num=${chatboard.chatboard_num}'">
			<input type="button" value="삭제" id="delete_btn">
				<script type="text/javascript">
					let delete_btn = document.getElementById('delete_btn');
					delete_btn.onclick=function(){
						let choice = confirm('삭제하시겠습니까?');
						if(choice){
							location.replace('delete.do?chatboard_num=${chatboard.chatboard_num}');
						}
					};
				</script>
		</c:if>
	</div>

<%-- 
	<c:if test="${fn:endsWith(chatboard.photoname,'.jpg') || fn:endsWith(chatboard.photoname,'.JPG') ||
				  fn:endsWith(chatboard.photoname,'.gif') || fn:endsWith(chatboard.photoname,'.GIF') ||
				  fn:endsWith(chatboard.photoname,'.png') || fn:endsWith(chatboard.photoname,'.PNG')}">
		<div class="align-center">
			하하
			<img src="imageView.do?chatboard_num=${chatboard.chatboard_num}"
					style="max-width: 500px;">
		</div>
	</c:if>
	 
	<ul>
		<li>번호 : ${chatboard.chatboard_num}</li>
		<li>작성자 : ${chatboard.name}</li>
		<li>조회수 : ${chatboard.hit}</li>
	</ul>
</table>  
		<!-- <c:if test="${!empty chatboard.modify_date}">
		<li>최근 수정일 : ${chatboard.modify_date}</li>
		</c:if> -->
		<li>작성일 : ${chatboard.reg_date}</li>
		<li>메이트 : ${chatboard.mate_state}</li>
	<p>
		${chatboard.content}
	</p>
	<hr size="1" width="100%" noshade="noshade">
	<div class="align-right">
		<c:if test="${!empty user_num && user_num == chatboard.mem_num}">
		<input type="button" value="수정"  
		onclick="location.href='update.do?chatboard_num=${chatboard.chatboard_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('delete.do?chatboard_num=${chatboard.chatboard_num}');
				}
			};
		</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='list.do'">
	</div>
	<hr size="1" width="100%" noshade="noshade">
	--%>
	
	
	<!-- 
	<div id="reply_div">
		<span class="re-title">댓글 달기</span>
		<form id="re_form">
			<input type="hidden" name="chatboard_num" 
			                 value="${chatboard.chatboard_num}" id="chatboard_num">
			<textarea rows="3" cols="50" name="re_content"
			         id="re_content" class="rep-content"
			         <c:if test="${empty user_num}">disabled="disabled"</c:if>
			         ><c:if test="${empty user_num}">로그인해야 작성할 수 있습니다.</c:if></textarea>                 
			<c:if test="${!empty user_num}">
			<div id="re_first">
				<span class="letter-count">300/300</span>
			</div>
			<div id="re_second" class="align-right">
				<input type="submit" value="전송">
			</div>
			</c:if>
		</form>
	</div>
	-->
	<!-- 댓글 목록 출력 -->
	<%-- <div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="다음글 보기">
	</div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif">
	</div> --%>
</div>
<!-- 중앙 컨텐츠 끝 -->