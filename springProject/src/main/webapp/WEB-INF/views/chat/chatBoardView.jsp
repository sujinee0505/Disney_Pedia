<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><!-- 조건체크 -->
<!-- 이미지일경우 보여지게 하고 이미지아닐경우 다운로드하도록 functions이용할 것. -->
<!-- 중앙 컨텐츠 시작 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/mj.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>
</style>

<div class="page-main border border-primary border-2 rounded"
	id="boardView">
	<div>
		<h2>
			<c:if test="${chatboard.mate_state==0}">
				<span class="badge rounded-pill bg-danger">모집 중!</span>
			</c:if>
			<c:if test="${chatboard.mate_state==1}">
				<span class="badge rounded-pill bg-light text-dark">모집 마감</span>
			</c:if>
			&nbsp; <b>${chatboard.title}</b>
		</h2>
	</div>
	<br>
	<div id="boardView_middle" class=" row ">
		<div id="boardView_img" class=" col-md-2 ">
			<c:choose>
				<c:when test="${empty usr_num}">
					<c:if test="${empty chatboard.photo_name}">
						<img
							src="${pageContext.request.contextPath}/resources/images/face.png">
					</c:if>
					<c:if test="${!empty chatboard.photo_name}">
						<img
							src="${pageContext.request.contextPath}/member/photoView.do?user_num=${chatboard.mem_num}">
					</c:if>
				</c:when>
				<c:when test="${!empty usr_num}">
					<c:if test="${ empty user_photo}">
						<img
							src="${pageContext.request.contextPath}/resources/images/face.png">
					</c:if>
					<c:if test="${!empty user_photo}">
						<img
							src="${pageContext.request.contextPath}/member/photoView.do?user_num=${chatboard.mem_num}">
					</c:if>
				</c:when>
			</c:choose>
		</div>
		<div id="boardView_name" class="col-8  align-self-end ">
			<b>${chatboard.name}</b>
		</div>
		<div id="boardView_date" class="col-2 offset-1  align-self-end ">
			작성일 | ${chatboard.reg_date}</div>
	</div>

	<br>
	<hr width="100%">
	<br>

	<div id="boardView_content" class="overflow-auto">
		${chatboard.content}</div>

	<div id="boardView_hit" class="offset-11">
		<img id="eye_img"
			src="${pageContext.request.contextPath}/resources/images/board/eye.png">
		${chatboard.hit}
	</div>

	<hr width="100%">

	<div id="boardView_button" class="row">
		<!-- 글 작성자와 로그인 되어있는 유저 같은 경우 -->
		<c:if test="${!empty user_num && user_num == chatboard.mem_num}">
			<button class="btn btn-primary " id="chat_btn"
				onclick="location.href='chattingList.do?chatboard_num=${chatboard.chatboard_num}'">채팅
				목록</button>
		</c:if>
		<!-- 글 작성자와 로그인 되어있는 유저가 다른 경우 / 모집현황에 따른 경우 -->
		<!-- 게시글 작성자의 회원 번호도 함께 전송 -->
		<!-- mate_state : 0 모집중/1 모집완료 -->
		<c:choose>
			<c:when
				test="${!empty user_num && user_num != chatboard.mem_num && chatboard.mate_state == 0}">
				<button class="btn btn-primary " id="chat_btn"
					onclick="location.href='chatting.do?chatboard_num=${chatboard.chatboard_num}&trans_num=${chatboard.mem_num}'">채팅하기</button>
			</c:when>
			<c:when
				test="${!empty user_num && user_num != chatboard.mem_num && chatboard.mate_state == 1}">
				<button class="btn btn-primary " id="chat_btn"
					onclick="location.href='chatting.do?chatboard_num=${chatboard.chatboard_num}&trans_num=${chatboard.mem_num}'"
					disabled="disabled">채팅하기</button>
			</c:when>
		</c:choose>

		<div id="mybtn">
			<c:if test="${!empty user_num && user_num == chatboard.mem_num}">
				<button class="btn btn-secondary" id="modify_btn"
					onclick="location.href='update.do?chatboard_num=${chatboard.chatboard_num}'">수정</button>
				<button class="btn btn-secondary" id="delete_btn">삭제</button>
			</c:if>
		</div>
		<div id="publicbtn">
			<button class="btn btn-secondary " id="list_btn"
				onclick="location.href='list.do'">글 목록</button>
		</div>


		<script type="text/javascript">
				let delete_btn = document.getElementById('delete_btn');//delete_btn에접근
				 
				delete_btn.onclick=function(){
					//let choice = confirm('삭제하시겠습니까?');
					//if(choice){ //choice가true면
					//	location.replace('delete.do?chatboard_num=${chatboard.chatboard_num}');
					//여기서부터 테스트
					Swal.fire({
						title: '정말로 삭제 하시겠습니까?',
						text: '다시 되돌릴 수 없습니다. 신중하세요.',
						icon: 'warning', //success,error,warning,info
						showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
						confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
						cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
						confirmButtonText: '승인', // confirm 버튼 텍스트 지정
						cancelButtonText: '취소', // cancel 버튼 텍스트 지정
						reverseButtons: true, // 버튼 순서 거꾸로
						closeOnClickOutside:false,//창 제외하고 다른 곳 클릭시 창안닫히도록?
						closeOnEsc:false//esc키 안먹히도록(기본true)?
					}).then(result => {
						//let url = 'delete.do?board_num=${chatboard.chatboard_num}';
						// 만약 Promise리턴을 받으면,
						if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
						Swal.fire({
								title:'삭제가 완료되었습니다.',
								icon: 'success',
								showConfirmButton: false});
				      	}
				      	setTimeout(function(){
							location.replace('delete.do?chatboard_num=${chatboard.chatboard_num}');
							}, 1000);
				    })
									
					//여기까지 테스트
					//}
				};
			</script>
	</div>


	<!-- 댓글 -->
	<!--  
	<hr width="100%" noshade="noshade">
	<div id="reply_div">
		<span class="re-title">댓글 달기 테스트</span>
		<form id="re_form">
			<input type="hidden" name="board_num" value="${board.board_num}"
				id="board_num">
			<textarea rows="3" cols="50" name="re_content" id="re_content"
				class="rep-content"
				<c:if test="${empty user_num}">disabled="disabled"</c:if>><c:if
					test="${empty user_num}">로그인해야 작성할 수 있습니다</c:if></textarea>

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


</div>

<!-- 중앙 컨텐츠 끝 -->