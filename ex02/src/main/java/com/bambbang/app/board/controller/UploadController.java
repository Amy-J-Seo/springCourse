package com.bambbang.app.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bambbang.app.board.domain.BoardAttachVO;
import com.bambbang.app.board.domain.BoardVO;

import lombok.extern.java.Log;

@Log
@Controller
public class UploadController {
	
	@PostMapping("/uploadFormAction")
	//업로드 폼에서 인풋에서 타입이 파일이기 때문에 멀티파트파일로 주고 그 네임을 찾아서 여기 업로드파일 변수에 담아줌
	public void uploadFormAction(MultipartFile[] uploadFile) throws IllegalStateException, IOException {
		for(int i=0; i<uploadFile.length; i++) {
			MultipartFile uFile = uploadFile[i];
			//파일이 있으면 트랜스퍼하기
			if(!uFile.isEmpty() && uFile.getSize()>0) {
				String filename = uFile.getOriginalFilename(); //사용자가 업로드한 파일명
				//파일 자체도 보안을 걸기 위해 파일이름 바꾸기도 한다. 원래 파일명과 서버에 저장된 파일이름을 따로 관리
				String saveName = System.currentTimeMillis()+""; //이거를 팀별로 상의해서 지정해 주면 된다.
				File file =new File("c:/upload", saveName);
				uFile.transferTo(file);
				log.info(filename);
				log.info(uFile.getSize()+""); //toString 이랑 똑같은거래 +""하면
				//uFile.transferTo(new File("c:/upload", filename));
			}
		}
	}
	
	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	//업로드 폼에서 인풋에서 타입이 파일이기 때문에 멀티파트파일로 주고 그 네임을 찾아서 여기 업로드파일 변수에 담아줌
	public List<BoardAttachVO> uploadAjaxAction(MultipartFile[] uploadFile, BoardVO vo) throws IllegalStateException, IOException {
		List<BoardAttachVO> list = new ArrayList<BoardAttachVO>();
		String path = "c:/upload";

		for (int i = 0; i < uploadFile.length; i++) {
			MultipartFile uFile = uploadFile[i];
			// 파일이 있으면 트랜스퍼하기
			if (!uFile.isEmpty() && uFile.getSize() > 0) {
				String filename = uFile.getOriginalFilename(); // 사용자가 업로드한 파일명

				// 파일 자체도 보안을 걸기 위해 파일이름 바꾸기도 한다. 원래 파일명과 서버에 저장된 파일이름을 따로 관리
				// String saveName = System.currentTimeMillis()+""; //이거를 팀별로 상의해서 지정해 주면 된다.
				// File file =new File("c:/upload", saveName);
				UUID uuid = UUID.randomUUID();
				File file = new File(path, uuid + filename);
				uFile.transferTo(file);

				BoardAttachVO attachVo = new BoardAttachVO(); // attachVO list안에 파일정보 저장하기 위해 만듦
				attachVo.setFileName(filename);
				attachVo.setUuid(uuid.toString());
				attachVo.setUploadPath(path);
				list.add(attachVo);
			}
		}
		return list;
	}
	
	
	@GetMapping("page2")
	//교재 364 페이지
	public ResponseEntity<BoardVO> page2(@RequestParam int h){
		ResponseEntity<BoardVO> result = null;
		if(h<10) {
			result = ResponseEntity.status(HttpStatus.NOT_FOUND).body(new BoardVO());
		}
		else {
			result = ResponseEntity.status(HttpStatus.OK).body(new BoardVO());
		}
		
		return result;
	}
	
	
	@GetMapping("page1")
	public void page1(HttpServletResponse response) throws IOException {
		//String mimetype = "application/x-msdownload";
		//response.setContentType(mimetype);//마임타입이면 다운로드가 된다.
		response.setContentType("text/html; charset=UTF-8"); //한글인코딩
		PrintWriter out = response.getWriter();
				out.println("<html>");
				out.println("<body>");
				out.println("<div><h1>test한글 넣어보쟈</h1></div>");
				out.println("</body>");
				out.println("</html>");
	}
	
	
}
