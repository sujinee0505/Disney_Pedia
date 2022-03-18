package kr.spring.contents.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.contents.vo.ContentsVO;
import kr.spring.util.GetInfoUtil;
import kr.spring.util.StringUtil;

@Controller
public class ContentsController {
	@RequestMapping("/contents/detail.do")
	public ModelAndView process() {
		List<ContentsVO> list = null;
		GetInfoUtil util = new GetInfoUtil();
		list = util.getInfoList("movie");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contentsDetail");
		mav.addObject("list", list);
		return mav;
	}
}
