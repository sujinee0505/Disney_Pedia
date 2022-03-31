<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
#chatting_message {
	background-color: #f5efe6;
	border: 1px solid #999;
	border-radius: 5px;
	width: 660px;
	height: 300px;
	margin: 0 auto;
	padding: 10px;
	overflow: auto;
	font-size: 13px;
	color: #333;
}

.item {
	
}

.from-position {
	width: 300px;
	margin: 10px 0 10px 330px;
}

.from-position .item {
	border-radius: 10px;
	background-color: #90b494;
	padding: 10px;
	height: 50px;
	display: block;
}

.to-position {
	width: 300px;
	margin: 10px 0 10px 0;
}

.to-position .item {
	border-radius: 10px;
	background-color: #ffd891;
	padding: 10px;
	height: 50px;
}

#trans_id {
	font-size: 18pt;
}

#rev_msg {
	font-size: 18pt;
	color: red;
}
</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
   $(function(){
	  let chatboard_num = $('#chatboard_num').val();
      let count=0;
      let scroll_check;
      let loop_check = true;
      $('#content').keydown(function(event){
         if(event.keyCode == 13 && !event.shiftKey) {
            $('#chatting_form').trigger('submit');
        }
    });
      
		// 채팅 내용 불러오기
		selectData = function() {
			$.ajax({
				url:'getChatting.do',
				type:'post',
				data:{chatboard_num:chatboard_num,from_num:${user_num},to_num:${trans_num}}, // 그동안의 채팅 이력들을 불러오기 위해 인자로 chatboard_num, user_num(로그인 한 유저), trans_num(글 작성자)을 전송
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
				if(param.result == 'logout'){
					loop_check = false;
					alert('로그인 후 사용하세요!');   
				}else if(param.result == 'success'){
					
					/* if(count<param.count) scroll_check = true;
					else scroll_check = false;
					count = param.count; */
					
						$('#chatting_message').empty();
					
						$(param.getChatting).each(function(index,item){
							let output = '';
							if(item.from_num == ${user_num}){
								output += '<div class="from-position">'+item.name;
							}else{                     
								output += '<div class="to-position">'+item.name;
							}
							output += '<div class="item">';
							output += /* (item.chatstate_num !=0 ? '<b>①</b>' : '') +  */' <span>' + item.content + '</span>';
							output += '</div>';
							output += '</div>';
							
							//문서 객체에 추가
							$('#chatting_message').append(output);
							if(scroll_check){
								//스크롤를 하단으로 위치시킴
								$('#chatting_message').scrollTop($("#chatting_message")[0].scrollHeight);
							}
						});   
					}else{
					loop_check = false;
					alert('오류가 발생했습니다!');   
					}
				},
				error:function(){
				loop_check = false;
				alert('네트워크 오류 발생');
				}
			});
			
		}
      
	selectData();
      
		// 채팅 메세지 전송 
		$('#chatting_form').submit(function(event){
			if($('#content').val().trim() == ''){
			alert('내용을 입력하세요!');
			$('#content').val('').focus();
			return false;
			}
			
			$.ajax({
			type:'post',
			data:{chatboard_num:chatboard_num,from_num:${user_num},to_num:${trans_num},content:$('#content').val()}, // dchatting 테이블에 저장돼야하는 값들을 넘겨줍니다
			url:'writeChat.do',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인해야 작성할 수 있습니다.');
				}else if(param.result == 'success'){
					//폼 초기화
					$('#content').val('').focus();
					selectData();
				}else{
					alert('등록시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류!');
			}
			});
			event.preventDefault();
		});
		
$('#모집').click(function() {
	var check = 0;
	 if ($(this).text()=='모집중') {
		 check = 0;
	}else if($(this).text()=='모집완료'){
		check = 1;
	} 
	$.ajax({
		url:'updateMateState.do',
		type:'post',
		data:{chatboard_num:chatboard_num, check : check }, // dchatting 테이블에 저장돼야하는 값들을 넘겨줍니다
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(param){
			if(param.result == 'logout'){
				alert('로그인해야 작성할 수 있습니다.');
			}else if(param.result == 'success'){
				if (check==0) {
					$('#모집').text('모집완료');
					$('#모집').removeClass('bg-light text-dark').addClass('bg-danger');
					check = 1;
				}else if (check==1) {
					$('#모집').text('모집중');
					$('#모집').removeClass('bg-danger').addClass('bg-light text-dark');
					check = 0;
				}
			}else{
				alert('모집완료로 변경시 오류 발생');
			}
		},
		error:function(){
			alert('네트워크 오류!');
		}
		});
});
   });	

</script>

<div class="page-main-chat" style="margin-top: 100px;">
	<c:if test="${user_num != chatboard.mem_num}">
		<!-- 얘는 왜 chatboard 나중에 통일시키자-->
		<span id="trans_id"> ${chatBoard.title}의 작성자 <small>${chatBoard.name}</small>님과
			채팅 ${chatBoard.mate_state}
		</span>
	</c:if>
	<p />

	<!-- mate_state : 0 모집중/1 모집완료 -->
	<c:if test="${user_num == chatBoard.mem_num}">
		<!-- 얘는 왜 chatBoard -->
		<span id="trans_id"><b>${member.mem_num}과의 대화</b></span>
		<button id="모집"
			class="badge rounded-pill <c:if test="${chatBoard.mate_state == 0}">bg-light text-dark</c:if><c:if test="${chatBoard.mate_state == 1}">bg-danger</c:if>">
			<c:if test="${chatBoard.mate_state == 0}">모집중</c:if>
			<c:if test="${chatBoard.mate_state == 1}">모집완료</c:if>
		</button>
	</c:if>
	
	<span id="rev_msg"> <c:if test="${chatBoard.mate_state == 1}">모집완료</c:if>
	</span>

	<div id="chatting_message"></div>

	<form method="post" id="chatting_form"
		style="width: 660px; background-color: #d8e3d9; border: 1px solid #999; border-radius: 5px;">
		<input type="hidden" id="chatboard_num" name="chatboard_num"
			value="${chatBoard.chatboard_num}">
		<c:if test="${user_num != chatBoard.mem_num}">
			<input type="hidden" id="to_num" name="to_num"
				value="${chatBoard.mem_num}">
		</c:if>
		<c:if test="${user_num == chatBoard.mem_num}">
			<input type="hidden" name="to_num" value="${meber.mem_num}">
		</c:if>
		<ul>
			<li><label for="content">내용</label> <textarea rows="7" cols="50"
					name="content" id="content" style="border-radius: 5px;"></textarea>
				<button type="submit" value="전송" class="btn-chat">전송</button></li>
		</ul>
	</form>
</div>

