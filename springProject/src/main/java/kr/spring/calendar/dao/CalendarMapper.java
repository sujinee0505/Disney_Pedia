package kr.spring.calendar.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.spring.calendar.vo.CalendarVO;
import kr.spring.util.DateUtil;

public interface CalendarMapper {
	@Insert("INSERT INTO dcontents_cal (cal_num,custom_date,contents_num,mem_num) "
			+ "VALUES (dcontents_cal_seq.nextval,#{custom_date},#{contents_num},#{mem_num}")
	public void insertCalendar(CalendarVO calendarVO);

	@Select("SELECT TO_CHAR(custom_date, 'YYYY-MM-DD') custom_date, contents_num FROM dcontents_cal WHERE mem_num=#{mem_num}")
	public ArrayList<CalendarVO> selectList(@Param("mem_num") Integer mem_num, DateUtil dateData);
}
