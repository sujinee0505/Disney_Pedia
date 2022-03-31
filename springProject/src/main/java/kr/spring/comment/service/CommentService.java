package kr.spring.comment.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.comment.vo.CommentLikeVO;
import kr.spring.comment.vo.CommentVO;

public interface CommentService {
	//[코멘트]
	//작업완료
	public void insertComment(CommentVO comment);
	public int checkComment(CommentVO comment);
	public CommentVO getComment(CommentVO comment);
	//작업중
	public void updateComment(CommentVO comment);
	public void deleteComment(CommentVO comment);
	//작업아직
	public List<CommentVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public CommentVO selectComment(Integer comment_num);

	//내가쓴 코멘트 목록
	public List<CommentVO> selectListByMem_num(int mem_num);
	
	// 수진
	public List<CommentVO> getMostCommented(String contents_type);
	
	//[코멘트 좋아요]
	public List<CommentLikeVO> selectListLike(Map<String,Object> map);
	public int selectRowCountLike(Map<String,Object> map);
	public CommentLikeVO selectLike(Integer commentlike_num);
	public void insertLike(CommentVO comment);
	public void deleteLike(Integer commentlike_num);
	//내가 좋아요한 코멘트 목록
	public List<CommentLikeVO> selectListLikeByMem_num(int mem_num);
}
