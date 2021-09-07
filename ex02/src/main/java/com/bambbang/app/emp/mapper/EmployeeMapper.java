package com.bambbang.app.emp.mapper;

import java.util.List;

import com.bambbang.app.board.domain.Criteria;
import com.bambbang.app.emp.domain.EmployeeVO;

public interface EmployeeMapper {
		//직원전체 조회
		public List<EmployeeVO> getList(Criteria cri);
		
		//한 직원 조회
		public EmployeeVO read(EmployeeVO vo);
		
		//직원입력
		public int insert(EmployeeVO vo);
		
		//직원 수정
		public int update(EmployeeVO vo);
		//직원 삭제
		public int delete(EmployeeVO vo);
		// 전체 멤버수 
		public int getTotalCount(Criteria cri);
}
