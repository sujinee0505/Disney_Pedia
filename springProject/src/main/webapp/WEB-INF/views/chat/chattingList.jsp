<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		function selectData(pageNum){
		   
		   $('#output').empty();
		   
		   $.ajax({
		      url:'chattingList.do',
		      type:'post',
		      data:{chatboard_num:${param.chatboard_num}},
		      dataType:'json',
		      cache:false,
		      timeout:30000,
		      success:function(param){
		         if(param.result == 'logout'){
		            alert('로그인해야 채팅 목록을 볼 수 있습니다.');
		         }else if(param.result == 'success'){
		            $(param.chattingList).each(function(index,item){
		               let output = '<div>';
		               output += '<a href="chatting.do?chatboard_num=${chatboard.chatboard_num}&trans_num='+item.from_num+'">' + item.name + '('+item.chatstate_num+')님과 대화하기</a>';
		               output += '</div>';
		               
		               //문서 객체에 추가
		               $('#output').append(output);
		            });
		         }
		         
		      },
		      error:function(){
		         alert('네트워크 오류 발생');
		      }
		   });
		   
		}
		selectData(); 
	});
</script>


<div class="page-main-chat" id="main-chat" style="margin-top: 100px;">
	<h2>${chatboard.title}의
		작성자 <small>${chatboard.name}</small>님의 채팅 목록
	</h2>

	<div id="output"></div>
</div>
