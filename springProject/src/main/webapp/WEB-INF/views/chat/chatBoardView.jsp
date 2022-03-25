<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><!-- 조건체크 -->
						<!-- 이미지일경우 보여지게 하고 이미지아닐경우 다운로드하도록 functions이용할 것. -->
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/mj.css"></script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>

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
		<button class="btn btn-secondary m-2" id="list_btn" onclick="location.href='list.do'">목록</button>
		<c:if test="${!empty user_num && user_num == chatboard.mem_num}">
			<button class="btn btn-secondary m-2" id="modify_btn" 
					onclick="location.href='update.do?chatboard_num=${chatboard.chatboard_num}'">수정</button>
			<button class="btn btn-secondary m-2" id="delete_btn">삭제</button>
		</c:if>
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
	<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions"
		 aria-labelledby="offcanvasWithBothOptionsLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Backdrop
				with scrolling</h5>
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<p>Try scrolling the rest of the page to see this option in
				action.</p>
		</div>
	</div>


</div>

<!-- 중앙 컨텐츠 끝 -->