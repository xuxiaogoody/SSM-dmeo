package com.xuxiao.crud.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.xuxiao.crud.bean.Department;
import com.xuxiao.crud.dao.DepartmentMapper;
@Service
public class DepartmentService {
@Autowired
private DepartmentMapper departmentMapper;
public List<Department> getDepts() {
	List<Department> list = departmentMapper.selectByExample(null);
	return list;
}

	

}
