package com.coo.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.coo.dao.BoardDAO;
import com.coo.domain.BoardVO;
import com.coo.domain.Criteria;
import com.coo.web.HomeController;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration
   (locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class BoardTest {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardTest.class);
	
	@Inject
	private BoardDAO dao;


	@Test
	public void create() throws Exception{
		
		BoardVO vo = new BoardVO();
		vo.setTitle("제목1");
		vo.setContent("내용1");
		vo.setId("아이디1");
		vo.setPw("비번1");
		dao.create(vo);	
	}
	
	@Test
	public void read() throws Exception{
		System.out.println(dao.read(1));
	}
	@Test
	public void readall() throws Exception{
		System.out.println("listall"+dao.listAll());
	}
	
	@Test
	public void page() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(4);
		cri.setPerPageNum(40);
		
		List<BoardVO> list = dao.listCriteria(cri);
		
		for(BoardVO boardVO : list){
			logger.info(boardVO.getBno() + ":" + boardVO.getTitle());
		}
				
	}
}
