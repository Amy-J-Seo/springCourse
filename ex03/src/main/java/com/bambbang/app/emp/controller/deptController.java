package com.bambbang.app.emp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bambbang.app.emp.domain.DepartmentsVO;
import com.bambbang.app.emp.domain.LocationsVO;
import com.bambbang.app.emp.mapper.LocationsMapper;
import com.bambbang.app.emp.service.DepartmentsService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/dept/*")
public class deptController {

	@Autowired DepartmentsService departmentsService;
	@Autowired LocationsMapper locationsService;
	
	//locations list 검색
	@GetMapping("/dept/locSearch")
	@ResponseBody
	public List<LocationsVO> locSearch(){
		return locationsService.getLocList();
	}
	
	//부서관리페이지 
	@GetMapping("/")
	public String dept() {
		return "emp/dept";
	}
	// ajax 요청 목록
	
	@GetMapping("/deptList")
	@ResponseBody //ajax 사용 할 때 @Controller 이면 이게 꼭 있어야 한다.
	public List<DepartmentsVO> deptList(){
		return departmentsService.getDeptList();
	}
	// ajax 등록
	
	// ajax 수정
	
	// ajax 삭제
	
	
	
	
}
