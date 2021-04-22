package com.movie.movie.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketPeopleDAO {
	@Autowired
	private SqlSession sqlSession;
	public int ticketpeople() {
		int stats=sqlSession.selectOne("ticket.ticketpeople");
		return stats;
	}
	
}
