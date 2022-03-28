package kr.spring.function.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.spring.function.vo.CalendarVO;
import kr.spring.util.DateUtil;

public interface CalendarMapper {
	@Insert("INSERT INTO dcontents_cal (cal_num,custom_date,contents_num,contents_type,poster_path,mem_num) "
			+ "VALUES (dcontents_cal_seq.nextval,TO_DATE(#{custom_date},'YYYY-MM-DD'),#{contents_num},#{contents_type},#{poster_path},#{mem_num})")
	public void insertCalendar(CalendarVO calendarVO);

	@Select("SELECT TO_CHAR(custom_date, 'YYYY-MM-DD') custom_date, contents_num, contents_type, poster_path FROM dcontents_cal "
			+ "WHERE mem_num=#{mem_num} AND custom_date BETWEEN #{db_startDate} AND #{db_endDate} ")
	public ArrayList<CalendarVO> selectList(@Param("mem_num") Integer mem_num,
			@Param("db_startDate") String db_startDate, @Param("db_endDate") String db_endDate, DateUtil dateData);
}
