package kr.spring.contents.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.contents.vo.ContentsVO;
import kr.spring.contents.vo.CreditsVO;
import kr.spring.util.GetInfoUtil;

@Controller
public class ContentsController {
	@RequestMapping("/contents/detail.do")
	public ModelAndView process(@RequestParam(value = "type", defaultValue = "movie") String type,
			@RequestParam int id) {
		ContentsVO contents = new ContentsVO();
		List<String> images = new ArrayList<String>();
		List<CreditsVO> cast = new ArrayList<CreditsVO>();
		List<CreditsVO> crew = new ArrayList<CreditsVO>();
		GetInfoUtil util = new GetInfoUtil();
		contents = util.getInfoDetail(type, id);
		images = util.getImages(type, id);
		cast = util.getCredits(type, id, "cast");
		crew = util.getCredits(type, id, "crew");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("contentsDetail");
		mav.addObject("contents", contents);
		mav.addObject("images", images);
		mav.addObject("cast", cast);
		mav.addObject("crew", crew);
		return mav;
	}

}
