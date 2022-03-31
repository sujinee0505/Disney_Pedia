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
      
   });

</script>