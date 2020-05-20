package com.xuxiao.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuxiao.crud.bean.Msg;
import com.xuxiao.crud.service.DepartmentService;
import com.xuxiao.crud.bean.Department;
@Controller
@CrossOrigin 
public class DepartmentController {
@Autowired
private DepartmentService  departmentService; 
@RequestMapping("/depts")
@ResponseBody
public Msg getDepts() {
	//查出的所有部门信息
	List<Department>list = departmentService.getDepts();
	return Msg.success().add("depts", list);
}
}
