package kr.spring.comment.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.comment.service.CommentService;
import kr.spring.comment.vo.CommentLikeVO;
import kr.spring.comment.vo.CommentVO;
import kr.spring.contents.vo.ContentsVO;
import kr.spring.contents.vo.StarVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.sort.SortByDate;
import kr.spring.util.GetInfoUtil;
import kr.spring.util.PagingUtil;

@Controller
public class CommentController {
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

	@Autowired
	private CommentService commentService;

	// 자바빈(vo) 초기화
	@ModelAttribute
	public CommentVO initCommand() {
		return new CommentVO();
	}

	// =====코멘트 등록=====
	// 코멘트 등록 폼 호출
	@GetMapping("/contents/commentWrite.do")
	public String commentform(HttpServletRequest request) {
		CommentVO comment = new CommentVO();
		return "commentWrite";
	}

	// 코멘트 ajax 등록
	@RequestMapping("/contents/commentWrite.do")
	@ResponseBody
	public Map<String, String> commentSubmit(CommentVO commentVO, HttpSession session) {

		Map<String, String> map = new HashMap<String, String>();

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
				// CommentVO에 회원 번호 셋팅
			commentVO.setMem_num(user_num);
			// 코멘트 작성
			commentService.insertComment(commentVO);
			map.put("result", "success");
		}
		return map;
	}

	// =====코멘트 수정=====(작업중)
	// 코멘트 수정 폼 호출(작업완료)
	@GetMapping("/contents/commentUpdate.do")
	public String commentUpdate() {
		return "commentUpdate";
	}

	// 코멘트 ajax 수정(작업중)
	@RequestMapping("/contents/commentUpdate.do")
	@ResponseBody
	public Map<String, String> commentUpdate(CommentVO commentVO, HttpSession session) {

		Map<String, String> map = new HashMap<String, String>();

		// 해당 컨텐츠 코멘 기록 있나 확인
		int checkComment = commentService.checkComment(commentVO);

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			if (checkComment == 1) { // 코멘트기록존재(해당회원,해당영화에 대한)
				// 업데이트
			}
		}
		return map;
	}

	// 내가 쓴 코멘트 목록
	@RequestMapping("/member/myComment.do")
	public ModelAndView myComment(HttpSession session) {
		Integer mem_num = (Integer) session.getAttribute("user_num");
		List<CommentVO> commentList = new ArrayList<CommentVO>();
		commentList = commentService.selectListByMem_num(mem_num);

		GetInfoUtil util = new GetInfoUtil();
		List<ContentsVO> contentsList = new ArrayList<ContentsVO>();
		for (int i = 0; i < commentList.size(); i++) {
			ContentsVO contents = new ContentsVO();
			contents = util.getInfoDetail(commentList.get(i).getContents_type(), commentList.get(i).getContents_num());
			contentsList.add(contents);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("myComment");
		mav.addObject("commentList", commentList);
		mav.addObject("contentsList", contentsList);
		return mav;
	}

}
