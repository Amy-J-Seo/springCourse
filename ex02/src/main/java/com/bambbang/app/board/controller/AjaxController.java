package com.bambbang.app.board.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bambbang.app.board.domain.BoardVO;

@RestController
public class AjaxController {

	@GetMapping("/ajax1")
	@ResponseBody
	public BoardVO test1(BoardVO vo) {
		//BoardVO vo = new BoardVO();
		vo.setContent("werewerwerwerw");
		//vo.setWriter("Foxy");
		System.out.println(vo.toString());
		return vo;
	}
	
	//put and delete need to be send as JSON 
	@PostMapping("/ajax2")
	@ResponseBody
	public BoardVO test2(@RequestBody BoardVO vo) {
		vo.setContent("Stupo is kiayawa");
		System.out.println(vo.toString());
		return vo;
	}
	
	
	
}
