<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
                                 <button class="btn btn-success">
                                      <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                 新增</button>
                                 <button class="btn btn-danger">
                                      <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                 删除</button>
                           </div>
                    </div>
                    <!-- 内容 -->
                    <div class="row">
                          <div class="col-md-12">
                                 <table class="table table-striped">
                                         <tr>
                                              <th>#</th>
                                              <th>empName</th>
                                              <th>gender</th>
                                              <th>email</th>
                                              <th>deptname</th>
                                              <th>操作</th>
                                         </tr>
                                       <c:forEach items="${pageInfo.list }" var="emp">
                                         <tr>                                         
                                              <th>${emp.empId }</th>
                                              <th>${emp.empName }</th>
                                              <th>${emp.gender=="M"?"男":"女"}</th>
                                              <th>${emp.email}</th>
                                              <th>${emp.department.deptName}</th>
                                              <th>
                                                     <button class="btn btn-success btn-sm">编辑</button>
                                                     <button class="btn btn-danger btn-sm">删除</button>
                                              </th>
                                         </tr>
                                         </c:forEach>
                                 </table>
                          </div>
                    </div>
                    <!-- 分页信息 -->
                    <div class="row">
                        <!-- 分页文字信息 -->
                        <div class="col-md-6">
                              当前${pageInfo.pageNum}页，总${pageInfo.pages}页，共${pageInfo.total}条记录
                        </div>
                        <!-- 分页条 -->
                        <div class="col-md-6">
                              <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                       <li><a href="${APP_PATH}/ssm-crud/emps?pn=1">首页</a></li>                                      
                                       <c:if test="${pageInfo.hasPreviousPage}">
                                       <li>
                                            <a href="${APP_PATH}/ssm-crud/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            </a>
                                      </li>                                    
                                      </c:if>
                                      <c:if test="${!pageInfo.hasPreviousPage}">
                                          <li>
                                          <a href="#" aria-label="Previous">
                                          <span aria-hidden="true">&laquo;</span>
                                          </a>
                                          </li>
                                      </c:if>
                                       <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                                            <c:if test="${page_Num == pageInfo.pageNum}">
                                            <li class="active"><a href="#" >${page_Num}</a></li>
                                            </c:if>
                                            <c:if test="${page_Num != pageInfo.pageNum}">
                                            <li><a href="${APP_PATH}/ssm-crud/emps?pn=${page_Num}" >${page_Num}</a></li>
                                            </c:if>
                                       </c:forEach>                                        
                                        <c:if test="${pageInfo.hasNextPage}">
                                              <li>
                                              <a href="${APP_PATH}/ssm-crud/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                             <span aria-hidden="true">&raquo;</span>
                                             </a>
                                             </li>
                                       </c:if>
                                       <c:if test="${!pageInfo.hasNextPage}">
                                             <li>
                                             <a href="#" aria-label="Next">
                                             <span aria-hidden="true">&raquo;</span>
                                             </a>
                                            </li>
                                      </c:if>
                                        <li><a href="${APP_PATH}/ssm-crud/emps?pn=${pageInfo.pages}">末页</a></li>  
                                    </ul>
                             </nav>
                        </div>
                    </div>
           </div>
</body>
</html>