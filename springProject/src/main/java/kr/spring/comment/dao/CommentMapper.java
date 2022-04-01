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

	// 코멘트 입력
	@Insert("INSERT INTO dcomment (comment_num,contents_num,contents_type,content,mem_num,reg_date) "
			+ "VALUES (dcomment_seq.nextval,#{contents_num},#{contents_type},#{content},#{mem_num},SYSDATE)")
	public void insertComment(CommentVO comment);

	// 코멘트 기록 체크(1->기록있음,0->기록없음)
	@Select("SELECT COUNT(*) FROM dcomment WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND mem_num=#{mem_num}")
	public int checkComment(CommentVO comment);

	// 코멘트 한 건 vo로 반환(영화,회원일치하는 레코드)
	@Select("SELECT * FROM dcomment WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND mem_num=#{mem_num}")
	public CommentVO getComment(CommentVO comment);

	// 코멘트 수정
	@Update("UPDATE dcomment SET content=#{content}, modify_date=SYSDATE WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND mem_num=#{mem_num}")
	public void updateComment(CommentVO commentVO);

	// 코멘트 삭제
	@Delete("DELETE FROM dcomment WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND mem_num=#{mem_num}")
	public void deleteComment(CommentVO commentVO);

	// 코멘트 상세 정보
	@Select("SELECT a.*, s.star FROM (SELECT d.name, c.* FROM dmember_detail d JOIN dcomment c ON d.mem_num = c.mem_num) a "
			+ "LEFT OUTER JOIN dcontents_star s ON s.star_num = a.star_num WHERE a.comment_num =#{comment_num}")
	public CommentVO selectComment(int comment_num);

	@Select("SELECT a.*, s.star FROM (SELECT d.name, d.photo_name, c.* FROM dmember_detail d JOIN dcomment c ON d.mem_num=c.mem_num ) a "
			+ "LEFT OUTER JOIN dcontents_star s ON a.star_num = s.star_num WHERE a.contents_type=#{contents_type} and a.contents_num=#{contents_num} ORDER BY a.comment_num DESC")
	public List<CommentVO> selectList(CommentVO comment); // 코멘트전체목록

	@Select("SELECT COUNT(*) FROM dcomment c JOIN dmember m ON c.mem_num=m.mem_num "
			+ "WHERE c.comment_num=#{comment_num}")
	public int selectRowCount(Map<String, Object> map);

	// 내가쓴 코멘트 목록
	@Select("SELECT * FROM (SELECT star, c.mem_num,  c.contents_type, c.contents_num, content FROM dcomment c "
			+ "LEFT OUTER JOIN dcontents_star s USING (star_num)) JOIN dmember_detail USING (mem_num) WHERE mem_num = #{mem_num}")
	public List<CommentVO> selectListByMem_num(int mem_num);

	// 가장 코멘트가 많이 달린 컨텐츠 (메인페이지에서 사용)
	@Select("SELECT COUNT(contents_num) count, contents_num  FROM dcomment WHERE contents_type=#{contents_type} GROUP BY contents_num ORDER BY count(contents_num) DESC")
	public List<CommentVO> getMostCommented(String contents_type);

	// 코멘트 좋아요 갯수
	@Select("SELECT COUNT(*) FROM dcomment_like WHERE comment_num = #{comment_num} GROUP BY comment_num")
	public Integer getCountLike(int comment_num);

	@Insert("INSERT INTO dcomment_like (commentlike_num, comment_num, mem_num) VALUES (dcomment_like_seq.nextval,#{comment_num},#{mem_num})")
	public void commentLike(CommentVO comment);

	@Delete("DELETE FROM dcomment_like WHERE comment_num =#{comment_num} AND mem_num=#{mem_num}")
	public void cancelCmtLike(CommentVO comment);

	@Select("SELECT COUNT(*) FROM dcomment_like WHERE comment_num=#{comment_num} AND mem_num=#{mem_num}")
	public int checkCmtLike(CommentVO comment);

	// 내가 좋아요한 코멘트 목록
	@Select("SELECT * FROM dcomment_like l JOIN dcomment c ON l.comment_num=c.comment_num WHERE l.mem_num=#{mem_num} ORDER BY c.comment_num DESC")
	public List<CommentLikeVO> selectListLikeByMem_num(int mem_num);
}
