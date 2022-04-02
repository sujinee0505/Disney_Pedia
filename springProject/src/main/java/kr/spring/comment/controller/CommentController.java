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
import kr.spring.comment.vo.CommentReplyVO;
import kr.spring.comment.vo.CommentVO;
import kr.spring.contents.service.ContentsService;
import kr.spring.contents.vo.ContentsVO;
import kr.spring.contents.vo.StarVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.sort.SortByDate;
import kr.spring.util.GetInfoUtil;
import kr.spring.util.PagingUtil;

@Controller
public class CommentController {
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

	@Autowired
	private CommentService commentService;

	@Autowired
	private ContentsService contentsService;

	@Autowired
	private MemberService memberService;

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
	public Map<String, String> commentSubmit(CommentVO commentVO, HttpSession session, int star_num) {

		Map<String, String> map = new HashMap<String, String>();
		Map<String, Object> insert_map = new HashMap<String, Object>();

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			// CommentVO에 회원 번호 셋팅
			commentVO.setMem_num(user_num); // 코멘트 작성
			insert_map.put("commentVO",commentVO);
			System.out.println(commentVO.getContent());
			insert_map.put("star_num",star_num);
			commentService.insertComment(insert_map);
			map.put("result", "success");
		}
		return map;
	}

	// =====코멘트 수정=====
	// 코멘트 수정 폼 호출
	@GetMapping("/contents/commentUpdate.do")
	public String commentUpdate() {
		return "commentUpdate";
	}

	// 코멘트 ajax 수정
	@RequestMapping("/contents/commentUpdate.do")
	@ResponseBody
	public Map<String, String> commentUpdate(CommentVO commentVO, HttpSession session) {

		Map<String, String> map = new HashMap<String, String>();

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			// 업데이트
			commentService.updateComment(commentVO);
			map.put("result", "success");
		}
		return map;
	}

	// 코멘트 ajax 삭제
	@RequestMapping("/contents/commentDelete.do")
	@ResponseBody
	public Map<String, String> commentDelete(CommentVO commentVO, HttpSession session) {

		Map<String, String> map = new HashMap<String, String>();

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			// 삭제
			commentService.deleteComment(commentVO);
			map.put("result", "success");
		}
		return map;
	}

	// 내가 쓴 코멘트 목록
	@RequestMapping("/member/myComment.do")
	public ModelAndView myComment(int mem_num) {
		List<CommentVO> commentList = new ArrayList<CommentVO>();
		commentList = commentService.selectListByMem_num(mem_num);
		GetInfoUtil util = new GetInfoUtil();
		List<ContentsVO> contentsList = new ArrayList<ContentsVO>();
		for (int i = 0; i < commentList.size(); i++) {
			ContentsVO contents = new ContentsVO();
			contents = util.getInfoDetail(commentList.get(i).getContents_type(), commentList.get(i).getContents_num());
			contentsList.add(contents);
			commentList.get(i).setCountReply(commentService.getCountReply(commentList.get(i).getComment_num())); // 각각의
																													// 코멘트에
																													// 달린
																													// 댓글
																													// 갯수를
																													// 출력하기
																													// 위함
			Integer countLike = commentService.getCountLike(commentList.get(i).getComment_num()); // 코멘트 좋아요 갯수
			if (countLike != null) {
				commentList.get(i).setCountLike(countLike); // 각각의 코멘트의 좋아요 갯수
			}
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("myComment");
		mav.addObject("commentList", commentList);
		mav.addObject("contentsList", contentsList);
		return mav;
	}

	// 내가 좋아요 한 코멘트 목록
	@RequestMapping("/member/likeComment.do")
	public ModelAndView likeComment(int mem_num) {
		GetInfoUtil util = new GetInfoUtil();
		List<CommentVO> cmtLikeList = commentService.selectListLikeByMem_num(mem_num); // 내가 좋아요 누른 코멘트 정보를 불러옴
		List<MemberVO> member_list = new ArrayList<MemberVO>(); // 코멘트 작성자의 name과 photo 등을 저장할 List
		List<ContentsVO> contents_list = new ArrayList<ContentsVO>(); // 내가 좋아요 누른 코멘트들의 컨텐츠의 title, poster_path등을 저장할
																		// List

		for (int i = 0; i < cmtLikeList.size(); i++) {
			MemberVO member = new MemberVO();
			member = memberService.selectMember(cmtLikeList.get(i).getComment_num()); // 불러온 코멘트 정보 중 코멘트 작성자 회원 번호를
																						// 이용해서 회원 상세 정보를 불러옴
			member_list.add(member); // 결과 값이 여러개일 수 있으니 List에 저장
			ContentsVO contents = new ContentsVO(); // 불러온 코멘트 정보 중 contents_type과 contents_num을 이용해서 컨텐츠 상세 정보를 불러옴
			contents = util.getInfoDetail(cmtLikeList.get(i).getContents_type(), cmtLikeList.get(i).getContents_num()); // 역시나
																														// 결과
																														// 값이
																														// 여러개일
																														// 수
																														// 있으니
																														// List에
																														// 저장
			contents_list.add(contents);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("likeComment");
		mav.addObject("member_list", member_list);
		mav.addObject("contents_list", contents_list);
		return mav;
	}

	@RequestMapping("/contents/cmtDetail.do")
	public ModelAndView selectComment(HttpSession session, CommentVO commentVO) {
		CommentVO comment = commentService.selectComment(commentVO.getComment_num());
		MemberVO member = memberService.selectMember(commentVO.getComment_num());
		GetInfoUtil util = new GetInfoUtil();
		ContentsVO contents = util.getInfoDetail(commentVO.getContents_type(), commentVO.getContents_num());
		Integer countLike = commentService.getCountLike(comment.getComment_num());
		Integer countReply = commentService.getCountReply(comment.getComment_num());
		if (countLike == null) {
			countLike = 0;
		}
		ModelAndView mav = new ModelAndView();
		Integer mem_num = (Integer) session.getAttribute("user_num");
		if (mem_num != null) {
			CommentVO comment_user = new CommentVO();
			comment_user.setComment_num(comment.getComment_num());
			comment_user.setMem_num(mem_num);
			int checkCmtLike = commentService.checkCmtLike(comment_user);
			mav.addObject("checkCmtLike", checkCmtLike);
		} else {
			mem_num = 0;
			int checkCmtLike = 0;
			mav.addObject("checkCmtLike", checkCmtLike);
		}

		mav.setViewName("commentDetail");
		mav.addObject("comment", comment);
		mav.addObject("contents", contents);
		mav.addObject("countLike", countLike);
		mav.addObject("countReply", countReply);
		mav.addObject("user_num", mem_num);
		mav.addObject("member", member);
		return mav;
	}

	// 코멘트 등록 폼 호출
	@GetMapping("/contents/replyWrite.do")
	public String replyForm(HttpServletRequest request) {
		return "replyWrite";
	}

	// 코멘트 댓글 작성
	@RequestMapping("/contents/replyWrite.do")
	@ResponseBody
	public Map<String, Object> replySubmit(CommentReplyVO reply, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			reply.setMem_num(user_num);
			// 코멘트 작성
			Integer countReply = commentService.getCountLike(reply.getComment_num());
			if (countReply == null) {
				countReply = 0;
			}
			map.put("countReply", countReply);
			commentService.insertReply(reply);
			map.put("result", "success");
		}
		return map;
	}

	// 코멘트 댓글 목록
	@RequestMapping("/contents/listReply.do")
	@ResponseBody
	public Map<String, Object> listReply(int comment_num, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		List<CommentReplyVO> reply = commentService.selectListReply(comment_num);
		map.put("reply", reply);

		return map;
	}

	// 코멘트 댓글 수정
	@RequestMapping("/contents/replyUpdate.do")
	@ResponseBody
	public Map<String, String> replyUpdate(CommentReplyVO reply, HttpSession session) {

		Map<String, String> map = new HashMap<String, String>();
		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {
			map.put("result", "logout");
		} else {
			commentService.updateReply(reply);
			map.put("result", "success");
		}
		return map;
	}

	// 코멘트 댓글 삭제
	@RequestMapping("/contents/replyDelete.do")
	@ResponseBody
	public Map<String, String> replyDelete(HttpSession session, int reply_num) {

		Map<String, String> map = new HashMap<String, String>();

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {
			map.put("result", "logout");
		} else {
			commentService.deleteReply(reply_num);
			map.put("result", "success");
		}
		return map;
	}
}
