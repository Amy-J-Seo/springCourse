package com.bambbang.app.board.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	private long bno;			//게시글번호
	private String title;		//제목
	private String content;		//내용
	private String writer;		//작성자
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;		//작성일자
	@JsonIgnore
	private Date updateDate;	//수정일자
	private long replycnt;      //댓글수
	
	//게시글 하나에 들어가 있는 첨부파일 리스트
	private List<BoardAttachVO> attachList;
}
