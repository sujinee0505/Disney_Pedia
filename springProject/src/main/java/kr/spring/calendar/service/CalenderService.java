package kr.spring.calendar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.spring.calendar.vo.CalendarVO;
import kr.spring.util.DateUtil;

public interface CalenderService {
	public void insertCalendar(CalendarVO calendarVO);

	public ArrayList<CalendarVO> selectList(int mem_num, DateUtil dateData);
}
