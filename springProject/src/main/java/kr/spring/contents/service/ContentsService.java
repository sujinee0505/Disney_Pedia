package kr.spring.contents.service;

import kr.spring.function.vo.LikeVO;
import kr.spring.function.vo.StarVO;

public interface ContentsService {
	public void insertStar(StarVO star);

	/*
	 * public void updateStar(Integer star_num); public void deleteStar(Integer
	 * star_num);
	 */
	public void likeContents(LikeVO like);

	public int checkLike(LikeVO like);

	public void cancelLike(LikeVO like);
}
