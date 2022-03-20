package kr.spring.contents.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.contents.vo.ContentsVO;
import kr.spring.contents.vo.CreditsVO;
import kr.spring.sort.SortByVote;
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

	@RequestMapping("/template/search.do")
	public ModelAndView process(@RequestParam int id, @RequestParam String keyword) {
		GetInfoUtil util = new GetInfoUtil();
		List<ContentsVO> movie = null;
		movie = util.getInfoList("movie");
		List<ContentsVO> movie_result = new ArrayList<ContentsVO>();
		for (int i = 0; i < movie.size(); i++) {
			if (movie.get(i).getTitle().contains(keyword) || movie.get(i).getOverview().contains(keyword)) {
				ContentsVO contents = new ContentsVO();
				contents = movie.get(i);
				movie_result.add(contents);
			}
		}
		List<ContentsVO> tv = null;
		movie = util.getInfoList("tv");
		List<ContentsVO> tv_result = new ArrayList<ContentsVO>();
		for (int i = 0; i < tv.size(); i++) {
			if (tv.get(i).getTitle().contains(keyword) || tv.get(i).getOverview().contains(keyword)) {
				ContentsVO contents = new ContentsVO();
				contents = tv.get(i);
				tv_result.add(contents);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contentsSearch");
		mav.addObject("movie", movie);
		mav.addObject("tv", tv);
		return mav;
	}

}
