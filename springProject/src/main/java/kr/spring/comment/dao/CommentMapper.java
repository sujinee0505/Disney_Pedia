package kr.spring.comment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.comment.vo.CommentLikeVO;
import kr.spring.comment.vo.CommentVO;
import kr.spring.contents.vo.StarVO;

public interface CommentMapper {
	
	//코멘트 입력
	@Insert("INSERT INTO dcomment (comment_num,contents_num,contents_type,content,mem_num,reg_date) "
			+ "VALUES (dcomment_seq.nextval,#{contents_num},#{contents_type},#{content},#{mem_num},SYSDATE)")
	public void insertComment(CommentVO comment); 
	
	//코멘트 기록 체크
	@Select("SELECT COUNT(*) FROM dcomment WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND mem_num=#{mem_num}")
	public int checkComment(CommentVO comment);
	
	//코멘트 한 건 vo로 반환(영화,회원일치하는)
	@Select("SELECT * FROM dcomment WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND mem_num=#{mem_num}")
	public CommentVO getComment(CommentVO comment);
	
	
	//코멘트 수정
	@Update("UPDATE dcomment SET content=#{content},modify_date=SYSDATE "
			+ "WHERE comment_num=#{comment_num}")
	public void updateComment(CommentVO commentVO);
	
	/*
	 * @Select("SELECT comment_num,contents_num,contents_type,content,mem_num,reg_date FROM dcomment WHERE contents_num=#{contents_num}"
	 * ) public CommentVO checkComment(int contents_num);
	 */
	
	/*"SELECT * FROM qboard b JOIN qmember m " + "ON b.user_num=m.user_num WHERE b.board_num=?";
			
	 * @Select("SELECT * FROM dcomment c JOIN dmember m ON c.mem_num=m.mem_num " +
	 * "WHERE c.comment_num=#{comment_num}") public CommentVO selectComment(Integer
	 * comment_num);
	 */
	
	public List<CommentVO> selectList(Map<String,Object> map); //코멘트전체목록
		
	  @Select("SELECT COUNT(*) FROM dcomment c JOIN dmember m ON c.mem_num=m.mem_num "
	  + "WHERE c.comment_num=#{comment_num}") public int
	  selectRowCount(Map<String,Object> map);
	 		
	
	
	@Delete("DELETE FROM dcomment WHERE comment_num=#{comment_num}")
	public void deleteComment(Integer comment_num); //코멘트삭제
	
	//내가쓴 코멘트 목록
	public List<CommentVO> selectListByMem_num(int mem_num);
	
	//수진
	@Select("SELECT COUNT(contents_num) count, contents_num  FROM dcomment WHERE contents_type=#{contents_type} GROUP BY contents_num ORDER BY count(contents_num) DESC")
	public List<CommentVO> getMostCommented(String contents_type);
	
	//코멘트 좋아요
	public List<CommentLikeVO> selectListLike(Map<String,Object> map);
	@Select("SELECT COUNT(*) FROM dcomment_like c JOIN dmember m ON c.mem_num=m.mem_num WHERE c.commentlike_num=#{commentlike_num}")
	public int selectRowCountLike(Map<String,Object> map);
	@Select("SELECT * FROM dcomment_like c JOIN dmember m ON c.mem_num=m.mem_num WHERE c.commentlike_num=#{commentlike_num}")
	public CommentLikeVO selectLike(Integer commentlike_num);
	@Insert("INSERT INTO dcomment_like (commentlike_num, comment_num, mem_num) VALUES (dcomment_seq.nextval,#{comment_num},#{mem_num})")
	public void insertLike(CommentVO comment);
	@Delete("DELETE FROM dcomment_like WHERE commentlike_num=#{commentlike_num}")
	public void deleteLike(Integer commentlike_num);
	//내가 좋아요한 코멘트 목록
	@Select("SELECT * FROM dcomment_like l JOIN dcomment c ON l.comment_num=c.comment_num WHERE l.mem_num=#{mem_num} ORDER BY c.comment_num ASC")
	public List<CommentLikeVO> selectListLikeByMem_num(int mem_num);
}
