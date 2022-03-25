package kr.spring.member.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberVO;

public interface MemberMapper {
	//사용자
	@Select("SELECT dmember_seq.nextval FROM dual")
	public int selectMem_num();
	@Insert("INSERT INTO dmember (mem_num,id) VALUES (#{mem_num},#{id})")
	public void insertMember(MemberVO member);
	@Insert("INSERT INTO dmember_detail (mem_num,name,passwd) VALUES (#{mem_num},#{name},#{passwd})")
	public void insertMember_detail(MemberVO member);
	@Select("SELECT m.mem_num,m.id,m.auth,d.passwd,d.photo,d.photo_name "
		  + "FROM dmember m LEFT OUTER JOIN dmember_detail d "
		  + "ON m.mem_num=d.mem_num WHERE m.id=#{id}")
	public MemberVO selectCheckMember(String id);
	@Select("SELECT * FROM dmember m JOIN dmember_detail d "
		  + "ON m.mem_num=d.mem_num WHERE m.mem_num=#{mem_num}")
	public MemberVO selectMember(Integer mem_num);
	@Update("UPDATE dmember_detail SET name=#{name},introduction=#{introduction},modify_date=SYSDATE "
		  + "WHERE mem_num=#{mem_num}")
	public void updateMember(MemberVO member);
	@Update("UPDATE dmember_detail SET passwd=#{passwd} WHERE mem_num=#{mem_num}")
	public void updatePassword(MemberVO member);
	@Update("UPDATE dmember SET auth=0 WHERE mem_num=#{mem_num}")
	public void deleteMember(Integer mem_num);
	@Delete("DELETE FROM dmember_detail WHERE mem_num=#{mem_num}")
	public void deleteMember_detail(Integer mem_num);
	@Update("UPDATE dmember_detail SET photo=#{photo},photo_name=#{photo_name} WHERE mem_num=#{mem_num}")
	public void updateProfile(MemberVO member);
}
