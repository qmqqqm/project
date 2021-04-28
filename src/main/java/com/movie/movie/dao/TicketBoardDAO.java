package com.movie.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.movie.dto.TicketBoardDTO;
@Repository
public class TicketBoardDAO {
	@Autowired
	private SqlSession sqlSession;
	public List<TicketBoardDTO> ticketBoardList() {
		List<TicketBoardDTO> ticketList=sqlSession.selectList("ticketBoard.ticketBoardList");
		return ticketList;
	}
	public TicketBoardDTO ticketBoardDetail(String ticketBoard_id) {
		TicketBoardDTO ticketDetail=sqlSession.selectOne("ticketBoard.ticketBoardDetail",ticketBoard_id);
		return ticketDetail;
	}
	public void ticketBoardWrite(TicketBoardDTO ticketBoardDTO) {
		sqlSession.insert("ticketBoard.ticketBoardWrite",ticketBoardDTO);
		
	}
	public void ticketBoardMod(TicketBoardDTO ticketBoardDTO) {
		sqlSession.update("ticketBoard.ticketBoardMod",ticketBoardDTO);
		
	}
	public void ticketBoardDelete(int ticketBoard_id) {
		sqlSession.update("ticketBoard.ticketBoardDelete",ticketBoard_id);
		
	}

}
