<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表</title>
<!-- 引入jquery  -->
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<!-- 引入bootstrap样式  -->
 <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
 <!-- 引入bootstrap的js  -->
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 员工更新的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">员工更新</h4>
      </div>
      <div class="modal-body">
             <form class="form-horizontal">
                    <div class="form-group">
                              <label  class="col-sm-2 control-label">empName</label>
                              <div class="col-sm-10">
                                      <!-- <input type="text" name="empName" class="form-control" id="empName_update_static" placeholder="empName"> -->
                                      <p class="form-control-static" id="empName_update_static"></p>
                                      <!-- help-block用于错误提示信息 -->
                                      <span class="help-block"></span>
                              </div> 
                    </div>
                    <div class="form-group">
                               <label  class="col-sm-2 control-label">email</label>
                               <div class="col-sm-10">
                                      <input type="text" name="email" class="form-control" id="email_update_static" placeholder="email">
                                      <!-- help-block用于错误提示信息 -->
                                      <span class="help-block"></span>
                               </div> 
                    </div>
                    <div class="form-group">
                              <label  class="col-sm-2 control-label">gender</label>
                              <div class="col-sm-10">
                                   <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                                  </label>
                              <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                              </label>                    
                             </div> 
                    </div>
                    <div class="form-group">
                               <label  class="col-sm-2 control-label">deptName</label>
                               <div class="col-sm-4">
                                       <!-- 部门提交部门id即可 -->
                                      <select class="form-control" name="dId" id="dept_update_select">		                                       
                                     </select>
                               </div> 
                    </div>             
             </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
      </div>
    </div>
  </div>
</div>
<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
      </div>
      <div class="modal-body">
             <form class="form-horizontal">
                    <div class="form-group">
                              <label  class="col-sm-2 control-label">empName</label>
                              <div class="col-sm-10">
                                      <input type="text" name="empName" class="form-control" id="empName_add_static" placeholder="empName">
                                      <!-- help-block用于错误提示信息 -->
                                      <span class="help-block"></span>
                              </div> 
                    </div>
                    <div class="form-group">
                               <label  class="col-sm-2 control-label">email</label>
                               <div class="col-sm-10">
                                      <input type="text" name="email" class="form-control" id="email_add_static" placeholder="email">
                                      <!-- help-block用于错误提示信息 -->
                                      <span class="help-block"></span>
                               </div> 
                    </div>
                    <div class="form-group">
                              <label  class="col-sm-2 control-label">gender</label>
                              <div class="col-sm-10">
                                   <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                                  </label>
                              <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                              </label>                    
                             </div> 
                    </div>
                    <div class="form-group">
                               <label  class="col-sm-2 control-label">deptName</label>
                               <div class="col-sm-4">
                                       <!-- 部门提交部门id即可 -->
                                      <select class="form-control" name="dId" id="dept_add_select">		                                       
                                     </select>
                               </div> 
                    </div>             
             </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>
<!-- 搭建显示页面 -->
           <div class="container">
                    <!-- 标题 -->
                    <div class="row">
                         <!-- 当前标题横向被分为12列 -->
                        <div class="col-md-12">
                              <h1>xuxiao的员工信息表</h1>
                        </div>
                    </div>
                    <!-- 按钮 -->
                    <div class="row">
                            <!-- 用列偏移来在界面右侧添加按钮，本身占四列，又向右偏移8列显示（一共12列） -->
                           <div class="col-md-4 col-md-offset-8">
                                 <button class="btn btn-success" id="emp_add_modal_btn">新增员工</button>
                                 <button class="btn btn-danger" id="emp_delete_all_btn">批量删除</button>
                           </div>
                    </div>
                    <!-- 内容 -->
                    <div class="row">
                          <div class="col-md-12">
                                 <table class="table table-striped" id="emps_table">
                                     <thead>
                                         <tr>
                                              <th>
                                                       <input type="checkbox" id="check_all">
                                              </th>
                                              <th>工号</th>
                                              <th>empName</th>
                                              <th>gender</th>
                                              <th>email</th>
                                              <th>deptname</th>
                                              <th>操作</th>
                                         </tr> 
                                       </thead>                                     
                                       <tbody>                                            
                                       </tbody>                                     
                                 </table>
                          </div>
                    </div>
                    <!-- 分页信息 -->
                    <div class="row">
                        <!-- 分页文字信息 -->
                        <div class="col-md-6" id="page_info_area">                             
                        </div>
                        <!-- 分页条 -->
                        <div class="col-md-6" id="page_nav_area">                           
                        </div>
                    </div>
           </div>
           <script type="text/javascript">
            var totalRecord,pageNum; 
          $(function(){
        	  //第一次去首页
        	  to_page(1);
          })
           function to_page(pn){
        	   $.ajax({
        		   url:"${APP_PATH}/ssm-crud/empss",
        		   data:"pn="+pn,
        		   type:"GET",
        		   success:function(result){
        			   //console.log(result);
        			   //1.解析并显示员工数据
        			   build_emps_table(result);
        			   //2.解析并显示分页信息
        			   build_page_info(result);
        			   //3.解析显示分页条
        			   build_page_nav(result);
        		   }
        	   });
           };
           function build_emps_table(result){
        	    //清空table表格
               $("#emps_table tbody").empty();
        	   //拿到所有员工数据
        	   var emps = result.extend.pageInfo.list;
        	   //用jquery自带的遍历（each）遍历员工list，取出一条条item
        	   $.each(emps,function(index,item){
        		   /* 构建表格 */
        		   var checkBoxTd = $("<td></td>").append("<input type='checkbox' class='check_item'/>");
                   var empIdTd = $("<td></td>").append(item.empId);
                   var empNameTd = $("<td></td>").append(item.empName);
                   var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
                   var emailTd = $("<td></td>").append(item.email);
                   var deptNameTd = $("<td></td>").append(item.department.deptName);  
                   /* 构建button按钮 */   
                   /* 编辑按钮 */
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                   .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                /*为编辑按钮添加自定义属性  */
                editBtn.attr("edit_id",item.empId);
                   /* 删除按钮  */
               var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                   .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");              
             //为删除按钮添加属性表示id
               delBtn.attr("del_id",item.empId);
               var btnTd =$("<td></td>").append(editBtn).append(" ").append(delBtn);
                   //append方法执行完成以后还是返回原来的元素，所以可以继续append
                   $("<tr></tr>")
                       .append(checkBoxTd)
                       .append(empIdTd)
                       .append(empNameTd)
                       .append(genderTd)
                       .append(emailTd)
                       .append(deptNameTd)
                       .append(btnTd)
                       .appendTo("#emps_table tbody");
                   /* appendTo("#emps_table tbody")将表格的tr装配到，id为emps_table的tbody中 */
               });       	
           }
           function build_page_info(result){      	 
        	   //先清空
               $("#page_info_area").empty();
               $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总"+
                   result.extend.pageInfo.pages+"页，共"+
                   result.extend.pageInfo.total+"条记录");
               totalRecord = result.extend.pageInfo.total;
             //更新员工信息后，需返回显示当前页
               currentPage = result.extend.pageInfo.pageNum;
           }
           function build_page_nav(result){
        	   //清空
        	   $("#page_nav_area").empty();
        	   var ul = $("<ul></ul>").addClass("pagination");
        	   var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        	   var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        	   if (result.extend.pageInfo.hasPreviousPage == false) {
                   firstPageLi.addClass("disabled");
                   prePageLi.addClass("disabled");
               }else{
            	   //为按钮添加点击翻页事件
              	 firstPageLi.click(function(){
              		 to_page(1);
              	 });
              	 prePageLi.click(function(){
              		 to_page(result.extend.pageInfo.pageNum - 1);
              	 });
        	   }
        	
        	   var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
               var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
               if (result.extend.pageInfo.hasNextPage == false) {
                   nextPageLi.addClass("disabled");
                   lastPageLi.addClass("disabled");
               }else{
            	 //为按钮添加点击翻页事件
                   nextPageLi.click(function(){
                	   to_page(result.extend.pageInfo.pageNum + 1);
                   });
                   lastPageLi.click(function(){
                	   to_page(result.extend.pageInfo.pages);
                   });
               }            
               ul.append(firstPageLi).append(prePageLi);
               $.each(result.extend.pageInfo.navigatepageNums,function (index, item) {
                   var numLi = $("<li></li>").append($("<a></a>").append(item));
                   if(result.extend.pageInfo.pageNum == item){
                	   numLi.addClass("active");
                   }
                   numLi.click(function(){
                	   to_page(item);
                   })
                   ul.append(numLi);
               });
               ul.append(nextPageLi).append(lastPageLi);
             //把ul加入到nav
               var navEle = $("<nav></nav>").append(ul);
               navEle.appendTo("#page_nav_area");
           }
           //点击新增按钮
           $("#emp_add_modal_btn").click(function () {
        	   //表单内容重置
        	   $("#empAddModal form")[0].reset();
        	   //发送ajax请求，查出部门信息，显示在下拉列表之中
        	   getDepts("#dept_add_select");
               //弹出模态框
               $("#empAddModal").modal({
                   backdrop:"static"
               });
           });
           //查出所有部门信息并显示在下拉列表之中
           function getDepts(ele){
        	   //清空下拉列表的值
        	   $(ele).empty();
        	   $.ajax({
        		   url:"${APP_PATH}/ssm-crud/depts",       		  
        		   type:"GET",
        		   success:function(result){
        			  // console.log(result);     
        			 //显示部门信息在下拉列表中
        			 $.each(result.extend.depts,function(){
        				 var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                         optionEle.appendTo(ele);
        			 });
        		   }
        	   });
           }
           function show_validate_msg(ele, status, msg) {
				//首先清空当前元素
				$(ele).parent().removeClass("has-success has-error");
				$(ele).next("span").text("");
				if ("success" == status) {
					$(ele).parent().addClass("has-success");
				} else if ("error" == status) {
					$(ele).parent().addClass("has-error");
				}
				$(ele).next("span").text(msg);
			}
           //校验表格数据，用js提供的正则表达式
           function validate_add_form(){
        	   //拿到员工姓名
        	   var empName = $("#empName_add_static").val();
        	   //该正则表达式表示：允许输入为小写/大学a-z和0到9，以及_和-，长度为4到16位
        	   //[\u2E80-\u9FFF]表示unicode的所有中文，我们允许输入2到5个中文字符
        	   var regName = /(^[a-zA-Z0-9_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        	   //如果校验失败
        	   if (!regName.test(empName)) {
                   // alert("用户名为2-5中文或1-16英文数字组合");
                   show_validate_msg("#empName_add_static","error","用户名为2-5中文或4-16英文数字组合");                  
                   return false;
               }else {
                   show_validate_msg("#empName_add_static","success","");          	  
               }
        	   //2、校验邮箱信息
               var empEmail = $("#email_add_static").val();
               var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
               if (!regEmail.test(empEmail)) {
                   // alert("邮箱格式错误");
                   show_validate_msg("#email_add_static","error","邮箱格式错误");                   
                   return false;
               }else{
                   show_validate_msg("#email_add_static","success","");            	   
               }
               return true;
           }
           //点击保存，保存员工
           $("#emp_save_btn").click(function(){
        	   //模态框中填写的表单数据提交给服务器保存
        	   //先对要提交给服务器的数据做校验
        	   if (!validate_add_form()){
                   return false;
               }
        	   //判断之前的ajax用户名校验是否成功
        	   if ($(this).attr("ajax-va") == "error") {
					return false;
				}
        	   //发送ajax请求保存员工
        	   $.ajax({
        		   url:"${APP_PATH}/ssm-crud/emp",       		  
        		   type:"POST",
        		   data:$("#empAddModal form").serialize(),
        		   success:function(result){
        			   if(result.code == 100){
        				 //alert(result.msg);
            			   //成功后应该关闭模态框
            			   $("#empAddModal").modal('hide');
            			   //来到最后一页来看添加的数据，因为pageHelper在跳转到超过总页码
            			   //的页码时会自动帮我们跳转到最后一页，我们只要传入一个足够大的页码数即可，这里是总纪录数
            			   to_page(totalRecord);
        			   }else{
        				// 显示失败信息
                           console.log(result);
                           if (undefined != result.extend.errorFields.empEmail){
                               //    显示邮箱的错误信息
                                   show_validate_msg("#email_add_static","error",result.extend.errorFields.empEmail);
                               }
                               if (undefined != result.extend.errorFields.empName){
                                   //    显示员工名错误信息
                                   show_validate_msg("#empName_add_static","error",result.extend.errorFields.empName);
                               }
        			   }        			   
        		   }
        	   });
           });
           $("#empName_add_static").change(function(){
        	   //校验用户名是否可用
        	   //拿到用户名
        	   var empName = $("#empName_add_static").val();
        	   $.ajax({
        		   url:"${APP_PATH}/ssm-crud/checkuser",         		   
        		   data: "empName=" + empName,
        		   type:"POST",
        		   success:function(result){
        			   if(result.code==100){
        				   show_validate_msg("#empName_add_static","success","用户名可用");
        				   $("#emp_save_btn").attr("ajax-va", "success");
        			   }else{
        				   show_validate_msg("#empName_add_static","error","用户名不可用");
        				   $("#emp_save_btn").attr("ajax-va", "error");
        			   }
        		   }
        	   });      	   
           });
           $(document).on("click",".edit_btn",function(){
        	   //表单内容重置
        	   $("#empUpdateModal form")[0].reset();
        	   //发送ajax请求，查出部门信息，显示在下拉列表之中
        	   getDepts("#dept_update_select");
        	   //查询员工信息
        	   getEmp($(this).attr("edit_id"));
        	   //把员工的id传递给模态框的更新按钮
        	   $("#emp_update_btn").attr("edit_id",$(this).attr("edit_id"));
        	   //弹出模态框
               $("#empUpdateModal").modal({
                   backdrop:"static"
               });
           });
           function getEmp(id){
        	   $.ajax({
        		   url:"${APP_PATH}/ssm-crud/emp/"+id,         		          		   
        		   type:"GET",
        		   success:function(result){
        			   console.log(result);
        			   var empData = result.extend.emp;
        			   $("#empName_update_static").text(empData.empName);
                       $("#email_update_static").val(empData.email);
                       $("#empUpdateModal input[name=gender]").val([empData.gender]);
                       $("#empUpdateModal select").val([empData.dId]);
        		   }
        	   });
           }
         //点击更新，更新员工信息
         $("#emp_update_btn").click(function(){
        	//验证邮箱是否合法
             //1、校验邮箱信息
             var empEmail = $("#email_update_static").val();
               var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
               if (!regEmail.test(empEmail)) {
                   // alert("邮箱格式错误");
                   show_validate_msg("#email_update_static","error","邮箱格式错误");                   
                   return false;
               }else{
                   show_validate_msg("#email_update_static","success","");            	   
               }
             //2、发送ajax请求，保存更新员工信息
             $.ajax({
            	 url:"${APP_PATH}/ssm-crud/emp/"+$(this).attr("edit_id"),         		          		   
      		     type:"PUT",
      		    data:$("#empUpdateModal form").serialize(),
      		    success:function(result){
      		    	alert(result.msg);
      		    	$("#empUpdateModal").modal("hide");
                    to_page(currentPage);
      		    }     		   
             });
         });
         //单个删除
         $(document).on("click",".delete_btn",function () {
            //1、弹出确认删除对话框
             var empName = $(this).parents("tr").find("td:eq(2)").text();
             var empId = $(this).attr("del_id");
             if(confirm("确认删除【"+empName+"】吗？")){
                 //发送ajax请求删除
                 $.ajax({
                     url:"${APP_PATH}/ssm-crud/emp/"+empId,
                     type:"DELETE",
                     success:function (result) {
                         alert(result.msg);
                         //回到本页
                         to_page(currentPage);
                     }
                 });
             }
         });
       //完成全选/全不选功能
         $("#check_all").click(function () {
             var is_All_Check = $(this).prop("checked");
             $(".check_item").prop("checked",is_All_Check);
         });
       //check_item，复选框选择操作
         $(document).on("click",".check_item",function () {
             //判断当前选择中的元素是否选满
             var flag = $(".check_item:checked").length == $(".check_item").length;
            $("#check_all").prop("checked",flag);
         })
         //点击全部删除，就批量删除
         $("#emp_delete_all_btn").click(function(){
        	 var empNames = "";
             var del_idstr = "";
             $.each($(".check_item:checked"),function () {
                 //组装员工字符串
                 empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
                 //组织员工id字符串
                 del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
             });
             //去除empnames多余的","
             empNames = empNames.substring(0,empNames.length-1);
             //去除员工删除id多余的-
             del_idstr = del_idstr.substring(0,del_idstr.length-1);
             if (confirm("确认删除【" + empNames + "】吗？")) {
                 //发送ajax请求
                 $.ajax({
                     url:"${APP_PATH}/ssm-crud/emp/"+del_idstr,
                     type:"DELETE",
                     success:function (result) {
                         alert(result.msg);
                         //回到当前页面
                         to_page(currentPage);
                         $("#check_all").prop("checked",false);
                     }
                 })
             }
         });
           </script>
</body>
</html>