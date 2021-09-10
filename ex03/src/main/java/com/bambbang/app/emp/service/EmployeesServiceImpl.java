package com.bambbang.app.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bambbang.app.emp.domain.EmployeesVO;
import com.bambbang.app.emp.mapper.EmployeesMapper;

@Service
public class EmployeesServiceImpl implements EmployeesService {

	@Autowired EmployeesMapper employeesMapper;
	
	@Override
	public List<EmployeesVO> getEmpList() {
		return employeesMapper.getEmpList();
	}

	@Override
	public EmployeesVO read(EmployeesVO vo) {
		return employeesMapper.read(vo);
	}

	@Override
	public int insert(EmployeesVO vo) {
		return employeesMapper.insert(vo);
	}

	@Override
	public int update(EmployeesVO vo) {
		return employeesMapper.update(vo);
	}

	@Override
	public int delete(EmployeesVO vo) {
		return employeesMapper.delete(vo);
	}

}
