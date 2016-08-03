<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.* "%>
<%@ page import="com.bap.comn.MySQLHelper"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<%request.setCharacterEncoding("GBK"); %>
    
	<%
		MySQLHelper mysql = new MySQLHelper();
		String sql = "SELECT SCHEDULE_ID FROM JW_FEE_PLAN_SCHEDULE ";
		ResultSet rs=mysql.Query(sql);
		String sql2="SELECT USER_ID,USER_NAME FROM JW_USER_INFO";
		ResultSet rs2=mysql.Query(sql2);
	%>
<div class="container">
  <form action="AddActual" method="post"> 
  <div class="form-group">
    <label for="SCHEDULE_ID">实际进度ID</label>
    <input name="SCHEDULE_ID" type="text" readonly="readonly" value="<%=MySQLHelper.GetGlobalUniqueID()%>" />
  </div>
  <div class="form-group">
    <label for="PLAN_SCHEDULE_ID">计划进度ID</label>
    <select  name="PLAN_SCHEDULE_ID" >
       <%  while(rs.next()){
       %> 
           <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
    	<%
       }
    	%>   
       
    </select>
  </div>
 <div class="form-group">
    <label for="PARNER_INTERFACE">开发商接口人</label>
    <select  name="PARNER_INTERFACE" >
       <%  while(rs2.next()){
       %> 
           <option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
    	<%
       }
    	%>   
       
    </select>  
  </div>
  <div class="form-group">
    <label for="START_DATE">实际开始时间</label>
     <input type="date" name="START_DATE" >
  </div>
  <div class="form-group">
    <label for="END_DATE">实际结束时间</label>
    <input type="date" name="END_DATE" >
  </div>
  <div class="form-group">
    <label for="STATUS">状态</label>
    <select name="STATUS" >
         <option value="new">new</option>
         <option value="ing">ing</option>
         <option value="done">done</option>
    </select>
  </div>
  <div class="form-group">
    <label for="NOTE">备注</label>
    <textarea name="NOTE" ></textarea>
  </div>
  
  
  <button type="submit" class="btn btn-primary" >保存</button>
  <button  class="btn btn-default" data-dismiss="modal">取消</button>
</form>
	
	
</div>
</body>
</html>