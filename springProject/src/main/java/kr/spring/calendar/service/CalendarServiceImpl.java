package kr.spring.calendar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.calendar.dao.CalendarMapper;
import kr.spring.calendar.vo.CalendarVO;
import kr.spring.util.DateUtil;

@Service
public class CalendarServiceImpl implements CalenderService {
	@Autowired
	private CalendarMapper calendarMapper;

	@Override
	public void insertCalendar(CalendarVO calendarVO) {

	}

	@Override
	public ArrayList<CalendarVO> selectList(int mem_num, String db_startDate, String db_endDate, DateUtil dateData) {
		return calendarMapper.selectList(mem_num, db_startDate, db_endDate, dateData);
	}

}
