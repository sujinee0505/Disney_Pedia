package kr.spring.comment.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.comment.dao.CommentMapper;
import kr.spring.comment.vo.CommentLikeVO;
import kr.spring.comment.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper commentMapper;
	
	//작업완료
	@Override
	public void insertComment(CommentVO comment) {
		commentMapper.insertComment(comment);
	}
	
	@Override
	public int checkComment(CommentVO comment) {		
		return commentMapper.checkComment(comment);
	}

	@Override
	public CommentVO getComment(CommentVO comment) {
		return commentMapper.getComment(comment);
	}

	//작업중
	@Override
	public void updateComment(CommentVO comment) {
		commentMapper.updateComment(comment);
	}

	@Override
	public void deleteComment(CommentVO comment) {
		commentMapper.deleteComment(comment);
	}

	
	//작업아직
	@Override
	public CommentVO selectComment(int comment_num) {
		return commentMapper.selectComment(comment_num);
	}


	@Override
	public List<CommentVO> selectList(CommentVO comment) {
		return commentMapper.selectList(comment);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return commentMapper.selectRowCount(map);
	}





	// 수진
	@Override
	public List<CommentVO> getMostCommented(String contents_type) {
		return commentMapper.getMostCommented(contents_type);
	}
	
	@Override
	public List<CommentVO> selectListByMem_num(int mem_num) {
		return commentMapper.selectListByMem_num(mem_num);
	}

	@Override
	public List<CommentLikeVO> selectListLike(Map<String, Object> map) {
		return commentMapper.selectListLike(map);
	}

	@Override
	public int selectRowCountLike(Map<String, Object> map) {
		return commentMapper.selectRowCountLike(map);
	}

	@Override
	public CommentLikeVO selectLike(Integer commentlike_num) {
		return commentMapper.selectLike(commentlike_num);
	}

	@Override
	public void insertLike(CommentVO comment) {
		commentMapper.insertLike(comment);
		
	}

	@Override
	public void deleteLike(Integer commentlike_num) {
		commentMapper.deleteLike(commentlike_num);		
	}

	@Override
	public List<CommentLikeVO> selectListLikeByMem_num(int mem_num) {
		return commentMapper.selectListLikeByMem_num(mem_num);
	}

}
