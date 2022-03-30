package kr.spring.contents.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.contents.vo.LikeVO;
import kr.spring.contents.vo.StarVO;

public interface ContentsMapper {
	@Insert("INSERT INTO dcontents_star (star_num,star,mem_num,contents_num,contents_type) "
			+ "VALUES (dcontents_star_seq.nextval, #{star},#{mem_num}, #{contents_num},#{contents_type})")
	public void insertStar(StarVO star);

	@Select("SELECT star_num,star,mem_num,contents_num,contents_type FROM dcontents_star WHERE contents_num=#{contents_num}")
	public StarVO CheckStar(int contents_num);

	@Update("UPDATE dcontents_star SET star=#{star} WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND mem_num=#{mem_num}")
	public void updateStar(StarVO star);

	@Delete("DELETE FROM dcontents_star WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND mem_num=#{mem_num}")
	public void deleteStar(StarVO star);

	@Insert("INSERT INTO dcontents_like (clike_num, contents_num, contents_type, mem_num) VALUES (dcontents_like_seq.nextval,#{contents_num},#{contents_type},#{mem_num})")
	public void contentsLike(LikeVO like);

	@Select("SELECT COUNT(*) FROM dcontents_like WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND mem_num=#{mem_num} ")
	public int checkLike(LikeVO like);

	@Delete("DELETE FROM dcontents_like WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND mem_num=#{mem_num}")
	public void cancelLike(LikeVO like);

	@Select("SELECT COUNT(contents_num) count, contents_num  FROM dcontents_like WHERE contents_type=#{contents_type} GROUP BY contents_num ORDER BY count(contents_num) DESC")
	public List<LikeVO> getMostLike(String contents_type);

	@Select("SELECT * FROM dcontents_like WHERE mem_num = #{mem_num} AND contents_type = #{contents_type}")
	public List<LikeVO> getLikeList(LikeVO like);
}
