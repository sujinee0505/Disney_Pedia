package kr.spring.calendar.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.calendar.service.CalenderService;
import kr.spring.calendar.vo.CalendarVO;
import kr.spring.util.DateUtil;

@Controller
public class CalendarController {

	@Autowired
	private CalenderService calenderService;

	@RequestMapping("calendar/calendar.do")
	public String calendar(Model model, HttpSession session, HttpServletRequest request, DateUtil dateData) {

		// 날짜 함수를 이용하기 위한 Calendar 클래스의 인스턴스 호출
		Calendar cal = Calendar.getInstance();

		DateUtil calendarData;

		// 따로 지정한 연도와 월이 없는경우 현재 연도와 월을 set
		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateUtil(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null, null);
		}

		Map<String, Object> today_info = dateData.today_info(dateData);
		List<DateUtil> dateList = new ArrayList<DateUtil>();

		Integer mem_num = (Integer) session.getAttribute("user_num");

		String db_startDate = String.valueOf(today_info.get("db_startDate"));
		String db_endDate = String.valueOf(today_info.get("db_endDate"));
		
		// 본 컨텐츠 내역 불러와서 저장
		ArrayList<CalendarVO> contents_list = calenderService.selectList(mem_num, db_startDate, db_endDate, dateData);

		CalendarVO[][] contents_data_arr = new CalendarVO[32][4];
		if (contents_list.isEmpty() != true) {
			int j = 0;
			for (int i = 0; i < contents_list.size(); i++) {

				int date = Integer.parseInt(String.valueOf(contents_list.get(i).getCustom_date()).substring(
						String.valueOf(contents_list.get(i).getCustom_date()).length() - 2,
						String.valueOf(contents_list.get(i).getCustom_date()).length()));

				// 저장되어 있는 총 컨텐츠 갯수가 1개가 넘을 경우
				if (i > 0) {

					// i번째 컨텐츠 등록 날짜와 i-1번째 컨텐츠 등록 날짜를 비교
					int date_check = Integer.parseInt(String.valueOf(contents_list.get(i - 1).getCustom_date())
							.substring(String.valueOf(contents_list.get(i - 1).getCustom_date()).length() - 2,
									String.valueOf(contents_list.get(i - 1).getCustom_date()).length()));

					// i번째 컨텐츠 등록 날짜와 i-1번째 컨텐츠 등록 날짜가 같을 경우
					// 즉, 같은 날에 등록된 컨텐츠 갯수가 1개 이상일 경우
					if (date_check == date) {
						j = j + 1;
						contents_data_arr[date][j] = contents_list.get(i);
						// 같은 날에 등록된 컨텐츠 갯수가 1개일 경우
					} else {
						j = 0;
						contents_data_arr[date][j] = contents_list.get(i);
					}
					// // 저장되어 있는 총 컨텐츠 갯수가 1개일 경우
				} else {
					contents_data_arr[date][j] = contents_list.get(i);
				}
			}
		}

		// 실질적인 달력 데이터 리스트에 데이터 삽입 시작
		// 일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for (int i = 1; i < Integer.parseInt(String.valueOf(today_info.get("start"))); i++) {
			calendarData = new DateUtil(null, null, null, null, null);
			dateList.add(calendarData);
		}

		// 날짜 삽입
		for (int i = Integer.parseInt(String.valueOf(today_info.get("startDay"))); i <= Integer
				.parseInt(String.valueOf(today_info.get("endDay"))); i++) {
			CalendarVO[] contents_data_arr3 = new CalendarVO[4];
			contents_data_arr3 = contents_data_arr[i];

			// 특정 날짜가 오늘에 해당할 경우 value에 'today'라는 값을 넣어준다.
			if (i == Integer.parseInt(String.valueOf(today_info.get("today")))) {
				calendarData = new DateUtil(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today", contents_data_arr3);
			} else {
				calendarData = new DateUtil(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date", contents_data_arr3);
			}
			dateList.add(calendarData);
		}

		// 달력 빈 곳 빈 데이터로 삽입
		int index = 7 - dateList.size() % 7;

		if (dateList.size() % 7 != 0) {

			for (int i = 0; i < index; i++) {
				calendarData = new DateUtil(null, null, null, null, null);
				dateList.add(calendarData);
			}
		}

		model.addAttribute("dateList", dateList);
		model.addAttribute("today_info", today_info);

		return "calendar";
	}
}
