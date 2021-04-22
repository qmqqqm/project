package com.movie.movie.theater.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.movie.theater.dto.TheaterDTO;

@Repository("adtheaterDAO")
public class AdTheaterDAOImpl implements AdTheaterDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	//영화관 목록 보여주기
	@Override
	public List<TheaterDTO> selectTheater() throws DataAccessException {
		List<TheaterDTO> theaterList = sqlSession.selectList("adTheater.selectTheaterList");
		return theaterList;
	}

	//영화관 지역 가져오기
	@Override
	public List<String> selectLocation() throws DataAccessException {
		List<String> locationList = sqlSession.selectList("adTheater.selectlocationList");
		return locationList;
	}
	
	//영화관 생성
	@Override
	public int createTheater(TheaterDTO theaterDTO) throws DataAccessException {
		int result = sqlSession.insert("adTheater.createTheater",theaterDTO);
		//insert가 된 record수를 return받는다
		//여기에서 실행된 insert문이 성공되면 1개의 record가 insert되므로
		//1을 리턴받는다
		//만약 0을 리턴받으면  insert fail을 의미한다
		System.out.println("createTheater()실행후 result ="+result);//확인용
		
		return result;
	}

	//영화관 삭제
	@Override
	public int deleteTheater(int theater_id) throws DataAccessException {
		System.out.println("dao진입");
		int result = sqlSession.update("adTheater.deleteTheater", theater_id);
		System.out.println("dao result" + result);
		return result;
	}
	

}
