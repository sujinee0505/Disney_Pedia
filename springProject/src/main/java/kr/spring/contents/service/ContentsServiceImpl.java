package kr.spring.contents.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.contents.dao.ContentsMapper;
import kr.spring.function.vo.LikeVO;
import kr.spring.function.vo.StarVO;

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

	@Override
	public int checkLike(LikeVO like) {
		return contentsMapper.checkLike(like);
	}

	@Override
	public void cancelLike(LikeVO like) {
		contentsMapper.cancelLike(like);
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
