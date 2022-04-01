package kr.spring.contents.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.comment.service.CommentService;
import kr.spring.comment.vo.CommentVO;
import kr.spring.contents.service.ContentsService;
import kr.spring.contents.vo.LikeVO;
import kr.spring.contents.vo.StarVO;

@Controller
public class ContentsAjaxController {

	@Autowired
	private ContentsService contentsService;

	@Autowired
	private CommentService commentService;

	// 별점 등록,수정
	@RequestMapping("/contents/starRating.do")
	@ResponseBody
	public Map<String, String> starRating(HttpSession session, StarVO starVO) {

		Map<String, String> map = new HashMap<String, String>();

		// 해당 컨텐츠 평가기록 있나 확인
		int checkStar = contentsService.CheckStar(starVO);

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			if (checkStar == 1) { // 별점기록있으면 update
				contentsService.updateStar(starVO);
				map.put("result", "success2");
			} else { // 별점기록없으면 insert
				contentsService.insertStar(starVO);
				map.put("result", "success");
			}
		}
		return map;
	}

	// 별점 취소
	@RequestMapping("/contents/resetRating.do")
	@ResponseBody
	public Map<String, String> resetRating(HttpSession session, StarVO starVO) {
		Map<String, String> map = new HashMap<String, String>();

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			contentsService.deleteStar(starVO);
			map.put("result", "success");
		}
		return map;
	}

	// 보고싶어요
	@RequestMapping("/contents/contentsLike.do")
	@ResponseBody
	public Map<String, String> contentsLike(HttpSession session, LikeVO like, @RequestParam int check) {

		Map<String, String> map = new HashMap<String, String>();

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {
			map.put("result", "logout");
		} else {
			if (check == 1) { // 이미 보고싶어요 등록이 되어 있는 상태일 경우
				contentsService.cancelLike(like); // 한번 더 누르면 취소
				map.put("result", "cancel");
			} else {
				contentsService.contentsLike(like);
				map.put("result", "success");
			}
		}
		return map;
	}

	// 코멘트 좋아요
	@RequestMapping("/contents/cmtLike.do")
	@ResponseBody
	public Map<String, Object> commentLike(HttpSession session, CommentVO comment, int checkCmtLike) {

		Map<String, Object> map = new HashMap<String, Object>();
		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {
			map.put("result", "logout");
		} else {
			if (checkCmtLike == 1) { // 이미 코멘트에 좋아요를 누른 상태일 경우
				commentService.cancelCmtLike(comment); // 한번 더 누르면 취소
				map.put("result", "cancel");
			} else {
				commentService.commentLike(comment);
				map.put("result", "success");
			}
			Integer countLike = commentService.getCountLike(comment.getComment_num());
			if (countLike == null ) {
				countLike = 0;
			}
			map.put("countLike", countLike);
		}
		return map;
	}
}
