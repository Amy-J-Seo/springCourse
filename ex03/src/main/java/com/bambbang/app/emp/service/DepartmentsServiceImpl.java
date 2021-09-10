package com.bambbang.app.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bambbang.app.emp.domain.DepartmentsVO;
import com.bambbang.app.emp.mapper.DepartmentsMapper;

@Service
public class DepartmentsServiceImpl implements DepartmentsService {
	@Autowired DepartmentsMapper departmentsMapper;

	@Override
	public List<DepartmentsVO> getDeptList() {
		return departmentsMapper.getDeptList();
	}

}
