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

import kr.spring.contents.dao.ContentsMapper;
import kr.spring.contents.service.ContentsService;
import kr.spring.contents.vo.LikeVO;
import kr.spring.contents.vo.StarVO;

@Controller
public class ContentsAjaxController {
	@Autowired
	private ContentsMapper contentsMapper;
	
	//별점 등록
	@RequestMapping("/contents/starRating.do")
	@ResponseBody
	public Map<String, String> starRating(@RequestParam int contents_num, HttpServletRequest request, HttpSession session, StarVO starVO) { //String value,String contents_num 뺐음

		Map<String, String> map = new HashMap<String, String>();
				
		//해당 컨텐츠 넘 있나 확인
		StarVO checkStar = contentsMapper.CheckStar(contents_num);
		
		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		}else {//로그인 된 경우
			if(checkStar==null) { //별점기록없으면 insert
				contentsMapper.insertStar(starVO);			
				map.put("result","success");	
			}else { //별점기록있으면 update
				contentsMapper.updateStar(starVO);
				map.put("result","success2");
			}		
		}
		return map;
	}
		
	//별점 취소
	@RequestMapping("/contents/resetRating.do")
	@ResponseBody
	public Map<String, String> resetRating(HttpServletRequest request, HttpSession session, StarVO starVO) { 
		Map<String, String> map = new HashMap<String, String>();
		
		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		}else {//로그인 된 경우
			contentsMapper.deleteStar(starVO);	
			map.put("result","success");			
		}
		return map;
	}

	// 보고싶어요 등록
	@RequestMapping("/contents/contentsLike.do")
	@ResponseBody
	public Map<String, String> contentsLike(HttpSession session, LikeVO like, @RequestParam int check) {

		Map<String, String> map = new HashMap<String, String>();

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {
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
