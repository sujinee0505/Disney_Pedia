<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	
</script>
<!DOCTYPE html>
<body>
	<!-- Modal body -->
	<div class="modal-body calendar-body">
		<form id="insertCal">
			<input type="hidden" value="${contents.id }" id="contents_num">
			<input type="hidden" value="${contents.type }" id="contents_type">
			<input type="hidden" value="${contents.poster_path }"
				id="poster_path">
			<div style="display: flex; justify-content: center;">
				<input class="css-1ukikc-StylelessButton" type="submit" value="등록">
			</div>
		</form>
	</div>
</body>
</html>