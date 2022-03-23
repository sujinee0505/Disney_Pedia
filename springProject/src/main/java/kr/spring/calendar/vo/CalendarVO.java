package kr.spring.calendar.vo;

import java.sql.Date;

public class CalendarVO {

	private int cal_num;
	private int contents_num;
	private int mem_num;
	private Date custom_date;

	public int getCal_num() {
		return cal_num;
	}

	public void setCal_num(int cal_num) {
		this.cal_num = cal_num;
	}

	public int getContents_num() {
		return contents_num;
	}

	public void setContents_num(int contents_num) {
		this.contents_num = contents_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public Date getCustom_date() {
		return custom_date;
	}

	public void setCustom_date(Date custom_date) {
		this.custom_date = custom_date;
	}

	@Override
	public String toString() {
		return "ScheduleDto [cal_num=" + cal_num + ", contents_num=" + contents_num + ", mem_num=" + mem_num
				+ ", custom_date=" + custom_date + "]";
	}
}