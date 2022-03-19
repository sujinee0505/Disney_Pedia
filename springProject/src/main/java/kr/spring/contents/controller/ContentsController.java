package kr.spring.contents.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.contents.vo.ContentsVO;
import kr.spring.util.GetInfoUtil;

@Controller
public class ContentsController {
	@RequestMapping("/contents/detail.do")
	public ModelAndView process(@RequestParam int id) {
		ContentsVO contents = new ContentsVO();
		GetInfoUtil util = new GetInfoUtil();
		contents = util.getInfoDetail("movie", id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contentsDetail");
		mav.addObject("contents", contents);
		return mav;
	}
	
	
}
