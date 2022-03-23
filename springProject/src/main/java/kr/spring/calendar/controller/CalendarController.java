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

		Calendar cal = Calendar.getInstance();

		DateUtil calendarData;

		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateUtil(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null, null);
		}

		Map<String, Object> today_info = dateData.today_info(dateData);
		List<DateUtil> dateList = new ArrayList<DateUtil>();

		Integer mem_num = (Integer) session.getAttribute("user_num");
		String db_startDate = String.valueOf(today_info.get("db_startDate"));
		String db_endDate = String.valueOf(today_info.get("db_endDate"));
		ArrayList<CalendarVO> contents_list = calenderService.selectList(mem_num, db_startDate, db_endDate, dateData);

		CalendarVO[][] contents_data_arr = new CalendarVO[32][4];

		if (contents_list.isEmpty() != true) {
			int j = 0;
			for (int i = 0; i < contents_list.size(); i++) {

				int date = Integer.parseInt(String.valueOf(contents_list.get(i).getCustom_date()).substring(
						String.valueOf(contents_list.get(i).getCustom_date()).length() - 2,
						String.valueOf(contents_list.get(i).getCustom_date()).length()));

				if (i > 0) {
					int date_before = Integer.parseInt(String.valueOf(contents_list.get(i - 1).getCustom_date())
							.substring(String.valueOf(contents_list.get(i - 1).getCustom_date()).length() - 2,
									String.valueOf(contents_list.get(i - 1).getCustom_date()).length()));
					if (date_before == date) {
						j = j + 1;
						contents_data_arr[date][j] = contents_list.get(i);
					} else {
						j = 0;
						contents_data_arr[date][j] = contents_list.get(i);
					}
				} else {
					contents_data_arr[date][j] = contents_list.get(i);
				}
			}
		}
		for (int i = 1; i < Integer.parseInt(String.valueOf(today_info.get("start"))); i++) {
			calendarData = new DateUtil(null, null, null, null, null);
			dateList.add(calendarData);
		}
		for (int i = Integer.parseInt(String.valueOf(today_info.get("startDay"))); i <= Integer
				.parseInt(String.valueOf(today_info.get("endDay"))); i++) {
			CalendarVO[] contents_data_arr3 = new CalendarVO[4];
			contents_data_arr3 = contents_data_arr[i];
			if (i == Integer.parseInt(String.valueOf(today_info.get("today")))) {
				calendarData = new DateUtil(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today", contents_data_arr3);
			} else {
				calendarData = new DateUtil(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date", contents_data_arr3);
			}
			dateList.add(calendarData);
		}

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
