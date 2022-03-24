package kr.spring.contents.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.contents.dao.StarMapper;
import kr.spring.contents.vo.StarVO;

@Service
public class StarServiceImpl implements StarService{
	
	@Autowired
	private StarMapper starMapper;

	@Override
	public void insertStar(StarVO star) {
		starMapper.insertStar(star);
		
	}

	/*
	@Override
	public void updateStar(Integer star_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteStar(Integer star_num) {
		// TODO Auto-generated method stub
		
	}
	*/
}
