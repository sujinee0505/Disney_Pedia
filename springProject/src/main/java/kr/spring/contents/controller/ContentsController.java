package kr.spring.contents.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.comment.service.CommentService;
import kr.spring.comment.vo.CommentVO;
import kr.spring.contents.service.CalendarService;
import kr.spring.contents.service.ContentsService;
import kr.spring.contents.vo.CalendarVO;
import kr.spring.contents.vo.ContentsVO;
import kr.spring.contents.vo.CreditsVO;
import kr.spring.contents.vo.LikeVO;
import kr.spring.contents.vo.StarVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.sort.SortByDate;
import kr.spring.util.GetInfoUtil;

@Controller
public class ContentsController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private ContentsService contentsService;

	@Autowired
	private CalendarService calendarService;

	@Autowired
	private CommentService commentService;

	@RequestMapping("/contents/detail.do")
	// 컨텐츠 타입(movie/tv), 컨텐츠 id를 인자로 받음
	public ModelAndView process(@RequestParam String contents_type, @RequestParam int contents_num,
			HttpSession session) {
		GetInfoUtil util = new GetInfoUtil();
		ContentsVO contents = util.getInfoDetail(contents_type, contents_num);
		List<String> images = util.getImages(contents_type, contents_num);
		List<CreditsVO> cast = util.getCredits(contents_type, contents_num, "cast");
		List<CreditsVO> crew = util.getCredits(contents_type, contents_num, "crew");
		List<ContentsVO> reco = new ArrayList<ContentsVO>();

		// 임시로 사용할 List 생성
		List<ContentsVO> temp = new ArrayList<ContentsVO>();
		// 일단 모든 컨텐츠를 불러와서 저장
		temp = util.getInfoList(contents_type);

		for (int i = 0; i < temp.size(); i++) {
			List<Integer> list1 = new ArrayList<>(temp.get(i).getGenres()); // 모든 컨텐츠들의 장르를 for문을 돌면서 계속 바꿔주면서 넣어줌
			List<Integer> list2 = new ArrayList<>(contents.getGenres()); // 상세 페이지에 출력할 컨텐츠의 장르

			/* 즉, 하나의 컨텐츠의 장르와 여러개의 컨텐츠의 장르를 루프를 통해 매번 서로 비교하는것 */

			// 등록되어 있는 장르가 1개일 경우
			if (list2.size() == 1) {
				list1.retainAll(list2);
				if (list1.size() == 1) {
					ContentsVO vo = new ContentsVO();
					vo = temp.get(i);
					reco.add(vo);
				}
				// 등록되어 있는 장르가 2개일 경우
			} else if (list2.size() == 2) {
				list1.retainAll(list2);
				if (list1.size() == 2) {
					ContentsVO vo = new ContentsVO();
					vo = temp.get(i);
					reco.add(vo);
				}
			} else {
				list1.retainAll(list2);
				// 적어도 겹치는 장르가 세개 이상인 경우만 출력
				if (list1.size() >= 3) {
					ContentsVO vo = new ContentsVO();
					vo = temp.get(i);
					reco.add(vo);
				}
			}
		}
		ModelAndView mav = new ModelAndView();

		Integer user_num = (Integer) session.getAttribute("user_num");

		// CommentVO
		CommentVO comment = new CommentVO();
		comment.setContents_num(contents_num);
		comment.setContents_type(contents_type);
		List<CommentVO> commetList = commentService.selectList(comment);
		mav.addObject("commetList", commetList);
		List<MemberVO> cmt_memberList = new ArrayList<MemberVO>();
		for (int i = 0; i < commetList.size(); i++) {
			MemberVO cmt_member = new MemberVO();
			cmt_member = memberService.selectMember(commetList.get(i).getMem_num());
			cmt_memberList.add(cmt_member);
			commetList.get(i).setCountReply(commentService.getCountReply(commetList.get(i).getComment_num()));
		}
		mav.addObject("cmt_memberList", cmt_memberList);
		if (user_num != null) {
			// star
			StarVO star = new StarVO();
			star.setContents_num(contents_num);
			star.setContents_type(contents_type);
			star.setMem_num(user_num);
			StarVO starVO = contentsService.getStar(star);
			mav.addObject("starVO", starVO);

			comment.setMem_num(user_num);
			for (int i = 0; i < commetList.size(); i++) {
				Integer countLike = commentService.getCountLike(commetList.get(i).getComment_num()); // 코멘트 좋아요 갯수
				if (countLike != null) {
					commetList.get(i).setCountLike(countLike);
				}
				comment.setComment_num(commetList.get(i).getComment_num());
				int checkCmtLike = commentService.checkCmtLike(comment);
				commetList.get(i).setCheckCmtLike(checkCmtLike);
			}
			mav.addObject("commetList", commetList);
			CommentVO getComment = commentService.getComment(comment);
			int checkComment = commentService.checkComment(comment);
			mav.addObject("getComment", getComment);
			mav.addObject("checkComment", checkComment);

			LikeVO like = new LikeVO();
			like.setContents_num(contents_num);
			like.setContents_type(contents_type);
			like.setMem_num(user_num);
			int check = contentsService.checkLike(like); // 보고싶어요 등록 여부 확인
			mav.addObject("check", check); // 1 → 등록 되어 있음 0 → 등록 되어 있지 않음

			CalendarVO calendar = new CalendarVO();
			calendar.setContents_num(contents_num);
			calendar.setContents_type(contents_type);
			calendar.setMem_num(user_num);
			String dateCheck = calendarService.checkDate(calendar); // 캘린더 등록 여부 확인

			if (dateCheck != null) {
				mav.addObject("dateCheck", dateCheck); // 캘린더에 등록이 되어 있을 경우 날짜를 전달
			} else {
				mav.addObject("dateCheck", "noData"); // 캘린더에 등록이 되어 있지 않을 경우 noData라고 전달
			}

		} else if (user_num == null) { // 로그인 안돼있는 상태에서 디테일 페이지를 열람하면 오류가 발생하길래 임의의 값 전달
			mav.addObject("user_num", 0);
			mav.addObject("check", 0);
		}

		mav.setViewName("contentsDetail");
		mav.addObject("contents", contents); // 컨텐츠 상세 정보
		mav.addObject("images", images); // 컨텐츠 갤러리 이미지
		mav.addObject("cast", cast); // 컨텐츠 배우
		mav.addObject("crew", crew); // 컨텐츠 제작진
		mav.addObject("reco", reco); // 추천 컨텐츠
		return mav;
	}

	// 검색 결과 목록 출력
	@RequestMapping("/contents/search.do")
	public ModelAndView process(@RequestParam String keyword,
			@RequestParam(value = "category", defaultValue = "contents") String category) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("contentsSearch");

		if (category.equals("contents") || category == null) {
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
			mav.addObject("search_result", search_result);

			// 검색 대상이 user일 경우
		} else if (category.equals("users")) {
			List<MemberVO> user_list = new ArrayList<MemberVO>();
			String name = keyword;
			user_list = memberService.searchUsers(name);
			mav.addObject("user_list", user_list);
		}
		return mav;
	}

}
