package kr.spring.contents.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.contents.dao.ContentsMapper;
import kr.spring.contents.vo.LikeVO;
import kr.spring.contents.vo.StarVO;

@Service
public class ContentsServiceImpl implements ContentsService {

	@Autowired
	private ContentsMapper contentsMapper;

	//별점
	@Override
	public void insertStar(StarVO star) {
		contentsMapper.insertStar(star);
	}	

	@Override
	public StarVO CheckStar(int contents_num) {		
		return contentsMapper.CheckStar(contents_num);
	}

	@Override
	public void updateStar(StarVO star) {
		contentsMapper.updateStar(star);		
	}

	@Override
	public void deleteStar(StarVO star) {
		contentsMapper.deleteStar(star);		
	}

	//보고싶어요
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

	@Override
	public List<LikeVO> getMostLike(String contents_type) {
		return contentsMapper.getMostLike(contents_type);
	}





}
