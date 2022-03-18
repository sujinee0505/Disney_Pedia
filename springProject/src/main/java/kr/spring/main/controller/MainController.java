package kr.spring.main.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.contents.vo.ContentsVO;
import kr.spring.sort.SortByDate;
import kr.spring.sort.SortByVote;
import kr.spring.util.GetInfoUtil;

@Controller
public class MainController {

	@RequestMapping("/main/main.do")
	public ModelAndView main() {
		GetInfoUtil util = new GetInfoUtil();

		List<ContentsVO> vote_average = null;
		vote_average = util.getInfoList("movie");
		Collections.sort(vote_average, new SortByVote());

		List<ContentsVO> release_date = null;
		release_date = util.getInfoList("movie");
		Collections.sort(release_date, new SortByDate());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("vote_average", vote_average);
		mav.addObject("release_date", release_date);
		return mav;
	}
}
