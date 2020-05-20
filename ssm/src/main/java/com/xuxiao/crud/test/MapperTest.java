package com.xuxiao.crud.test;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xuxiao.crud.bean.Employee;
import com.xuxiao.crud.bean.EmployeeExample;
import com.xuxiao.crud.bean.EmployeeExample.Criteria;
import com.xuxiao.crud.dao.DepartmentMapper;
import com.xuxiao.crud.dao.EmployeeMapper;

/**
 * spring项目就用spring 的单元测试，可以自动注入我们需要组件
 * 1.导入spring test包
 *2.@ContextConfiguration指定spring配置文件的位置
 *3.直接autoWired组件即可
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
     /**
      * 测试Department.Mpper
      */
	@Autowired
     DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	SqlSession sqlSession;
	
	@Test
     public void testCRUD() {
	   System.out.println(departmentMapper);
	   //生成几个部门
	   //departmentMapper.insertSelective(new Department(null,"开发部"));
	   //departmentMapper.insertSelective(new Department(null,"测试部"));
	   //插入员工数据
	   //employeeMapper.insertSelective(new Employee(null,"Jerry","M","jerry@qq.com",1));
	   //批量插入员工
	   //EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
	  // for(int i=0;i<1000;i++) {
		//   String uid=UUID.randomUUID().toString().substring(0, 5);//通过UUID来随机生成员工姓名，截取5个字段
	//	   mapper.insertSelective(new Employee(null,uid,"M",uid+"@qq.com",1));
	//   }
	 //  System.out.println("批量完成");
	   
	   
}
	/**
	 * 测试example条件：员工id在两者之间
	 */
	@Test
	public void testExample_andEmpIdBetween() {
		  EmployeeExample example = new EmployeeExample();
		   Criteria criteria = example.createCriteria();
		   criteria.andEmpIdBetween(3, 5);
		   List<Employee> result = employeeMapper.selectByExample(example);
		   for (Employee employee : result) {
			System.out.println(employee);
		}
	}
	@Test
	public void testExample() {
		 EmployeeExample example = new EmployeeExample();
		   Criteria criteria = example.createCriteria();
		   criteria.andEmpIdLessThan(5);
	}
}
