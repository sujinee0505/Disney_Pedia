package kr.spring.comment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.spring.comment.service.CommentService;
import kr.spring.comment.vo.CommentVO;

@Controller
public class CommentController {
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
	private CommentService commentService;
	
	//자바빈(vo)초기화
	@ModelAttribute
	public CommentVO initCommand() {
		return new CommentVO();
	}
}
