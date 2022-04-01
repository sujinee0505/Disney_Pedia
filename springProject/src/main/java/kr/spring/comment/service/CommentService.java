package kr.spring.comment.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.comment.vo.CommentLikeVO;
import kr.spring.comment.vo.CommentVO;

public interface CommentService {
	// [코멘트]
	// 작업완료
	public void insertComment(CommentVO comment);

	public int checkComment(CommentVO comment);

	public CommentVO getComment(CommentVO comment);

	// 작업중
	public void updateComment(CommentVO comment);

	public void deleteComment(CommentVO comment);

	// 작업아직
	public List<CommentVO> selectList(CommentVO comment);

	public int selectRowCount(Map<String, Object> map);

	public CommentVO selectComment(int comment_num);

	// 내가쓴 코멘트 목록
	public List<CommentVO> selectListByMem_num(int mem_num);

	public List<CommentVO> getMostCommented(String contents_type);

	// 코멘트 좋아요
	public void commentLike(CommentVO comment);

	public void cancelCmtLike(CommentVO comment);

	public Integer getCountLike(int comment_num);

	public int checkCmtLike(CommentVO comment);

	// 내가 좋아요한 코멘트 목록
	public List<CommentLikeVO> selectListLikeByMem_num(int mem_num);
}
