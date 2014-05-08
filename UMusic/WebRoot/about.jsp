<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 

<html> 
	<head>
		<title>JSP for ShareForm form</title>
		<link rel="stylesheet" href="<%=basePath%>rez/data/css/style.css" type="text/css"></link>
	</head>
	<body>
	<div id="panel">
		<div id="head"><img src="<%=basePath%>rez/data/images/bg_login.jpg"></img></div>
		<div id="navigation">
			<span id="logo" style="font-size:18px;font-weight:bold;font-style:italic;">
				UMusic
			</span>
			<ul id="menu">
			  <li><a href="/UMusic/shareM.do?method=all">��ҳ</a></li>
			  <li><a href="/UMusic/shareM.do?method=all">����</a>
			    <ul>
			    <li><a href="sharem.jsp">��������</a></li>
			    <li><a href="/UMusic/shareM.do?method=list">�ҵ��ֿ�</a></li>
			    </ul>
			  </li>
			  <li><a href="useredit.jsp">����</a>
			    <ul>
			    <li><a href="/UMusic/shareP.do?method=list">�ҵ����</a></li>
			    <li><a href="useredit.jsp">��������</a></li>
			    </ul>
			  </li>
			  <li><a href="guestbook.jsp">����</a>
			  </li>
			  <li><a href="adminlogin.jsp">����</a>
			    <ul>
			    <li><a href="adminlogin.jsp">����Ա��¼</a></li>
			    <li><a href="admininfo.jsp">����Ա����</a></li>
			    <li><a href="admin.jsp">ά��</a></li>
			    </ul>
			  </li>
			  <li><a href="about.jsp">����</a>
			    <ul>
			    <li><a href="about.jsp">��ϵLuyi</a></li>
			    <li><a href="about.jsp">�ر�˵��</a></li>
			    </ul>
			  </li>
			   <li id="login">
			  <%
				if(request.getSession().getAttribute("userName") == null &&
					request.getSession().getAttribute("userPwd") == null)
				{
				%>
			  <a href="login.jsp">��¼</a>
			  <% 
			  	}
			  	else
			  	{
			  %>
			  <font style="color:red;font-size:16px;font-style:italic;">
			  <%=request.getSession().getAttribute("userName").toString() %>
			  </font>
			  <a href="/UMusic/user.do?method=cancel">ע��</a>
			  <% 
			  }
			  %>
			  </li>
			</ul>
		</div>
		<div id="main">
			
 			��Ȩ���й�¬�ȣ�����ؾ�������������������ϵ<br>
   			 445686985@qq.com
		</div>
		<div id="footer">
			<span id="you">��</span>
			<span id="you">��</span>
			<span id="you">��</span>
			<span id="you">��</span>
			<span id="me">��</span>
			<span id="me">��</span>
			<span id="me">׷</span>
			<span id="me">��</span>	
		</div>
	</div>
	</body>
	
</html>


