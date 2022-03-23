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
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.calendar.service.CalenderService;
import kr.spring.calendar.vo.CalendarVO;
import kr.spring.util.DateUtil;

@Controller
public class CalendarController {

	@Autowired
	private CalenderService calenderService;

	@RequestMapping("calendar/calendar.do")
	public String calendar(Model model, HttpSession session, HttpServletRequest request, DateUtil dateData) {

		Calendar cal = Calendar.getInstance();

		DateUtil calendarData;

		// 검색 날짜
		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateUtil(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null, null);
		}

		Map<String, Integer> today_info = dateData.today_info(dateData);
		List<DateUtil> dateList = new ArrayList<DateUtil>();

		Integer mem_num = (Integer) session.getAttribute("user_num");
		ArrayList<CalendarVO> Schedule_list = calenderService.selectList(mem_num, dateData);

		// 달력데이터에 넣기 위한 배열 추가
		CalendarVO[][] schedule_data_arr = new CalendarVO[32][4];
		if (Schedule_list.isEmpty() != true) {
			int j = 0;

			for (int i = 0; i < Schedule_list.size(); i++) {

				// 20220323.substring(6,8) > 날짜만 추출
				int date = Integer.parseInt(String.valueOf(Schedule_list.get(i).getCustom_date()).substring(
						String.valueOf(Schedule_list.get(i).getCustom_date()).length() - 2,
						String.valueOf(Schedule_list.get(i).getCustom_date()).length()));

				// 스케줄 갯수가 1개이상일 경우
				if (i > 0) {
					// 스케줄 하루 전날.. 20220322
					int date_before = Integer.parseInt(String.valueOf(Schedule_list.get(i - 1).getCustom_date())
							.substring(String.valueOf(Schedule_list.get(i - 1).getCustom_date()).length() - 2,
									String.valueOf(Schedule_list.get(i - 1).getCustom_date()).length()));
					if (date_before == date) {
						// ex) 22/03/23 의 스케줄일 경우 [23][1]
						j = j + 1;
						schedule_data_arr[date][j] = Schedule_list.get(i);
					} else {
						j = 0;
						schedule_data_arr[date][j] = Schedule_list.get(i);
					}
					// 스케줄 갯수가 1개일 경우
				} else {
					// 22/03/23 의 스케줄일 경우 [23][0]
					schedule_data_arr[date][j] = Schedule_list.get(i);
				}
			}
		}
		// 실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		// 일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for (int i = 1; i < today_info.get("start"); i++) {
			calendarData = new DateUtil(null, null, null, null, null);
			dateList.add(calendarData);
		}

		// 날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			CalendarVO[] schedule_data_arr3 = new CalendarVO[4];
			schedule_data_arr3 = schedule_data_arr[i];

			if (i == today_info.get("today")) {
				calendarData = new DateUtil(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today", schedule_data_arr3);
			} else {
				calendarData = new DateUtil(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date", schedule_data_arr3);
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

		// 배열에 담음
		model.addAttribute("dateList", dateList); // 날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		return "calendar";
	}
}
