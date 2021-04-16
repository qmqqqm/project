package com.movie.movie.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.movie.dto.TicketDTO;
@Repository
public class TicketDAO {
	@Autowired
	SqlSession sqlSession;
	public ArrayList ticketForm() {
		ArrayList movieList=(ArrayList) sqlSession.selectList("ticket.ticketForm");
		System.out.println(movieList);
		return movieList;
	}
	public Object theaters() {
		ArrayList theaters=(ArrayList)sqlSession.selectList("ticket.theaters");
		return theaters;
	}

}
