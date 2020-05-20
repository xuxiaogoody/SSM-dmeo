package com.xuxiao.crud.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xuxiao.crud.bean.Employee;
import com.xuxiao.crud.bean.Msg;
import com.xuxiao.crud.service.EmployeeService;
/**
 * 处理crud请求
 * @author xuxiao
 */
@Controller
@CrossOrigin 
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	/**
	 * 单个批量二合一
	 * @param id
	 * @return
	 */
	@DeleteMapping("/emp/{ids}")
	@ResponseBody
	public Msg deleteEmpById(@PathVariable("ids") String ids){
        if (ids.contains("-")){
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            //组装id的集合
            for (String string : str_ids){
                del_ids.add(Integer.parseInt(string));
            }
            employeeService.deleteBatch(del_ids);
        }else{
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmpById(id);
        }
        return Msg.success();
    }
	/**
	 *  解决方案
     * 要能支持直接发送PUT之类的请求，还要封装请求体中的数据
     * 1、配置上HttpputFormContentFilter；
     * 2、作用：将请求体中的数据解析包装成一个map。
     * 3、request被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据
	 * 保存更新员工信息
	 * @return
	 */
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(Employee employee) {
		employeeService.updateEmp(employee);
		System.out.println(employee);
		return Msg.success();
	}
	/**
	 * 根据id查询员工
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id") Integer id) {
		Employee employee = employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
	}
	/**
	 * 验证用户名是否存在
	 * @param empName
	 * @return
	 */
	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg checkuse(@RequestParam("empName")String empName) {
		boolean result = employeeService.checkUser(empName);
		if(result) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	/**
	 * 保存用户
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee,BindingResult result) {
		if (result.hasErrors()){
            Map<String,Object> map = new HashMap<>();
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError:errors){
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }
	}
	/**
     * responsebody需要导入jackson包
     * @param pn
     * @return
     */
	@SuppressWarnings("rawtypes")
	@ResponseBody
	@RequestMapping("/empss")
	public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn,5);
		PageHelper.orderBy("emp_id asc");
        List<Employee> emps = employeeService.getAll();
        @SuppressWarnings("unchecked")
		PageInfo page = new PageInfo(emps,5);
        return Msg.success().add("pageInfo", page);
        
	}
	
	/**
	 * 查询员工数据
	 * @return
	 */
      @RequestMapping("/emps")
	  public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
    	  //这不是一个分页查询
    	  //引入pageHelper分页插件
    	  //在查询之前只需要调用,pn指从第几页查，即页码，5指一页有5条数据
    	  PageHelper.startPage(pn,5);
    	  //startPage紧跟的查询就是一个分页查询  	    	  
    	  List<Employee>emps = employeeService.getAll();
    	  //使用PageInfo包装我们的查询结果，只需要将PageInfo交给页面就行了
    	  //PageInfo封装了详细的分页信息，包括我们查询出的数据,5表示连续显示5页
    	  @SuppressWarnings({ "rawtypes", "unchecked" })
		PageInfo page = new PageInfo(emps,5);
    	  model.addAttribute("pageInfo",page);
		  return "list";
	  }
}
