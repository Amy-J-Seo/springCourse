package com.bambbang.app.board.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bambbang.app.board.domain.BoardVO;
import com.bambbang.app.board.domain.Criteria;
import com.bambbang.app.board.domain.PageVO;
import com.bambbang.app.board.service.BoardService;

import lombok.extern.java.Log;


@Log
@Controller
@RequestMapping("/board/*")
//@SessionAttributes("cri")
public class BoardController {
	
	@Autowired BoardService boardService;

	//전체조회
	/*
	 * @GetMapping("/list") public void list(Model model, Criteria cri) {
	 * model.addAttribute("list", boardService.getList(cri)); //total record ->
	 * sample 123 at the moment. model.addAttribute("pageMaker", new PageVO(cri,
	 * 123)); }
	 */
	
	  @GetMapping("/list")
	   public void list(Model model, @ModelAttribute("cri") Criteria cri) {
		  int total = boardService.getTotalCount(cri);
		  System.out.println("getList++++++++++++++++" + cri);
	      model.addAttribute("list", boardService.getList(cri));
	      model.addAttribute("pageMaker", new PageVO(cri, total));
	   }
	
	//단건조회(수정페이지)??
	@GetMapping("/get")   							//@ModelAttribute("cri") 이름을 cri로 바꿔주고 싶을때 저거 쓴대
	public void get(Model model, BoardVO board, @ModelAttribute("cri") Criteria cri) { //bno 파라미터를 넘겨줌.-> 커맨드 객체
		model.addAttribute("board", boardService.read(board));
	}
	
	@GetMapping("/editForm")
	public void editForm(Model model, BoardVO board, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board", boardService.read(board));
	}
	
	
	//수정(처리)->수정 후 글 디테일 페이지로
	@PostMapping("/modify")
	public String modify(BoardVO board
						, @ModelAttribute("cri") Criteria cri
						, RedirectAttributes rttr) {

		  System.out.println("cri============= modify" + cri);
		int result = boardService.update(board);
		if(result ==1 ) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		//return "redirect:/board/list?pageNum=&amount=";	이렇게 하기 번거로우니까....rttr에 담아서 한번에 보내기
		return "redirect:/board/list";			
	}
	
	//등록페이지
	@GetMapping("/registerForm")
	public void registerForm() {}
	
	//등록처리 -> 글 디테일 페이지로
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		boardService.insert(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";		//파라미터 전달하고 싶을 때 redirectAttr사용
	}
	
	//삭제처리
		@GetMapping("/remove")
		public String remove(BoardVO board
								, @ModelAttribute("cri") Criteria cri
								, RedirectAttributes rttr) {
			int result = boardService.delete(board);
			if(result ==1) {
				rttr.addFlashAttribute("result", "success");
			}
			System.out.println("remove______cri"+cri);
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			return "redirect:/board/list";
		}

}
