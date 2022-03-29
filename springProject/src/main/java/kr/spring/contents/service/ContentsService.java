package kr.spring.contents.service;

import java.util.List;

import kr.spring.contents.vo.LikeVO;
import kr.spring.contents.vo.StarVO;

public interface ContentsService {
	public void insertStar(StarVO star);

	public void updateStar(StarVO star);
	
	public void deleteStar(StarVO star);
	
	public void likeContents(LikeVO like);

	public int checkLike(LikeVO like);

	public void cancelLike(LikeVO like);

	public List<LikeVO> getMostLike(String contents_type);
}
