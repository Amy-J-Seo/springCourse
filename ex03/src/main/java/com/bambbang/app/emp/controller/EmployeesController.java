package com.bambbang.app.emp.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bambbang.app.emp.domain.EmployeesVO;
import com.bambbang.app.emp.service.DepartmentsService;
import com.bambbang.app.emp.service.EmployeesService;
import com.bambbang.app.emp.service.JobsService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/emp/*")
public class EmployeesController {
	
	@Autowired EmployeesService employeeService;
	@Autowired JobsService jobsService;
	@Autowired DepartmentsService departmentService;
	
	//전체사원리스트 검색
	@GetMapping("/list")
	public void getList(Model model){
		model.addAttribute("list", employeeService.getEmpList());
	}
	
	//사원검색
	@GetMapping("/empSearch")
	public String empSearch(Model model, EmployeesVO vo){
		//model.addAttribute("empList", employeeService.read(vo));
		model.addAttribute("empList", employeeService.getEmpList());
		return "emp/empSearch";
	}
	
	@RequestMapping("/ajaxEmpSearch")
	@ResponseBody
	public EmployeesVO ajaxEmpSearch(EmployeesVO vo) {
		return employeeService.read(vo);
	}
	
	@RequestMapping("/ajaxEmpEmailSearch")
	@ResponseBody
	public EmployeesVO ajaxEmpEmailSearch(EmployeesVO vo) {
		return employeeService.read(vo);
	}
	
	@GetMapping("/get")
	public void get(Model model, EmployeesVO vo ) {
		model.addAttribute("member", employeeService.read(vo));
	}
	
	@ModelAttribute("opt")
	public Map<String, Object> opt(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jobs", jobsService.getJobList());
		map.put("depts", departmentService.getDeptList());
		
		return map;
	}
	
	//등록 폼
	@RequestMapping("/registerForm")
	public void registerForm(Model model, EmployeesVO vo ) {
		model.addAttribute("emp", employeeService.read(vo));
	}
	
	//등록처리
	@PostMapping("/register")
	public String register(EmployeesVO vo, RedirectAttributes rttr){
		log.info("==============================="+vo.toString());
		employeeService.insert(vo);
		rttr.addFlashAttribute("result", vo.getEmployeeId());
		return "redirect:/emp/list";
	}
	
	//수정폼
	@RequestMapping("/updateForm")
	public void updateForm(Model model, EmployeesVO vo ) {
		model.addAttribute("emp", employeeService.read(vo));
	}
	
}
