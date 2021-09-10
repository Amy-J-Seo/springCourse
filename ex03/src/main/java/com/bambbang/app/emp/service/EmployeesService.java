package com.bambbang.app.emp.service;

import java.util.List;

import com.bambbang.app.emp.domain.EmployeesVO;

public interface EmployeesService {
	//직원전체 조회
			public List<EmployeesVO> getEmpList();
			
			//한 직원 조회
			public EmployeesVO read(EmployeesVO vo);
			
			//직원입력
			public int insert(EmployeesVO vo);
			
			//직원 수정
			public int update(EmployeesVO vo);
			//직원 삭제
			public int delete(EmployeesVO vo);
			
}
