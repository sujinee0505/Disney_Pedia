package kr.spring.contents.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.contents.dao.ContentsMapper;
import kr.spring.contents.vo.LikeVO;

@Controller
public class ContentsAjaxController {
	@Autowired
	private ContentsMapper contentsMapper;

	// 보고싶어요 등록
	@RequestMapping("/contents/contentsLike.do")
	@ResponseBody
	public Map<String, String> contentsLike(HttpSession session, LikeVO like) {

		Map<String, String> map = new HashMap<String, String>();

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {
			int check = contentsMapper.checkLike(like);
			if (check == 1) {
				contentsMapper.cancelLike(like);
				map.put("check", "checked");
				map.put("result", "cancel");
			} else {
				contentsMapper.contentsLike(like);
				map.put("check", "unChecked");
				map.put("result", "success");
			}
		}

		return map;
	}
}