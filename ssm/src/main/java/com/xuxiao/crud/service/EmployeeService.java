package com.xuxiao.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuxiao.crud.bean.Employee;
import com.xuxiao.crud.bean.EmployeeExample;
import com.xuxiao.crud.bean.EmployeeExample.Criteria;
import com.xuxiao.crud.dao.EmployeeMapper;
@Service
public class EmployeeService {
	@Autowired
	EmployeeMapper employeeMapper;
    /**
     * 该方法查询所有员工
     * @return
     */
	public List<Employee> getAll() {
		return employeeMapper.selectByExampleWithDept(null);
	}
	/**
	 * 员工保存方法
	 * @param employee
	 */
	public void saveEmp(Employee employee) {
		employeeMapper.insertSelective(employee);		
	}
	/**
	 * 检验用户名是否可用
	 * @param empName
	 * @return true:可用    false：不可用
	 */
	public boolean checkUser(String empName) {
		//创建查询条件
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count==0;
	}
	/**
	 * 按照员工id查询员工
	 * @param id
	 * @return
	 */
	public Employee getEmp(Integer id) {
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}
	/**
	 * 更新员工
	 * @param employee
	 */
	public void updateEmp(Employee employee) {
		//updateByPrimaryKeySelective按照主键有选择的更新，带了什么参数更新什么参数
		employeeMapper.updateByPrimaryKeySelective(employee);
	}
	/**
	 * 删除员工
	 * @param id
	 */
	public void deleteEmpById(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
		
	}
	public void deleteBatch(List<Integer> del_ids) {
		EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        criteria.andEmpIdIn(del_ids);
        employeeMapper.deleteByExample(example);
		
	}

}
