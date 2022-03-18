package kr.spring.chat.service;

import java.util.List;
import java.util.Map;

import kr.spring.chat.vo.ChatBoardVO;

public interface ChatBoardService {
	public List<ChatBoardVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object>map);
	public void insertBoard(ChatBoardVO board);
	public ChatBoardVO selectBoard(Integer board_num);
	public void updateHit(Integer board_num);
	public void updateBoard(ChatBoardVO board);
	public void deleteBoard(Integer board_num);
	public void deleteFile(Integer board_num);
}
