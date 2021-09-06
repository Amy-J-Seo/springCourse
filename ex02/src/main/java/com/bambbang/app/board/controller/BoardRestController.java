package com.bambbang.app.board.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bambbang.app.board.domain.BoardVO;

@Controller
public class BoardRestController {
	
	@RequestMapping("test1")
	@ResponseBody
	public Map<String, Object> test1(@RequestParam String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		if(id.equals("admin"))
			map.put("result", true);
			else {
			map.put("result", false);
			
		}
		return map;
	}
	
	@PostMapping(	value="test2",
					produces = { MediaType.APPLICATION_JSON_VALUE,
									MediaType.APPLICATION_XML_VALUE})
	//pathVariable test?id=kim -> test/kim
	@ResponseBody
	public BoardVO test2(BoardVO vo) {
		vo.setBno(1000);
		vo.setContent("ddd");
		vo.setRegDate(new Date());
		return vo;
	}
}
