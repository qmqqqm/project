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
	
	//��ȭ�� ��� �����ֱ�
	@Override
	public List<TheaterDTO> selectTheater() throws DataAccessException {
		List<TheaterDTO> theaterList = sqlSession.selectList("adTheater.selectTheaterList");
		return theaterList;
	}

	//��ȭ�� ���� ��������
	@Override
	public List<String> selectLocation() throws DataAccessException {
		List<String> locationList = sqlSession.selectList("adTheater.selectlocationList");
		return locationList;
	}
	
	//��ȭ�� ����
	@Override
	public int createTheater(TheaterDTO theaterDTO) throws DataAccessException {
		int result = sqlSession.insert("adTheater.createTheater",theaterDTO);
		//insert�� �� record���� return�޴´�
		//���⿡�� ����� insert���� �����Ǹ� 1���� record�� insert�ǹǷ�
		//1�� ���Ϲ޴´�
		//���� 0�� ���Ϲ�����  insert fail�� �ǹ��Ѵ�
		System.out.println("createTheater()������ result ="+result);//Ȯ�ο�
		
		return result;
	}

	//��ȭ�� ����
	@Override
	public int deleteTheater(int theater_id) throws DataAccessException {
		System.out.println("dao����");
		int result = sqlSession.update("adTheater.deleteTheater", theater_id);
		System.out.println("dao result" + result);
		return result;
	}
	

}
