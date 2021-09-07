package com.bambbang.app.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bambbang.app.board.domain.Criteria;
import com.bambbang.app.board.domain.ReplyVO;
import com.bambbang.app.board.service.ReplyService;

import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping("/replies/*")
public class ReplyRestController {
	@Autowired ReplyService replyService;
	
	//해당 게시글의 댓글만
	@GetMapping("/")
	public List<ReplyVO> getList(Criteria cri, @RequestParam Long bno){
	return replyService.getList(cri, bno);
	}
	
	//댓글 조회
	@GetMapping("/{rno}")
	public ReplyVO read(@PathVariable Long rno, ReplyVO vo){
		vo.setRno(rno);
	return replyService.read(vo);
	}
	//등록
	@PostMapping("/") //post: 파라미터 질의문자열(query string)->?id=100&pw=111&name=choi
	public ReplyVO insert(ReplyVO vo) {
		replyService.insert(vo);
		return vo;
	}
	
	//수정
	@PutMapping("/") //put: 파라미터가 JSON값으로 넘어옴 ->{id:100, pw:"111", name:"choi"}
	public ReplyVO update(@RequestBody ReplyVO vo) {
		replyService.update(vo);
		
		return replyService.read(vo);
	}
	//삭제
	@DeleteMapping("/{rno}") ////delete: 파라미터가 JSON값으로 넘어옴 ->{id:100, pw:"111", name:"choi"}
	public boolean delete(@PathVariable Long rno, ReplyVO vo) {
		vo.setRno(rno);
		int result = replyService.delete(vo);
		return result == 1 ? true: false;
	}
	
	//해당 게시글 댓글 조회
	/*
	 * @GetMapping(value="/pages/{bno}/{page}", produces = {
	 * MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE}) public
	 * ResponseEntity<List<ReplyVO>> getList(
	 * 
	 * @PathVariable("page") int page,
	 * 
	 * @PathVariable("bno") Long bno){
	 * 
	 * log.info("get list..................."); Criteria cri = new Criteria(page,
	 * 10);
	 * 
	 * log.info(cri.toString()); return new
	 * ResponseEntity<>(replyService.getList(cri, bno), HttpStatus.OK) ; }
	 */
	
	//댓글 등록
	/*
	 * @PostMapping(value = "/new", consumes ="application/json", produces =
	 * {MediaType.TEXT_PLAIN_VALUE}) public ResponseEntity<String>
	 * create(@RequestBody ReplyVO vo){ log.info("replyVO: "+ vo);
	 * 
	 * int insertCount = replyService.insert(vo);
	 * 
	 * log.info("reply insert count: " + insertCount);
	 * 
	 * return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) :
	 * new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); //삼항 연산자 처리 }
	 */
	
	
}
