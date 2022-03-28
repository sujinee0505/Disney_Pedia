package kr.spring.comment.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.spring.comment.dao.CommentMapper;
import kr.spring.comment.vo.CommentVO;

public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper commentMapper;

	@Override
	public List<CommentVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insetComent(CommentVO coment) {
		// TODO Auto-generated method stub

	}

	@Override
	public CommentVO selectComent(Integer coment_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateComent(CommentVO coment) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteComent(Integer coment_num) {
		// TODO Auto-generated method stub

	}

	// 수진
	@Override
	public List<CommentVO> getMostCommented(String contents_type) {
		return commentMapper.getMostCommented(contents_type);
	}

}
