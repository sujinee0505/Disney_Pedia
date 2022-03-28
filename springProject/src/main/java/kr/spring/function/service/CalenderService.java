package kr.spring.function.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.spring.function.vo.CalendarVO;
import kr.spring.util.DateUtil;

public interface CalenderService {
	public void insertCalendar(CalendarVO calendarVO);

	public ArrayList<CalendarVO> selectList(int mem_num, String db_startDate, String db_endDate, DateUtil dateData);
}
