package kr.spring.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.contents.service.ContentsService;
import kr.spring.contents.vo.ContentsVO;
import kr.spring.contents.vo.LikeVO;
import kr.spring.contents.vo.StarVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.AuthCheckException;
import kr.spring.util.GetInfoUtil;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private ContentsService contentsService;

	// 자바빈(VO) 초기화
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}

	// 회원 등록 폼 호출
	@GetMapping("/member/registerUser.do")
	public String form() {
		// 타일스 설정
		return "memberRegister";
	}

	// 회원 등록 처리(기존)
	/*
	 * @PostMapping("/member/registerUser.do") public String submit(@Valid MemberVO
	 * memberVO, BindingResult result) { logger.info("<<회원 가입>> : " + memberVO);
	 * 
	 * //유효성 체크 결과 오류가 있으면 폼 호출 if(result.hasErrors()) { return form(); }
	 * 
	 * //회원 가입 memberService.insertMember(memberVO);
	 * 
	 * return "redirect:/main/main.do"; }
	 */

	// 회원 등록 처리
	@PostMapping("/member/registerUser.do")
	public String submit(MemberVO memberVO) {
		logger.info("<<회원 가입>> : " + memberVO);

		// 회원 가입
		memberService.insertMember(memberVO);
		logger.info("<<회원 가입 성공>> : " + memberVO);
		// 가입성공시 메인호출
		return "redirect:/main/main.do";
	}

	// 로그인 폼 호출

	@GetMapping("/member/login.do")
	public String formLogin() {
		return "memberLogin";
	}

	// 로그인처리(일반폼태그버전) :
	/*
	 * 1) @Valid,BindingResult 제거 2) Model model 추가->유효성체크시 BindingResult 사용x Model에
	 * 메시지 저장 3) 유효성 체크 결과 오류가 있으면 폼 호출-> 사용x alert창으로 알려줌.(resultView.jsp)
	 */
	@PostMapping("/member/login.do")
	public String loginmodal(MemberVO memberVO, HttpSession session, HttpServletRequest request, Model model) {

		// 로그확인
		logger.info("<<회원 로그인>> : " + memberVO);

		// 로그인 체크(id,비밀번호 일치 여부 체크)
		try {
			MemberVO member = memberService.selectCheckMember(memberVO.getId());

			boolean check = false;

			if (member != null) {
				// 비밀번호 일치 여부 체크 //사용자가 입력한 비밀번호
				check = member.isCheckedPassword(memberVO.getPasswd());
			}
			if (check) {
				// 인증 성공, 로그인 처리
				session.setAttribute("user_num", member.getMem_num());
				session.setAttribute("user_id", member.getId());
				session.setAttribute("user_auth", member.getAuth());
				session.setAttribute("user_photo", member.getPhoto());

				// 로그확인
				logger.info("<<로그인성공>> : " + member);

				return "redirect:/main/main.do";
			}
			// 인증 실패
			throw new AuthCheckException();
		} catch (AuthCheckException e) {

			// 유효성체크-alert창을 통해 view에 표시할 메시지 설정
			model.addAttribute("message", "아이디 또는 비밀번호 불일치");
			model.addAttribute("url", request.getContextPath() + "/main/main.do");

			return "common/resultView";
		}

	}

	// 로그인처리(스프링폼태그버전)
	/*
	 * @PostMapping("/member/login.do") public String submitLogin(@Valid MemberVO
	 * memberVO, BindingResult result, HttpSession session) {
	 * logger.info("<<회원 로그인>> : " + memberVO);
	 * 
	 * //유효성 체크 결과 오류가 있으면 폼 호출 //id와 passwd 필드만 체크 if(result.hasFieldErrors("id")
	 * || result.hasFieldErrors("passwd")) { return formLogin(); }
	 * 
	 * //로그인 체크(id,비밀번호 일치 여부 체크) try { MemberVO member =
	 * memberService.selectCheckMember( memberVO.getId()); boolean check = false;
	 * 
	 * if(member!=null) { //비밀번호 일치 여부 체크 //사용자가 입력한 비밀번호 check =
	 * member.isCheckedPassword(memberVO.getPasswd()); } if(check) { //인증 성공, 로그인 처리
	 * session.setAttribute("user_num", member.getMem_num());
	 * session.setAttribute("user_id", member.getId());
	 * session.setAttribute("user_auth", member.getAuth());
	 * session.setAttribute("user_photo", member.getPhoto());
	 * 
	 * return "redirect:/main/main.do"; } //인증 실패 throw new AuthCheckException();
	 * }catch(AuthCheckException e) { //폼에서 보여질 메시지 생성
	 * result.reject("invalidIdOrPassword"); //인증 실패로 로그인 폼을 호출 return formLogin();
	 * } }
	 * 
	 */

	// 회원 로그아웃
	@RequestMapping("/member/logout.do")
	public String processLogout(HttpSession session) {
		// 로그아웃
		session.invalidate();

		return "redirect:/main/main.do";
	}

	// My페이지
	@RequestMapping("/member/myPage.do")
	public ModelAndView process(HttpSession session, Model model,
			@RequestParam(value = "user_num", defaultValue = "0") int user_num) {

		if (user_num == 0) {
			user_num = (Integer) session.getAttribute("user_num");
		}

		MemberVO member = memberService.selectMember(user_num);

		logger.info("<<회원 상세 정보>> : " + member);

		// 수진
		List<LikeVO> like = new ArrayList<LikeVO>();
		like = contentsService.getCountLike(user_num);

		List<StarVO> star = new ArrayList<StarVO>();
		star = contentsService.getCountStar(user_num);

		ModelAndView mav = new ModelAndView();

		mav.setViewName("memberView");
		mav.addObject("member", member);
		mav.addObject("like", like);
		mav.addObject("star", star);

		return mav;
	}

	// 수정폼
	@GetMapping("/member/update.do")
	public String formUpdate(HttpSession session, Model model) {
		Integer user_num = (Integer) session.getAttribute("user_num");

		MemberVO memberVO = memberService.selectMember(user_num);

		model.addAttribute("memberVO", memberVO);

		return "memberModify";
	}

	// 수정폼에서 전송된 데이터 처리
	@PostMapping("/member/update.do")
	public String submitUpdate(MemberVO memberVO, HttpSession session) {

		logger.info("<<회원 정보 수정>> : " + memberVO);

		Integer user_num = (Integer) session.getAttribute("user_num");
		memberVO.setMem_num(user_num);

		// 회원정보수정
		memberService.updateMember(memberVO);

		return "redirect:/member/myPage.do";
	}

	// 비밀번호 변경 폼
	@GetMapping("/member/changePassword.do")
	public String formChangePassword() {
		return "memberChangePassword";
	}

	// 비밀번호 변경 폼에서 전송된 데이터 처리
	@PostMapping("/member/changePassword.do")
	public String submitChangePassword(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {

		logger.info("<<비밀번호 변경 처리>> : " + memberVO);

		// 유효성 체크 결과 오류가 있으면 폼 호출
		if (result.hasFieldErrors("now_passwd") || result.hasFieldErrors("passwd")) {
			return formChangePassword();
		}

		Integer user_num = (Integer) session.getAttribute("user_num");
		memberVO.setMem_num(user_num);

		// 세션에 저장된 회원번호를 이용해서 DB에 회원정보를 MemberVO에 담아서 반환
		MemberVO db_member = memberService.selectMember(memberVO.getMem_num());
		// DB에서 읽어온 비밀번호 사용자가 입력한 비밀번호 -- 불일치
		if (!db_member.getPasswd().equals(memberVO.getNow_passwd())) {
			result.rejectValue("now_passwd", "invalidPassword");
			return formChangePassword();
		}

		// 비밀번호 변경
		memberService.updatePassword(memberVO);

		return "redirect:/member/myPage.do";
	}

	// 회원 탈퇴 폼
	@GetMapping("member/delete.do")
	public String formDelete() {
		return "memberDelete";
	}

	// 회원 탈퇴 폼에서 전송된 데이터 처리
	@PostMapping("/member/delete.do")
	public String submitDelete(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {

		logger.info("<<회원 탈퇴>> : " + memberVO);

		// 유효성 체크 결과 오류가 있으면 폼 호출
		if (result.hasFieldErrors("id") || result.hasFieldErrors("passwd")) {
			return formDelete();
		}

		Integer user_num = (Integer) session.getAttribute("user_num");
		memberVO.setMem_num(user_num);

		// 아이디와 비밀번호 일치 여부 체크
		try {
			// 세션에 저장된 회원번호를 이용해서 DB에 회원정보를 MemberVO에 담아서 반환
			MemberVO db_member = memberService.selectMember(memberVO.getMem_num());
			boolean check = false;

			if (db_member != null && memberVO.getId().equals(db_member.getId())) {
				// 비밀번호 일치 여부 체크 사용자가 입력한 비밀번호
				check = db_member.isCheckedPassword(memberVO.getPasswd());
			}
			if (check) {
				// 인증 성공, 회원정보 삭제
				memberService.deleteMember(memberVO.getMem_num());
				// 로그아웃
				session.invalidate();

				return "redirect:/main/main.do";
			}
			// 인증 실패
			throw new AuthCheckException();

		} catch (AuthCheckException e) {
			result.reject("invalidIdOrPassword");
			return formDelete();
		}
	}

	// 이미지 출력
	@RequestMapping("/member/photoView.do")
	public ModelAndView viewImage(HttpSession session, @RequestParam int user_num) {

		if (user_num == 0) {
			user_num = (Integer) session.getAttribute("user_num");
		}
		MemberVO memberVO = memberService.selectMember(user_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", memberVO.getPhoto());
		mav.addObject("filename", memberVO.getPhoto_name());
		return mav;
	}

	@GetMapping("/member/myContents.do")
	public ModelAndView myContents(HttpSession session, LikeVO like) {
		Integer mem_num = (Integer) session.getAttribute("user_num");
		like.setMem_num(mem_num);

		GetInfoUtil util = new GetInfoUtil();
		List<ContentsVO> likeList = new ArrayList<ContentsVO>();
		List<LikeVO> likeVO = contentsService.getLikeList(like);
		for (int i = 0; i < likeVO.size(); i++) {
			ContentsVO contents_like = new ContentsVO();
			contents_like = util.getInfoDetail(likeVO.get(i).getContents_type(), likeVO.get(i).getContents_num());
			likeList.add(contents_like);
		}
		List<ContentsVO> starList = new ArrayList<ContentsVO>();
		StarVO star = new StarVO();
		star.setMem_num(like.getMem_num());
		star.setContents_type(like.getContents_type());
		List<StarVO> starVO = contentsService.getStarList(star);
		for (int i = 0; i < starVO.size(); i++) {
			ContentsVO contents_star = new ContentsVO();
			contents_star = util.getInfoDetail(starVO.get(i).getContents_type(), starVO.get(i).getContents_num());
			contents_star.setStar(starVO.get(i).getStar());
			starList.add(contents_star);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("myContents");
		mav.addObject("likeList", likeList);
		mav.addObject("starList", starList);
		return mav;
	}
}
