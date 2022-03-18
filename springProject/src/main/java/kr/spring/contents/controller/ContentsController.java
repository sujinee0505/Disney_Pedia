package kr.spring.contents.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.contents.vo.ContentsVO;
import kr.spring.util.GetInfoUtil;

@Controller
public class ContentsController {
	@RequestMapping("/contents/detail.do")
	public ModelAndView process() {
		List<ContentsVO> contents = null;
		GetInfoUtil util = new GetInfoUtil();
		contents = util.getInfoList("movie");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contentsDetail");
		mav.addObject("contents", contents);
		return mav;
	}
}
