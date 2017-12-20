package com.coo.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coo.dao.BoardDAO;
import com.coo.domain.BoardVO;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardDAO dao;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET(BoardVO board, Model model) throws Exception{
		
		logger.info("register GET...");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception{
		
		logger.info("register POST...");
		logger.info(board.toString());
		
		dao.create(board);
		//브라우저까지는 전송되지만 uri에는 보이지 않는 숨겨진 형태로 전송!
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/board/listAll";
	}
	
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("show all list...");
		
		model.addAttribute("list", dao.listAll());
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void read( @RequestParam("bno") int bno, Model model) throws Exception{
		logger.info("show all veiw...");
		
		//model에 아무런 이름없이 데이터를 넣으면 자동으로 클래스의 이름을 소문자로 시작해서 사용. BoardVO => boardVO로 저장됨!
		model.addAttribute(dao.read(bno));
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removePOST( @RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception{
		
	
		dao.delete(bno);
		rttr.addFlashAttribute("msg","remove");
		
		return "redirect:/board/listAll";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int bno, Model model) throws Exception{
		
		model.addAttribute(dao.read(bno));
		
		logger.info("modify get....");

	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST( BoardVO board, RedirectAttributes rttr) throws Exception{
		
		dao.update(board);
		rttr.addFlashAttribute("msg","modify");
		
		logger.info("modify complete");
		
		return "redirect:/board/listAll";
	}
}
