package com.movie.movie.theater.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.movie.theater.dto.TheaterDTO;

@Repository("theaterDAO")
public class TheaterDAOImpl implements TheaterDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<TheaterDTO> showTheater() throws Exception {
		List<TheaterDTO> theaters = sqlSession.selectList("theater.theaters");
		return theaters;
	}

	@Override
	public List<String> getLocation() throws Exception {
		List<String> location = sqlSession.selectList("theater.location");
		return location;
	}

}
