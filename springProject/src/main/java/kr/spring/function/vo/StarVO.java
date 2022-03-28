package kr.spring.function.vo;

import kr.spring.contents.vo.ContentsVO;

public class StarVO {
	
	private int star_num; //별점id
	private int contents_num; //컨텐츠id
	private int mem_num; //회원번호
	private int star; //별점(0.5~5)
	private ContentsVO contents; //콘텐츠 id 받기위해->?
	
	public int getStar_num() {
		return star_num;
	}
	public void setStar_num(int star_num) {
		this.star_num = star_num;
	}
	public int getContents_num() {
		return contents_num;
	}
	public void setContents_num(int contents_num) {
		this.contents_num = contents_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public ContentsVO getContents() {
		return contents;
	}
	public void setContents(ContentsVO contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "StarVO [star_num=" + star_num + ", contents_num=" + contents_num + ", mem_num=" + mem_num + ", star="
				+ star + ", contents=" + contents + "]";
	}
	
	
	
}
