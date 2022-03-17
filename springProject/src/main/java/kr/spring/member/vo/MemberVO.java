package kr.spring.member.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

public class MemberVO {
	private int mem_num;
	private String id;
	private int auth;
	@NotEmpty
	private String name;
	private String passwd;
}
