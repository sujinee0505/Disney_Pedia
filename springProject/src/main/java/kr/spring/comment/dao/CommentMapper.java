package kr.spring.comment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.comment.vo.CommentLikeVO;
import kr.spring.comment.vo.CommentVO;

public interface CommentMapper {
	
	//코멘트 입력
	@Insert("INSERT INTO dcomment (comment_num,contents_num,contents_type,content,mem_num,reg_date) "
			+ "VALUES (dcomment_seq.nextval,#{contents_num},#{contents_type},#{content},#{mem_num},SYSDATE)")
	public void insertComment(CommentVO comment); 
			
	public List<CommentVO> selectList(Map<String,Object> map); //코멘트목록
		
	  @Select("SELECT COUNT(*) FROM dcomment c JOIN dmember m ON c.mem_num=m.mem_num "
	  + "WHERE c.comment_num=#{comment_num}") public int
	  selectRowCount(Map<String,Object> map);
	 		
	@Select("SELECT * FROM dcomment c JOIN dmember m ON c.mem_num=m.mem_num "
			+ "WHERE c.comment_num=#{comment_num}")
	public CommentVO selectComment(Integer comment_num); //코멘트정보
	
	@Update("UPDATE dcomment SET content=#{content}modify_date=SYSDATE "
			+ "WHERE comment_num=#{comment_num}")
	public void updateComment(CommentVO commentVO); //코멘트수정
	
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
