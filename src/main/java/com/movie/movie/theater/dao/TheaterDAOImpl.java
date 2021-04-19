package com.movie.movie.theater.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.movie.theater.dto.MovieDTO;
import com.movie.movie.theater.dto.SangygDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TimesDTO;
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
	//상영시간표
	@Override
	public List<TimesDTO> getTimes(int theater_id, String day) throws Exception {
		System.out.println("getTimes dao");
		
		Map para = new HashMap();
		para.put("theater_id", theater_id);
		para.put("day", day);
		
		System.out.println(para);
		List<TimesDTO> times = sqlSession.selectList("theaters.times", para);
		System.out.println(times);
		return times;
	}

	@Override
	public List<MovieDTO> getMovie(List id_list) throws Exception {
		List<MovieDTO> movieList = new ArrayList<MovieDTO>();
		Iterator iter = id_list.iterator();
		while(iter.hasNext()) {
			int movie_id = (Integer)iter.next();
			movieList.add(sqlSession.selectOne("theaters.movieInform", movie_id));
		}
		return movieList;
	}

	@Override
	public List<SangygDTO> getSangyg(List sangygList, int theater_id) throws Exception {
		List<SangygDTO> sangygInform = new ArrayList<SangygDTO>();
		Iterator iter = sangygList.iterator();
		Map<String, Integer> imsi = new HashMap<String, Integer>();
		imsi.put("theater_id", theater_id);
		while(iter.hasNext()) {
			int sangyg_id = (Integer)iter.next();
			imsi.put("sangyg_id", sangyg_id);
			sangygInform.add(sqlSession.selectOne("theaters.sangygInform", imsi));
		}
		System.out.println(sangygInform);
		return sangygInform;
	}

}
