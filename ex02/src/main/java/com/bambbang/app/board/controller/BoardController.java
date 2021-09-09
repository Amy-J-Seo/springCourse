package com.bambbang.app.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bambbang.app.board.domain.BoardAttachVO;
import com.bambbang.app.board.domain.BoardVO;
import com.bambbang.app.board.domain.Criteria;
import com.bambbang.app.board.domain.PageVO;
import com.bambbang.app.board.mapper.BoardAttachMapper;
import com.bambbang.app.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
//@SessionAttributes("cri")
public class BoardController {

	@Autowired
	BoardService boardService;
	@Autowired
	BoardAttachMapper attachMapper;
	// 전체조회
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

	// 단건조회(수정페이지)??
	@GetMapping("/get") // @ModelAttribute("cri") 이름을 cri로 바꿔주고 싶을때 저거 쓴대
	public void get(Model model, BoardVO board, @ModelAttribute("cri") Criteria cri) { // bno 파라미터를 넘겨줌.-> 커맨드 객체
		model.addAttribute("board", boardService.read(board));
	}

	@GetMapping("/editForm")
	public void editForm(Model model, BoardVO board, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board", boardService.read(board));
	}

	// 수정(처리)->수정 후 글 디테일 페이지로
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		System.out.println("cri============= modify" + cri);
		int result = boardService.update(board);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		// return "redirect:/board/list?pageNum=&amount="; 이렇게 하기 번거로우니까....rttr에 담아서
		// 한번에 보내기
		return "redirect:/board/list";
	}

	// 등록페이지
	@GetMapping("/registerForm")
	public void registerForm() {
	}

	// 등록처리 -> 글 디테일 페이지로
	@PostMapping("/register")
	public String register(BoardVO vo, MultipartFile[] uploadFile, RedirectAttributes rttr)
			throws IllegalStateException, IOException {
		System.out.println("register vo check================="+vo);
		boardService.insert(vo);

		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/list"; // 파라미터 전달하고 싶을 때 redirectAttr사용
	}

	// 삭제처리
	@GetMapping("/remove")
	public String remove(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		int result = boardService.delete(board);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		System.out.println("remove______cri" + cri);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list";
	}

	// 피디에프 스프링 ajax 파일업로드 차트에서 10쪽
	@RequestMapping(value = "/download")
		public void cvplFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
				String uuid = (String) commandMap.get("uuid");
				
				//uuid로 첨부파일 검색 
				BoardAttachVO vo = new BoardAttachVO();
				vo =attachMapper.read(uuid);
				
				String fileName ="";
				
				if(vo !=null) {
					fileName=vo.getFileName();
				}

				File uFile = new File("c:/upload", uuid+fileName);
				long fSize = uFile.length();
			if (fSize > 0) {
				//마임타입이 여러가지가 있대...
				//그런데 고정되어 있고 우리가 골라서 써야 한다.
				String mimetype = "application/x-msdownload";
				response.setContentType(mimetype);
				//헤더 설정해주는 이 코드가 다운받을때 파일 이름 지정하는거...
				response.setHeader("Content-Disposition", 
						"attachment;filename=\"" + URLEncoder.encode(fileName, "utf-8") + "\"");
				//setDisposition(atchFileId, request, response);
				BufferedInputStream in = null;
				BufferedOutputStream out = null;
				try {
						in = new BufferedInputStream(new FileInputStream(uFile));
						//서버에 있느 파일을 인풋으로 열어서 아웃풋스트림 하면 다운로드 하는것임.
						out = new BufferedOutputStream(response.getOutputStream());
						//스프링에서 제공하는 파일카피유틸
						FileCopyUtils.copy(in, out);
						out.flush();
					} catch (IOException ex) {
						} finally { //다운 받고 나서 서버 파일 닫아주기
								in.close(); response.getOutputStream().flush(); response.getOutputStream().close();
						}
			} else { //파일이 없다면 메세지를 띄울 것임.
				response.setContentType("application/x-msdownload");
				PrintWriter printwriter = response.getWriter();
				printwriter.println("<html>");
				printwriter.println( "<h2>Could not get file name:<br>" + fileName + "</h2>");
				printwriter.println("<center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
				printwriter.println("&copy; webAccess");
				printwriter.println( "</html>");
				printwriter.flush();
				printwriter.close();
			}
		}

}
