<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 중앙 컨텐츠 시작 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
<%-- <div class="page-main">
	<h2>프로필 사진</h2>
	<ul>
		<li>
			<c:if test="${empty member.photo_name}">
			<img src="${pageContext.request.contextPath}/resources/images/face.png" width="200" height="200" class="my-photo">
			</c:if>
			<c:if test="${!empty member.photo_name}">
			<img src="${pageContext.request.contextPath}/member/photoView.do" width="200" height="200" class="my-photo">
			</c:if>
		</li>
		<li>
			<div class="align-center">
				<input type="button" value="수정" id="photo_btn"> 
			</div>
			<div id="photo_choice" style="display: none;">
				<input type="file" id="upload" accept="image/gif,image/png,image/jpeg">
				<input type="button" value="전송" id="photo_submit">
				<input type="button" value="취소" id="photo_reset">
			</div>
		</li>
	</ul>
	<h2>회원 상세 정보</h2>
	<ul>
		<li>이름 </li>
		<li>${member.name}</li>
		<li>소개</li>
		<li>${member.introduction}</li>
		<li>팔로워 {member.active_mem} | 팔로워 {member.passive_mem}</li>
		
	</ul>
	<hr size="1" width="100%">
	<p class="align-right">
		<input type="button" value="회원정보수정" onclick="location.href='update.do'">
		
		<input type="button" value="비밀번호변경" onclick="location.href='changePassword.do'"> 
		<input type="button" value="회원탈퇴" onclick="location.href='delete.do'">                                     
	</p>
</div> --%>
<!-- 중앙 컨텐츠 끝 -->
<style>
body {
  background: #F1F3FA;
}

/* Profile container */
.profile {
  text-align: center;
  background: #fff;
  min-height: 460px;
}

.profile-userpic img {
  float: none;
  margin: 0 auto;
  width: 50%;
  height: 50%;
  -webkit-border-radius: 50% !important;
  -moz-border-radius: 50% !important;
  border-radius: 50% !important;
}

.profile-usertitle {
  text-align: center;
  margin-top: 20px;
}

.profile-usertitle-name {
  color: #5a7391;
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 7px;
}

.profile-usertitle-intro {
  text-transform: uppercase;
  color: #5b9bd1;
  font-size: 12px;
  font-weight: 600;
  margin-bottom: 15px;
}

.profile-userbuttons {
  text-align: center;
  margin-top: 10px;
}

.profile-userbuttons .btn {
  text-transform: uppercase;
  font-size: 11px;
  font-weight: 600;
  padding: 6px 15px;
  margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
  margin-right: 0px;
}


</style>
<div class="container">
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
					</ul>
				</div>
				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
					<ul>
					<li>${member.name}</li>
					</ul>
					</div>
					<div class="profile-usertitle-intro">
					<ul>
					<li>${member.introduction}</li>
					</ul>
					</div>
				</div>
				<!-- END SIDEBAR USER TITLE -->
				<!-- SIDEBAR BUTTONS -->
				<div class="profile-userbuttons">
					<input type="button"  class="btn btn-success btn-sm" value="프로필수정" onclick="location.href='update.do'">
				</div>
				<!-- END SIDEBAR BUTTONS -->
		</div>
	</div>
</div>
