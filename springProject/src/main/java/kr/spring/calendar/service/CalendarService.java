package kr.spring.calendar.service;

import java.util.ArrayList;

import kr.spring.calendar.vo.CalendarVO;
import kr.spring.util.DateUtil;

public interface CalendarService {
	public void insertCalendar(CalendarVO calendarVO);

	public ArrayList<CalendarVO> selectList(int mem_num, String db_startDate, String db_endDate, DateUtil dateData);

	public String checkDate(CalendarVO calendarVO);
}
