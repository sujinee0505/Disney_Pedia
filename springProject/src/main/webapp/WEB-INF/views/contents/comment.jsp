<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<body>
      <!-- Modal Header -->
      <div class="modal-header border-0" id="comment-header">
        <p class="modal-title2"><b>${contents.title }</b></p>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body comment-body">
      	<form action="" method="post" role="form" id="comment_form">	
      	<textarea autofocus required cols="30" rows="10" id="comment" name="comment" 
      	placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요." ></textarea>
      	<div class="float_right">
			<div id="count_area">
			<span class="letter-count">0/10000</span>
			</div> 
			<button type="submit" id="comment_btn" class="btn btn-dark-blue">저장</button>
			<!-- btn-hover color-9 -->
		</div>
		</form> 		
	  </div>	    
	  <script type="text/javascript">
	  $(function() {
		  //커서
		  $('#commentModal').on('shown.bs.modal', function() {
				$('#comment').trigger('focus')
			});
		  //글자수카운트
	 	 $(document).on('keyup','textarea',function(){
			//입력한 글자수를 구함
			let inputLength = $(this).val().length;
			
			if(inputLength > 10000){//10000자를 넘어선 경우
				$(this).val($(this).val().substring(0,10000));
			}else{//10000자 이하인 경우
				inputLength += '/10000';
				if($(this).attr('id') == 'comment'){
					$('#count_area .letter-count').text(inputLength);
				};
			}
		}); 
	  });
	  </script>
</body>
</html>