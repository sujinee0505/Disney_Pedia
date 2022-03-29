package kr.spring.chat.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.chat.service.ChatBoardService;
import kr.spring.chat.service.ChattingService;
import kr.spring.chat.vo.ChatBoardReplyVO;
import kr.spring.chat.vo.ChattingVO;
import kr.spring.util.PagingUtil;

@Controller
public class ChattingController {
	private static final Logger logger = LoggerFactory.getLogger(ChattingController.class);
																//log대상 지정
	@Autowired
	private ChattingService chattingService;
	private ChatBoardService chatboardService;
	
	//[채팅 등록]
		@RequestMapping("/chatting/chatting.do")
		@ResponseBody //AJAX생성 
		//chatboardReplyVO에 데이터 받고/ HttpSession으로 로그인여부확인/ HttpServletRequest으로 ip주소 구하기
		public Map<String, String>wrtieReply(ChattingVO chattingVO,
											HttpSession session,
											HttpServletRequest request,
											@RequestParam int chatboard_num){
			logger.info("<<채팅 등록1>> : " + chattingVO);
			logger.info("<<board_num>> : " + chatboard_num);
			
			chatboardService.selectBoard(chatboard_num);
			
			Map<String,String> map = new HashMap<String,String>();
			
			//로그인 여부 체크
			Integer user_num = (Integer)session.getAttribute("user_num");
			if(user_num==null) { //로그인 X
				map.put("result","logout");
				
			}else { //로그인 O (폼에서 전송안된 회원번호,ip)
				//회원번호 (채팅보낸사람) 등록
				chattingVO.setFrom_num(user_num);
				//ip등록
				//boardReplyVO.setRe_ip(request.getRemoteAddr());
				
				//chattingVO.setChatboard_num(request.);
				
				//VO에 chatBoard_num같이 외래키 걸어놓은 것들은 조인안하고 햇던데 조인없이 어디서 가져오ㅏ야하는지?
				//그냥 다른vo import해서 가져오는건가? 그러면 조인안하고 해당 컬럼어케가져와..?
				
				//댓글 등록
				chattingService.insertChat(chattingVO);
				//메세지를 만든다
				map.put("result","success");
			}
			return map;
		}
/*
	//[댓글 목록]
	@RequestMapping("/board/listReply.do")
	@ResponseBody //AJAX생성
	public Map<String,Object> getList( //Map형태로 반환
			@RequestParam(value="pageNum",defaultValue="1")int currentPage,
			@RequestParam int board_num,
			HttpSession session){
		logger.info("<<목록 호출>> currentPage : " + currentPage);
		logger.info("<<목록 호출>> board_num : " + board_num);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("board_num",board_num);
		
		//총 글의 갯수
		int count = boardService.selectRowCountReply(map);
		
		//페이지 처리 (값만 만들어서 연산만 하기위해 활용)
		PagingUtil page = new PagingUtil(currentPage, count, rowCount, 10, null);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<BoardReplyVO> list = null;
		if(count>0) {
			list = boardService.selectListReply(map);
		}else {
			//데이터가 없으면 비어있는 배열을 보낸다
			list = Collections.emptyList();
		}
		
		Integer user_num = (Integer)session.getAttribute("user_num");//로그인 여부 체크
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("count", count);
		mapJson.put("rowCount", rowCount);
		mapJson.put("list", list);
		mapJson.put("user_num", user_num);
//			mapJson.put("user_num", (Integer)session.getAttribute("user_num"));
		
		return mapJson;
	}
	
	*/
}

