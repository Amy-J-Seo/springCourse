package com.bambbang.app.board.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bambbang.app.board.domain.BoardVO;
import com.bambbang.app.board.service.BoardService;

import lombok.extern.java.Log;


@Log
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired BoardService boardService;

	//전체조회
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", boardService.getList());
	}
	
	//단건조회(수정페이지)??
	@GetMapping("/get")
	public void get(Model model, BoardVO board) { //bno 파라미터를 넘겨줌.-> 커맨드 객체
		model.addAttribute("board", boardService.read(board));
	}
	
	@GetMapping("/editForm")
	public void editForm(Model model, BoardVO board) {
		model.addAttribute("board", boardService.read(board));
	}
	
	
	//수정(처리)->수정 후 글 디테일 페이지로
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		int result = boardService.update(board);
		if(result ==1 ) {
			rttr.addFlashAttribute("result", "success");
		}
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
		public String remove(BoardVO board, RedirectAttributes rttr) {
			int result = boardService.delete(board);
			if(result ==1) {
				rttr.addFlashAttribute("result", "success");
			}
			return "redirect:/board/list";
		}

}
