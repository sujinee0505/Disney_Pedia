package kr.spring.main.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.contents.vo.ContentsVO;
import kr.spring.util.GetInfoUtil;
import kr.spring.util.ListComparator;

@Controller
public class MainController {

	@RequestMapping("/main/main.do")
	public ModelAndView main() {
		List<ContentsVO> list = null;
		GetInfoUtil util = new GetInfoUtil();
		list = util.getInfoList("movie");
		Collections.sort(list, new ListComparator());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("list", list);
		return mav;
	}
}
