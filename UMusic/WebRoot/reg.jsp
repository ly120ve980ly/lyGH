<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<html> 
	<head>
		<title>JSP for RegForm form</title>
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
			  <li><a href="/UMusic/shareM.do?method=all">首页</a></li>
			  <li><a href="/UMusic/shareM.do?method=all">音乐</a>
			    <ul>
			    <li><a href="sharem.jsp">分享音乐</a></li>
			    <li><a href="/UMusic/shareM.do?method=list">我的乐库</a></li>
			    </ul>
			  </li>
			  <li><a href="useredit.jsp">个人</a>
			    <ul>
			    <li><a href="/UMusic/shareP.do?method=list">我的相册</a></li>
			    <li><a href="useredit.jsp">个人资料</a></li>
			    </ul>
			  </li>
			  <li><a href="guestbook.jsp">留言</a>
			  </li>
			  <li><a href="adminlogin.jsp">管理</a>
			    <ul>
			    <li><a href="adminlogin.jsp">管理员登录</a></li>
			    <li><a href="admininfo.jsp">管理员资料</a></li>
			    <li><a href="admin.jsp">维护</a></li>
			    </ul>
			  </li>
			  <li><a href="about.jsp">关于</a>
			    <ul>
			    <li><a href="about.jsp">联系Luyi</a></li>
			    <li><a href="about.jsp">特别说明</a></li>
			    </ul>
			  </li>
			   <li id="login">
			  <%
				if(request.getSession().getAttribute("userName") == null &&
					request.getSession().getAttribute("userPwd") == null)
				{
				%>
			  <a href="login.jsp">登录</a>
			  <% 
			  	}
			  	else
			  	{
			  %>
			  <font style="color:red;font-size:16px;font-style:italic;">
			  <%=request.getSession().getAttribute("userName").toString() %>
			  </font>
			  <a href="/UMusic/user.do?method=cancel">注销</a>
			  <% 
			  }
			  %>
			  </li>
			</ul>
		</div>
		<div id="main">
			<div id="photo">
				<iframe name="reg" src="reg.jsp" style="display:none;"></iframe>
				<form name="form1" action="upload" method="post" enctype="multipart/form-data" target="reg">
			    	<h4>头像</h4>
			    	<hr/><br/>
			    	<input type="file" multiple="true" size="20" name="file" /><br/><br/>
			    	<span id="img" style="width:80px;height:60px;"></span><br/>
			    	<input name="upload" type="submit" value="上传" />
			    </form>
			</div>
			<div id="base">
				<html:form action="/user"> 
				<html:hidden property="method" value="regist"></html:hidden>
					用户名 :  
					<html:text property="username"/>
					<html:errors property="username"/><br/>
					密&nbsp;&nbsp;码 : 
					<html:password property="password"/>
					<html:errors property="password"/><br/>
					性&nbsp;&nbsp;别 : 
					<html:radio property="sex" value="男">男</html:radio>
					<html:radio property="sex" value="女">女</html:radio>
					<html:errors property="sex"/><br/>
					<html:errors property="city"/><br/>
					头&nbsp;&nbsp;像 : 
					<html:text property="photo" styleId="headPhoto" />
					<html:errors property="photo"/><br/>
					<html:submit> 提交</html:submit>
					<html:reset>取消</html:reset>
				</html:form>
			</div>
		</div>
		<div id="footer">
			<span id="you">你</span>
			<span id="you">的</span>
			<span id="you">音</span>
			<span id="you">乐</span>
			<span id="me">我</span>
			<span id="me">的</span>
			<span id="me">追</span>
			<span id="me">求</span>	
		</div>
	</div>
	<script>
		document.form1.file.addEventListener('change', function(){
			var musicPath = document.form1.file.value;
			var fixed = musicPath.substring(musicPath.lastIndexOf("\\")+1);
			var image = document.createElement("img");
			image.src = "rez/data/img/" + fixed;
			image.width = 80;
			image.height = 60;
			document.getElementById("img").appendChild(image);
			document.getElementById("headPhoto").value = fixed;
		}, false);
	</script>
	</body>
</html>

