package kr.spring.chat.controller;

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
import org.springframework.web.servlet.ModelAndView;

import kr.spring.chat.service.ChatBoardService;
import kr.spring.chat.vo.ChatBoardVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;

@Controller
public class ChatBoardController {
	private static final Logger logger = LoggerFactory.getLogger(ChatBoardController.class);
		
	@Autowired
	private ChatBoardService chatBoardService;
	private MemberService memberService;
	
	//자바빈(VO)초기화
	@ModelAttribute
	public ChatBoardVO initCommand() {
		return new ChatBoardVO();
	}
	//**[글 등록]**
	//글 등록 폼
	@GetMapping("/chatboard/write.do")
	public String form() {
		return "chatBoardWrite";//tiles 설정(definition name)
	}
	
	//글 등록 폼에서 전송된 데이터 처리
	@PostMapping("/chatboard/write.do")
	public String submit(@Valid ChatBoardVO chatboardVO, BindingResult result, 
								HttpSession session, HttpServletRequest request,
								Model model) {
							
		logger.info("<<채팅게시판 글 저장>> : " + chatboardVO );
		//유효성 체크 
		//오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		//ChatBoardVO chatboardVO2 = chatBoardService.selectBoard(chatboardVO.getChatboard_num());
		
		//세션에서 회원번호를 읽어온다
		Integer user_num = (Integer)session.getAttribute("user_num");
		//글쓴 회원번호 셋팅
		chatboardVO.setMem_num(user_num);
		logger.info("<<memnum>> : " + chatboardVO );
		
		
		
		/*
		//회원이름 셋팅
		String user_name = (String)session.getAttribute("user_name");
		logger.info((String)session.getAttribute("user_name"));
		chatboardVO.setName(user_name);
		logger.info("<<name>> : " + chatboardVO );
		//회원사진 셋팅
		String user_photo = (String)session.getAttribute("user_photo");
		chatboardVO.setPhoto(user_photo);
		logger.info("<<photo>> : " + chatboardVO );
		*/
		
		/*
		MemberVO memberVO2 = memberService.selectMember(user_num);
		logger.info("<<회원 상세 정보>> : " + memberVO2);
		
		chatboardVO.setName(memberVO2.getName());
		logger.info("<<name>> : " + chatboardVO );
		*/
		
		//ip셋팅 -설정 안햇음 왠지 채팅 떄 필요할지도모르겟다
		
		//글쓰기
		chatBoardService.insertBoard(chatboardVO);
		
		return "redirect:/chatboard/list.do";
	}
	
	//**[글 목록]**
		//게시판 글 목록
		@RequestMapping("/chatboard/list.do")
		/*
		public ModelAndView process(
									@RequestParam(value="pageNum",defaultValue="1")
									 int currentPage,
									@RequestParam(value="keyfield",defaultValue="")
									 String keyfield,
									@RequestParam(value="keyword",defaultValue="")
									 String keyword ) {
			
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			//글의 총갯수 또는 검색된 글의 갯수		
			int count = boardService.selectRowCount(map);
			//페이지 처리
			PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,20,10,"list.do");
					
			map.put("start",page.getStartCount());
			map.put("end",page.getEndCount());
			
			List<BoardVO> list = null;
			if(count>0) {
				list = boardService.selectList(map);
			}
			
	 		ModelAndView mav = new ModelAndView();
	 		mav.setViewName("boardList");//tiles설정
	 		
	 		mav.addObject("count",count);
	 		mav.addObject("list", list);
	 		mav.addObject("pagingHtml", page.getPagingHtml());
	 		*/
		public ModelAndView process() {
			
			//타일스 설정
			ModelAndView mav = new ModelAndView();
	 		mav.setViewName("chatBoardList");//tiles설정(definition name)
	 		
			return mav;
		}
}
