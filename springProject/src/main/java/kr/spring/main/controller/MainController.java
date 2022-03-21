package kr.spring.main.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.contents.vo.ContentsVO;
import kr.spring.sort.SortByDate;
import kr.spring.sort.SortByVote;
import kr.spring.util.GetInfoUtil;

@Controller
public class MainController {

	@RequestMapping("/main/main.do")
	/*
	 * 별도로 페이지를 생성하지 않고 type의 value값에 따라 출력되는 페이지가 달라지게끔 설정 type의 기본 value값은 movie
	 * value값이 없는 메인페이지는 영화 목록이 보여지고 어떤 메뉴를 누르는지에 따라 출력되는 목록이 달라짐
	 */
	public ModelAndView main(@RequestParam(value = "type", defaultValue = "movie") String type) {

		GetInfoUtil util = new GetInfoUtil();

		// 임시로 사용할 List 생성
		List<ContentsVO> temp = null;
		// 메인에 출력할 컨텐츠 목록들 저장
		temp = util.getInfoList(type);

		// 평점순 목록을 출력할 경우 popularity가 100이상인 것들만 출력되게 설정
		List<ContentsVO> vote_average = new ArrayList<ContentsVO>();
		for (int i = 0; i < temp.size(); i++) {
			// popularity 조건 검사
			if (temp.get(i).getPopularity() >= 100) {
				// 조건에 해당하는 경우에만 새로운 vo에 따로 저장
				ContentsVO contents = new ContentsVO();
				contents = temp.get(i);
				// 루프를 돌며 List에 저장
				vote_average.add(contents);
			}
		}
		// List에 담긴 ContentsVO를 평점 내림차순으로 정렬
		Collections.sort(vote_average, new SortByVote());

		List<ContentsVO> release_date = null;
		release_date = util.getInfoList(type);
		// List에 담긴 ContentsVO를 날짜 내림차순으로 정렬
		Collections.sort(release_date, new SortByDate());

		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("vote_average", vote_average);
		mav.addObject("release_date", release_date);
		return mav;
	}
}
