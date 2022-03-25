<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
	<!-- Modal Header -->
	<div class="modal-header">
		<p class="modal-title2" style="margin: 0;">날짜를 선택해주세요</p>
		<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	</div>

	<!-- Modal body -->
	<div class="modal-body calendar-body">
		<div class="my-calendar clearfix">
			<div class="clicked-date" style="display: none;">
				<div class="cal-day"></div>
				<div class="cal-date"></div>
			</div>
			<div class="calendar-box">
				<div class="ctr-box clearfix">
					<button type="button" title="prev" class="btn-cal prev"></button>
					<span class="cal-month"></span> <span class="cal-year"></span>
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
	</div>
</body>
</html>