package com.bambbang.app.emp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bambbang.app.emp.domain.EmployeeVO;
import com.bambbang.app.emp.service.EmployeeService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/emp/*")
public class EmployeeController {

	@Autowired EmployeeService employeeService;
	
	//전체조회
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", employeeService.getList());
	}
	//단건조회(수정페이지)
	@GetMapping("/get")
	public void get(Model model, EmployeeVO vo) {
		model.addAttribute("member", employeeService.read(vo));
	}
	//edit form
	@GetMapping("/modify")
	public void modify(Model model, EmployeeVO vo) {
		model.addAttribute("member", employeeService.read(vo));
	}
	
	//수정(처리) -> 수정후 디테일 페이지
	@PostMapping("/modify")
	public String modify(EmployeeVO vo, RedirectAttributes rttr) {
		int n = employeeService.update(vo);
		if(n==1) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/emp/list";
		
	}
	//등록페이지
	@GetMapping("/registerForm")
	public void registerForm() {}
	
	//등록처리->글 디테일 페이지로
	@PostMapping("/register")
	public String register(EmployeeVO vo, RedirectAttributes rttr) {
		employeeService.insert(vo);
		
		rttr.addFlashAttribute("result", vo.getEmployeeId());
		return "redirect:/emp/list";
	}
	//삭제
	@GetMapping("/remove")
	public String remove(EmployeeVO vo, RedirectAttributes rttr) {
		int n = employeeService.delete(vo);
		if(n ==1) {
			rttr.addFlashAttribute("result", "success");			
		}
		return "redirect:/emp/list";
	}
}
