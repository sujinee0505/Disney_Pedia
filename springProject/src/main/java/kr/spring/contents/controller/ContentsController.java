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
import kr.spring.sort.SortByDate;
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

	// 검색 결과 목록 출력
	@RequestMapping("/contents/search.do")
	public ModelAndView process(@RequestParam String keyword) {
		GetInfoUtil util = new GetInfoUtil();

		// 영화에 해당하는 검색 결과와 시리즈에 해당하는 검색 결과를 각각 추출하여 별도의 새로운 List객체에 담기 위한 List객체 생성
		List<ContentsVO> search_result = new ArrayList<ContentsVO>();

		// 영화 목록을 저장할 List객체 생성
		List<ContentsVO> movie = null;
		// 전체 영화 목록을 List에 저장
		movie = util.getInfoList("movie");
		for (int i = 0; i < movie.size(); i++) {
			// 전체 영화 목록 중 제목과 줄거리에 keyword가 포함되는 vo객체만 따로 추출
			if (movie.get(i).getTitle().contains(keyword) || movie.get(i).getOverview().contains(keyword)) {
				// 저장을 위한 새로운 ContentsVO생성
				ContentsVO contents = new ContentsVO();
				// 조건에 해당하는 경우에만 vo에 저장
				contents = movie.get(i);
				// 루프를 돌면서 List에 추가해준다
				search_result.add(contents);
			}
		}

		List<ContentsVO> tv = null;
		tv = util.getInfoList("tv");
		for (int i = 0; i < tv.size(); i++) {
			if (tv.get(i).getTitle().contains(keyword) || tv.get(i).getOverview().contains(keyword)) {
				ContentsVO contents = new ContentsVO();
				contents = tv.get(i);
				search_result.add(contents);
			}
		}

		// 위의 과정을 통해 생성된 List를 공개날짜순으로 다시 정렬
		Collections.sort(search_result, new SortByDate());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contentsSearch");
		mav.addObject("search_result", search_result);
		return mav;
	}

}
