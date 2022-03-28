package kr.spring.contents.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ContentsAjaxController {
	// 댓글 등록
	@RequestMapping("/contents/contentsLike.do")
	@ResponseBody
	public Map<String, String> writeReply(HttpSession session) {

		Map<String, String> map = new HashMap<String, String>();

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {
			
			map.put("result", "success");
		}
		return map;
	}
}
