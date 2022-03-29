package kr.spring.chat.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.chat.service.ChatBoardService;
import kr.spring.chat.vo.ChatBoardReplyVO;

@Controller
public class ChatBoardAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(ChatBoardAjaxController.class);
																//log대상 지정
	@Autowired
	private ChatBoardService chatboardService;
	//[댓글 등록]
		@RequestMapping("/board/writeReply.do")
		@ResponseBody //AJAX생성 
		//chatboardReplyVO에 데이터 받고/ HttpSession으로 로그인여부확인/ HttpServletRequest으로 ip주소 구하기
		public Map<String, String>wrtieReply(ChatBoardReplyVO chatboardReplyVO,
											HttpSession session,
											HttpServletRequest request){
			
			logger.info("<<댓글 등록>> : " + chatboardReplyVO);
			
			Map<String,String> map = new HashMap<String,String>();
			
			//로그인 여부 체크
			Integer user_num = (Integer)session.getAttribute("user_num");
			if(user_num==null) { //로그인 X
				map.put("result","logout");
			}else { //로그인 O (폼에서 전송안된 회원번호,ip)
				//회원번호 등록
				chatboardReplyVO.setMem_num(user_num);
				//ip등록X
				//chatboardReplyVO.setRe_ip(request.getRemoteAddr());
				//댓글 등록
				chatboardService.insertReply(chatboardReplyVO);
				//메세지를 만든다
				map.put("result","success");
			}
			return map;
		}

}
