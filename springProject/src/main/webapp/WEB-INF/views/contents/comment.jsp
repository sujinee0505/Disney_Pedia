<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<body>
      <!-- Modal Header -->
      <div class="modal-header">
        <p class="modal-title2"><b>${contents.title }</b></p>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body comment-body">
      	<form action="" method="post" role="form" id="comment_form">	
      	<textarea cols="30" rows="10" id="comment" name="comment" 
      	placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요." autofocus></textarea>
			<button type="submit" id="comment_btn" class="btn btn-hover color-9">저장</button>
		</form> 		
	  </div>	       
</body>
</html>