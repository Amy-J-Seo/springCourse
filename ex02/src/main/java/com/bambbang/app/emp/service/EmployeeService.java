package com.bambbang.app.emp.service;

import java.util.List;

import com.bambbang.app.emp.domain.EmployeeVO;

public interface EmployeeService {
	//직원전체 조회
	public List<EmployeeVO> getList();
	//한 직원 조회
	public EmployeeVO read(EmployeeVO vo);
	//직원입력
	public int insert(EmployeeVO vo);
	//직원 수정
	public int update(EmployeeVO vo);
	//직원 삭제
	public int delete(EmployeeVO vo);
}
