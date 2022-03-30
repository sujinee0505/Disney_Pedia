package kr.spring.comment.controller;

import java.util.HashMap; import java.util.List; import java.util.Map;

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
import kr.spring.contents.vo.StarVO;
import kr.spring.util.PagingUtil;


@Controller 
public class CommentController { 
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

	@Autowired
	private CommentService commentService;

	//자바빈(vo) 초기화
	@ModelAttribute 
	public CommentVO initCommand() { 
		return new CommentVO(); 
	}	
	
	//=====코멘트 등록=====	
	//코멘트 등록 폼 호출
	@GetMapping("/contents/commentWrite.do") 
	public String commentform(HttpServletRequest request) { 
		CommentVO comment = new CommentVO();
		return "commentWrite"; 
	}	
	//코멘트 ajax 등록
	@RequestMapping("/contents/commentWrite.do")	  
	@ResponseBody 
	public Map<String, String> commentSubmit(CommentVO commentVO, HttpSession session) {	  
		
		Map<String, String> map = new HashMap<String, String>();	
		
		Integer user_num = (Integer) session.getAttribute("user_num");	  
		if (user_num == null) {// 로그인이 되지 않은 경우 
			map.put("result", "logout"); 
		}else{//로그인 된 경우 
			//CommentVO에 회원 번호 셋팅
			commentVO.setMem_num(user_num); 
			//코멘트 작성 
			commentService.insertComment(commentVO);
			map.put("result","success"); 
		} 
		return map; 
	  }

	//=====코멘트 수정=====
	//코멘트 수정 폼 호출
	@GetMapping("/contents/commentUpdate.do")
	public String commentUpdate() {		
		return "commentUpdate";
	}

	//코멘트 ajax 수정
	@RequestMapping("/contents/commentUpdate.do")	  
	@ResponseBody 
	public Map<String, String> commentUpdate(CommentVO commentVO, HttpSession session) {	  
		
		Map<String, String> map = new HashMap<String, String>();	
		
		//해당 컨텐츠 코멘 기록 있나 확인
		int checkComment = commentService.checkComment(commentVO);
			
		Integer user_num = (Integer) session.getAttribute("user_num");	  
		if (user_num == null) {// 로그인이 되지 않은 경우 
			map.put("result", "logout"); 
		}else{//로그인 된 경우 
			if(checkComment==1) { //코멘트기록존재(해당회원,해당영화에 대한)
				//업데이트
			}
		} 
		return map; 
	  }	
	
	
	//내가 쓴 코멘트 목록
	@RequestMapping("/member/myComment.do") 
	public ModelAndView process(
		@RequestParam(value="pageNum", defaultValue = "1") int currentPage) {

	Map<String, Object> map = new HashMap<String, Object>(); 
	//코멘트의 총갯수 
	int count = commentService.selectRowCount(map);

	//페이지 처리 
	PagingUtil page = new PagingUtil(currentPage, count, 20, 10, "myComment.do");

	map.put("start",page.getStartCount());
	map.put("end", page.getEndCount());

	List<CommentVO> list = null; 
	if(count > 0) { 
		list = commentService.selectList(map);
	}

	ModelAndView mav = new ModelAndView(); 
	mav.setViewName("mycommentList");
	mav.addObject("count", count); 
	mav.addObject("list", list);
	mav.addObject("pagingHtml", page.getPagingHtml());

	return mav; 
	}

}
