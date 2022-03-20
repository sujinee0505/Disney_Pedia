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
												// 컨텐츠 타입(movie/tv), 컨텐츠 id를 인자로 받음
	public ModelAndView process(@RequestParam String type, @RequestParam int id) {
		// 컨텐츠 상세 정보를 담을 vo 객체 생성
		ContentsVO contents = new ContentsVO();
		// 갤러리 이미지를 담을 vo 객체 생성
		List<String> images = new ArrayList<String>();
		// 배우 정보들을 담을 vo타입의 List 객체 생성
		List<CreditsVO> cast = new ArrayList<CreditsVO>();
		// 감독 정보들을 담을 vo타입의 List 객체 생성
		List<CreditsVO> crew = new ArrayList<CreditsVO>();

		// GetInfoUtil안의 여러 메서드 사용을 위한 객체 생성
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
