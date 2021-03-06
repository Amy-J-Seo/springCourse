package com.bambbang.app.emp.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bambbang.app.board.domain.Criteria;
import com.bambbang.app.emp.domain.EmployeeVO;
import com.bambbang.app.emp.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired EmployeeMapper employeeMapper;
	
	@Override
	public List<EmployeeVO> getList(Criteria cri) {
		return employeeMapper.getList(cri);
	}

	@Override
	public EmployeeVO read(EmployeeVO vo) {
		return employeeMapper.read(vo);
	}

	@Override
	public int insert(EmployeeVO vo) {
		return employeeMapper.insert(vo);
	}

	@Override
	public int update(EmployeeVO vo) {
		return employeeMapper.update(vo);
	}

	@Override
	public int delete(EmployeeVO vo) {
		return employeeMapper.delete(vo);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return employeeMapper.getTotalCount(cri);
	}

}
