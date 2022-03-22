<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		//프로필 사진 업로드
		$('#photo_btn').click(function() {
			$('#photo_choice').show();
			$(this).hide();
		});
		//처음 화면에 보여지는 이미지 읽기
		let photo_path = $('.my-photo').attr('src');
		let my_photo;
		$('#upload').change(function() {
			my_photo = this.files[0];
			if(!my_photo) {
				$('.my-photo').attr('src', photo_path);
				return;
			}
			if(my_photo.size > 1024 * 1024) {
				alert(Math.round(my_photo.size/1024) + 'kbytes(1024kbytes까지만 업로드 가능)');
				$('.my-photo').attr('src', photo_path);
				$(this).val('');
				return;
			}
			//이미지 미리보기
			var reader = new FileReader();
			reader.readAsDataURL(my_photo);
			
			reader.onload = function() {
				$('.my-photo').attr('src', reader.result);
			};
		});//end of change
		
		//이미지를 서버에 전송
		$('#photo_submit').click(function() {
			if($('#upload').val() == '') {
				alert('파일을 선택하세요!');
				$('#upload').focus();
				return;
			}
			//파일 전송
			var form_data = new FormData();
			form_data.append('upload', my_photo);
			
			$.ajax({
				url:'updateMyPhoto.do',
				type:'post',
				data:form_data,
				dataType:'json',
				contentType:false,
				enctype:'multipart/form-data',
				processData:false,
				success:function(param) {
					if(param.result == 'logout') {
						alert('로그인 후 사용하세요');
					}else if(param.result == 'success') {
						alert('프로필 사진이 수정되었습니다.');
						photo_path = $('.my-photo').attr('src');
						$('#upload').val('');
						$('#photo_choice').hide();
						$('#photo_btn').show();
					}else {
						alert('파일 전송 오류 발생');
					}
				},
				error:function() {
					alert('네트워크 오류 발생');
				}
			});
		});//end of click
		
		$('#photo_reset').click(function() {
			$('.my-photo').attr('src', photo_path);
			$('#upload').val('');
			$('#photo_choice').hide();
			$('#photo_btn').show();
		});
		
	});
</script>
<style>
body {
  background: #F1F3FA;
}
ul li {
	list-style: none
}
.profile-userpic img {
    float: none;
    text-align: center;
    margin-top: 100px !important;
    width: 50%;
    height: 50%;
    -webkit-border-radius: 50% !important;
    -moz-border-radius: 50% !important;
    border-radius: 50% !important;
   } 
</style>
<div class="container">
<form:form modelAttribute="memberVO" action="update.do" id="modify_form">
	<form:errors element="div" cssClass="error-color"/>
    <div class="row profile">
      <div class="col-md-3">
            <!-- SIDEBAR USERPIC -->
            <div class="profile-userpic">
               <ul>
                  <li><c:if test="${empty member.photo_name}">
                        <img
                           src="${pageContext.request.contextPath}/resources/images/face.png"
                           width="200" height="200" class="my-photo">
                     </c:if> <c:if test="${!empty member.photo_name}">
                        <img
                           src="${pageContext.request.contextPath}/member/photoView.do"
                           width="200" height="200" class="my-photo">
                     </c:if></li>
                     <li>
					<div class="align-center">
						<input type="button" value="사진변경" id="photo_btn"> 
					</div>
					<div id="photo_choice" style="display: none;">
						<input type="file" id="upload" accept="image/gif,image/png,image/jpeg">
						<input type="button" value="전송" id="photo_submit">
						<input type="button" value="취소" id="photo_reset">
					</div>
					</li>
               </ul>
            </div>
            <!-- END SIDEBAR USERPIC -->
            <!-- SIDEBAR USER TITLE -->
            <div class="profile-usertitle">
                <div class="profile-usertitle-name">
                <ul>
               		<li>
						<form:label path="name">이름</form:label>
						<form:input path="name"/>
						<form:errors path="name" cssClass="error-color"/>
					</li>
					<li>
						<form:label path="introduction">소개</form:label>
						<form:textarea path="introduction"/>
						<form:errors path="introduction" cssClass="error-color"/>
					</li>
               </ul>
               </div>
            </div>
            <!-- END SIDEBAR USER TITLE -->
            <!-- SIDEBAR BUTTONS -->
            <div class="profile-userbuttons">
               <form:button>전송</form:button>
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
			<input type="button" value="비밀번호변경" onclick="location.href='changePassword.do'"> 
			<input type="button" value="회원탈퇴" onclick="location.href='delete.do'">  
            </div>
            <!-- END SIDEBAR BUTTONS -->
      </div>
   </div>
   </form:form>
</div>
 