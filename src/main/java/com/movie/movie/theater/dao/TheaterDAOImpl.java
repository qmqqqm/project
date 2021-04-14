package com.movie.movie.theater.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TotalSangygDTO;

@Repository("theaterDAO")
public class TheaterDAOImpl implements TheaterDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<TheaterDTO> showTheater() throws Exception {
		List<TheaterDTO> theaters = sqlSession.selectList("theaters.theater");
		return theaters;
	}

	@Override
	public List<String> getLocation() throws Exception {
		List<String> location = sqlSession.selectList("theaters.location");
		return location;
	}

	//영화관 상세
	@Override
	public TotalSangygDTO getTotal(int theater_id) throws Exception {
		System.out.println("dao에서"+theater_id);
		TotalSangygDTO total = sqlSession.selectOne("theaters.totalSangyg", theater_id); 
		System.out.println(total);
		return total;
	}

}
