package kr.spring.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.chat.service.ChatBoardService;
import kr.spring.chat.service.ChattingService;
import kr.spring.chat.vo.ChatBoardVO;
import kr.spring.chat.vo.ChattingVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;

@Controller
public class ChattingController {
	private static final Logger logger = LoggerFactory.getLogger(ChattingController.class);
	// log대상 지정
	@Autowired
	private ChattingService chattingService;
	@Autowired
	private ChatBoardService chatboardService;
	@Autowired
	private MemberService memberService;

	@GetMapping("/chatboard/chatting.do")
	public ModelAndView process(@RequestParam int chatboard_num, @RequestParam int trans_num, HttpSession session) {

		ChatBoardVO chatBoard = new ChatBoardVO();
		chatBoard = chatboardService.selectBoard(chatboard_num); // 게시글 번호로 게시글 정보 불러오기

		MemberVO member = new MemberVO();
		member = memberService.selectMember(trans_num); // chatBoardView에서 받아온 trans_num(게시글 작성자의 회원 번호)을 통해 회원 정보 불러오기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chatting");
		mav.addObject("chatBoard", chatBoard);
		mav.addObject("member", member);
		mav.addObject("trans_num", trans_num);
		return mav;
	}

	@RequestMapping("/chatboard/getChatting.do")
	@ResponseBody									// chatting.jsp에서 ajax로 넘긴 chatboard_num 등이 알아서 데이터 바인딩 되어서 chattingVO에 저장돼있음
	public Map<String, Object> getChattingDetailCount(ChattingVO chattingVO, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		Integer mem_num = (Integer) session.getAttribute("user_num");
		if (mem_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			List<ChattingVO> getChatting = new ArrayList<ChattingVO>();
			getChatting = chattingService.getChattingDetail(chattingVO); // chatboard_num 등 chatting.jsp에서 받아온 값을 인자로 넣어서 sql문을 행하여 결과값을 List에 담아준다
			map.put("getChatting", getChatting);
			map.put("result", "success");
		}
		return map;
	}

	@RequestMapping("/chatboard/writeChat.do")
	@ResponseBody
	public Map<String, String> insertChat(ChattingVO chattingVO, HttpSession session) {

		Map<String, String> map = new HashMap<String, String>();

		Integer mem_num = (Integer) session.getAttribute("user_num");
		if (mem_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			chattingService.insertChat(chattingVO);
			map.put("result", "success");
		}
		return map;
	}

	@GetMapping("/chatboard/chattingList.do")
	public ModelAndView getChattingList(@RequestParam int chatboard_num) {
		ChatBoardVO chatboard = new ChatBoardVO();
		chatboard = chatboardService.selectBoard(chatboard_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chattingList");
		mav.addObject("chatboard", chatboard);
		return mav;
	}

	@RequestMapping("/chatboard/chattingList.do")
	@ResponseBody
	public Map<String, Object> getChattingList(ChattingVO chattingVO, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		Integer mem_num = (Integer) session.getAttribute("user_num");
		if (mem_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			chattingVO.setFrom_num(mem_num);
			List<ChattingVO> chattingList = new ArrayList<ChattingVO>();
			chattingList = chattingService.getChattingList(chattingVO);
			map.put("chattingList", chattingList);
			map.put("result", "success");
		}
		return map;
	}

	/*
	 * //[채팅 등록]
	 * 
	 * @RequestMapping("/chat/chatting.do")
	 * 
	 * @ResponseBody //AJAX생성 //chatboardReplyVO에 데이터 받고/ HttpSession으로 로그인여부확인/
	 * HttpServletRequest으로 ip주소 구하기 public Map<String, String>wrtieReply(ChattingVO
	 * chattingVO, HttpSession session, HttpServletRequest request,
	 * 
	 * @RequestParam int chatboard_num){ logger.info("<<채팅 등록1>> : " + chattingVO);
	 * logger.info("<<board_num>> : " + chatboard_num);
	 * 
	 * chatboardService.selectBoard(chatboard_num);
	 * 
	 * Map<String,String> map = new HashMap<String,String>();
	 * 
	 * //로그인 여부 체크 Integer user_num = (Integer)session.getAttribute("user_num");
	 * if(user_num==null) { //로그인 X map.put("result","logout");
	 * 
	 * }else { //로그인 O (폼에서 전송안된 회원번호,ip) //회원번호 (채팅보낸사람) 등록
	 * chattingVO.setFrom_num(user_num); //ip등록
	 * //boardReplyVO.setRe_ip(request.getRemoteAddr());
	 * 
	 * //chattingVO.setChatboard_num(request.);
	 * 
	 * //VO에 chatBoard_num같이 외래키 걸어놓은 것들은 조인안하고 햇던데 조인없이 어디서 가져오ㅏ야하는지? //그냥 다른vo
	 * import해서 가져오는건가? 그러면 조인안하고 해당 컬럼어케가져와..?
	 * 
	 * //댓글 등록 chattingService.insertChat(chattingVO); //메세지를 만든다
	 * map.put("result","success"); } return map; }
	 * 
	 * //[댓글 목록]
	 * 
	 * @RequestMapping("/board/listReply.do")
	 * 
	 * @ResponseBody //AJAX생성 public Map<String,Object> getList( //Map형태로 반환
	 * 
	 * @RequestParam(value="pageNum",defaultValue="1")int currentPage,
	 * 
	 * @RequestParam int board_num, HttpSession session){
	 * logger.info("<<목록 호출>> currentPage : " + currentPage);
	 * logger.info("<<목록 호출>> board_num : " + board_num);
	 * 
	 * Map<String,Object> map = new HashMap<String,Object>();
	 * map.put("board_num",board_num);
	 * 
	 * //총 글의 갯수 int count = boardService.selectRowCountReply(map);
	 * 
	 * //페이지 처리 (값만 만들어서 연산만 하기위해 활용) PagingUtil page = new PagingUtil(currentPage,
	 * count, rowCount, 10, null); map.put("start", page.getStartCount());
	 * map.put("end", page.getEndCount());
	 * 
	 * List<BoardReplyVO> list = null; if(count>0) { list =
	 * boardService.selectListReply(map); }else { //데이터가 없으면 비어있는 배열을 보낸다 list =
	 * Collections.emptyList(); }
	 * 
	 * Integer user_num = (Integer)session.getAttribute("user_num");//로그인 여부 체크
	 * 
	 * Map<String,Object> mapJson = new HashMap<String,Object>();
	 * mapJson.put("count", count); mapJson.put("rowCount", rowCount);
	 * mapJson.put("list", list); mapJson.put("user_num", user_num); //
	 * mapJson.put("user_num", (Integer)session.getAttribute("user_num"));
	 * 
	 * return mapJson; }
	 */

}
