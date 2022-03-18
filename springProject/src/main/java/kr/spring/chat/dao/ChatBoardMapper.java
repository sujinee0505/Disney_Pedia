package kr.spring.chat.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.chat.vo.ChatBoardVO;

public interface ChatBoardMapper {
	
	//**글 목록
	//xml
	public List<ChatBoardVO> selectList(Map<String,Object> map); 
	//xml
	public int selectRowCount(Map<String,Object> map);

	//**글 등록 폼에서 전송된 데이터 처리
	@Insert("INSERT INTO dchatboard (chatboard_num,mem_num,title,content) "
			+ "VALUES (dchatboard_seq.nextval,#{mem_num},#{title},#{content})")
	public void insertBoard(ChatBoardVO board); 

	
	
	
	
	@Select("SELECT * FROM dchatboard b JOIN spmember m "
			+ "ON b.mem_num=m.mem_num WHERE b.board_num=#{board_num}")
	public ChatBoardVO selectBoard(Integer board_num);

	@Update("UPDATE dchatboard SET hit=hit+1 WHERE board_num=#{board_num}")
	public void updateHit(Integer board_num);//조회수

	//xml
	public void updateBoard(ChatBoardVO board);

	@Delete("DELETE FROM dchatboard WHERE board_num=#{board_num}")
	public void deleteBoard(Integer board_num);

	@Update("UPDATE dchatboard SET uploadfile='',filename='' "
			+ "WHERE board_num=#{board_num}")
	public void deleteFile(Integer board_num);

}
