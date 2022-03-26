<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function() {
		$('#insertCal')
				.submit(
						function(event) {
							var year = $('.cal-year').text();
							var month = $('.cal-month').text();
							var day = $('.day-active').text();
							if ($('.day-active').text() < 10) {
								day = '0' + $('.day-active').text();
							}
							var custom_date = year + '-' + month + '-' + day;
							$('#custom_date').val(custom_date);
							if ($('.day2').hasClass('day-active') == false) {
								alert('날짜를 선택해주세요.');
								return false;
							} else {
								let data = $(this).serialize();
								$
										.ajax({
											type : 'post',
											data : {
												contents_num : $(
														'#contents_num').val(),
												custom_date : $('#custom_date')
														.val(),
												contents_type : $(
														'#contents_type').val(),
												poster_path : $('#poster_path')
														.val()
											},
											url : 'insertCal.do',
											dataType : 'json',
											cache : false,
											timeout : 30000,
											success : function(param) {
												if (param.result == 'logout') {
													alert('로그인후 등록할 수 있습니다.');
												} else if (param.result == 'success') {
													alert('등록되었습니다.');
													location
															.replace('detail.do?type=${param.type }&id=${param.id}');
												} else {
													alert('등록시 오류 발생');
												}
											},
											error : function() {
												alert('네트워크 오류 발생!');
											}
										});
							}
						});
	});
</script>
<!DOCTYPE html>
<body>
	<!-- Modal body -->
	<div class="modal-body calendar-body">
		<form id="insertCal">
			<input type="hidden" value="${contents.id }" id="contents_num">
			<input type="hidden" value="${param.type }" id="contents_type">
			<input type="hidden" value="${contents.poster_path }"
				id="poster_path"> <input type="hidden" value=""
				id="custom_date">
			<div class="my-calendar clearfix">
				<div class="clicked-date" style="display: none;">
					<div class="cal-day"></div>
					<div class="cal-date"></div>
				</div>
				<div class="calendar-box">
					<div class="ctr-box clearfix">
						<button type="button" title="prev" class="btn-cal prev"></button>
						<span class="cal-year"></span> <span class="cal-month"></span>
						<button type="button" title="next" class="btn-cal next"></button>
					</div>
					<table class="cal-table">
						<thead>
							<tr>
								<th>S</th>
								<th>M</th>
								<th>T</th>
								<th>W</th>
								<th>T</th>
								<th>F</th>
								<th>S</th>
							</tr>
						</thead>
						<tbody class="cal-body"></tbody>
					</table>
				</div>
			</div>
			<div style="display: flex; justify-content: center;">
				<input class="css-1ukikc-StylelessButton" type="submit" value="등록">
			</div>
		</form>
	</div>
</body>
</html>