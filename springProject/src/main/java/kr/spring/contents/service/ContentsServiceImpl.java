package kr.spring.contents.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.contents.dao.ContentsMapper;
import kr.spring.contents.vo.LikeVO;
import kr.spring.contents.vo.StarVO;

@Service
public class ContentsServiceImpl implements ContentsService {

	@Autowired
	private ContentsMapper contentsMapper;

	@Override
	public void insertStar(StarVO star) {
		contentsMapper.insertStar(star);

	}

	@Override
	public void likeContents(LikeVO like) {
		contentsMapper.contentsLike(like);
	}

	/*
	 * @Override public void updateStar(Integer star_num) { // TODO Auto-generated
	 * method stub
	 * 
	 * }
	 * 
	 * @Override public void deleteStar(Integer star_num) { // TODO Auto-generated
	 * method stub
	 * 
	 * }
	 */
}
