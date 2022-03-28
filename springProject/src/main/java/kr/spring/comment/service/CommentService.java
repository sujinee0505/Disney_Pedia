package kr.spring.comment.service;

import java.util.List;
import java.util.Map;

import kr.spring.comment.vo.CommentVO;

public interface CommentService {
	public List<CommentVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insetComent(CommentVO coment);
	public CommentVO selectComent(Integer coment_num);
	public void updateComent(CommentVO coment);
	public void deleteComent(Integer coment_num);
}
