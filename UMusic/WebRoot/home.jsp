<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.luyi.umusic.model.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

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
		<script type="text/javascript" src="<%=basePath%>rez/data/js/js/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>rez/data/js/js/jquery.dimensions.js"></script>
		<script type="text/javascript" src="<%=basePath%>rez/data/js/js/jquery.accordion.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
			  $("#acc").accordion();
			});
		</script>
	</head>
	<body>
	<div id="panel">
		<div id="picturewall">
			<iframe src="<%=basePath%>rez/data/js/index.html" 
					frameborder=”no” border=”0″ marginwidth=”0″ marginheight=”0″ scrolling=”no” allowtransparency=”yes”
				style="margin:20px 0 20px 0;width:100%;height:60%;"></iframe><hr/>
		</div>
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
			  <li><a href="musiclib.jsp">留言</a>
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
			<div id="billboard">
				<div id="container">
				  <div class="pbd">
				    <div class="sidebar">
				      <div class="box01">
				        <div class="top">
				          <h4><span><a href="#">More</a></span>音乐动态</h4>
				        </div>
				        <div class="mid">
				          <div id="acc"> <b class="nav"><span>排行榜</span></b>
				            <div class="sub"> 
				            	<%
						    	List musiclistorder = (List)request.getSession().getAttribute("musiclistorder");
						    	if(musiclistorder != null)
						    	{
						    	Iterator musicitrod = musiclistorder.iterator();
						    	int i = 1;
								while(musicitrod.hasNext())
								{
									Music m = (Music)musicitrod.next();
									String grade = "第" + i;
								%>
								<%=grade %><div style="width:150px;background:#F4F4F4;color:#000;font-size:12px;"><%=m.getMusicTitle() %>&nbsp;&nbsp;--<%=m.getSinger() %></div><br/>
								<%
									i++;
								}
								}
								%>
				            </div>
				            <b class="nav"><span>最新榜</span></b>
				            <div  class="sub">
				            <%
						    	List musiclistnew = (List)request.getSession().getAttribute("musiclistnew");
						    	if(musiclistnew != null)
						    	{
						    	Iterator musicitrnew = musiclistnew.iterator();
						    	int j = 1;
								while(musicitrnew.hasNext())
								{
									Music m = (Music)musicitrnew.next();
									String grade = "第" + j;
								%>
								<%=grade %><div style="width:150px;background:#F4F4F4;color:#000;font-size:12px;"><%=m.getMusicTitle() %>&nbsp;&nbsp;--<%=m.getSinger() %></div><br/>
								<%
									j++;
								}
								}
								%>
				            </div>
				            <b  class="nav"><span>推荐榜</span></b>
				            <div class="sub">
				             	<center><h5>管理员偷懒，敬请期待</h5></center>
				            </div>
				            <b  class="nav"><span>我的收藏</span></b>
				            <div  class="sub">
				            <%
				             if(request.getSession().getAttribute("userName") != null &&
								request.getSession().getAttribute("userPwd") != null)
							 {
						    	List musiclistcollect = (List)request.getSession().getAttribute("musiclistcollect");
						    	if(musiclistcollect != null)
						    	{
						    	Iterator musicitrcollect = musiclistcollect.iterator();
						    	int k = 1;
								while(musicitrcollect.hasNext())
								{
									Music m = (Music)musicitrcollect.next();
									String grade = "第" + k;
								%>
								<%=grade %><div style="width:150px;background:#F4F4F4;color:#000;font-size:12px;"><%=m.getMusicTitle() %>&nbsp;&nbsp;--<%=m.getSinger() %></div><br/>
								<%
									k++;
								}
								}
							}
							else
							{
							%>
							<div><center><h5>抱歉，您还未登录</h5></center></div>	
							<% 
							}
							%>
				            </div>
				            <b  class="nav"><span>联系Luyi</span></b>
				            <div  class="sub">
				            	<div style="padding:10px 10px 10px 10px;width:150px;background:#F4F4F4;color:#000;font-size:14px;line-height:300%;">
				            	<p>
				            	邮箱：445686985@qq.com
				            	如有疑问，请发邮件
				            	谢谢
				            	</p>
				            	</div><br/>
				            </div>
				          </div>
				        </div>
				      </div>
				    </div>
				   
				  </div>
				</div>
			</div>
			<div id="sourch">
				<html:form action="/shareM"> 
				<img style="width:30%;height:10%" src="<%=basePath%>rez/data/images/sourch.gif" />
		    	<html:hidden property="method" value="sourch"></html:hidden>
					<html:text property="sourch" size="30"/>
					<html:submit>搜索</html:submit>
				</html:form>
			</div>
				<%
				List musiclist = (List)request.getSession().getAttribute("musiclist");
				if(musiclist != null)
				{
				Iterator musicitr = musiclist.iterator();
				while(musicitr.hasNext())
				{
					Music m = (Music)musicitr.next();
					String type = null;
					request.getSession().setAttribute("musicId", m.getId());
					if(m.getMusicType().equals("勿忘心安"))
					{
						type="1";
					}
					if(m.getMusicType().equals("忧伤情怀"))
					{
						type="2";
					}
					if(m.getMusicType().equals("失恋33天"))
					{
						type="3";
					}
					if(m.getMusicType().equals("恋爱ing"))
					{
						type="4";
					}
					if(m.getMusicType().equals("奋斗向上"))
					{
						type="5";
					}
					if(m.getMusicType().equals("让我静静"))
					{
						type="6";
					}
		    %>
		    <div id="musicview">
		    	<table>
		    		<tr>
		    		<td><h4>用户<%=m.getUserId() %></h4></td>
		    		<td style="background:#FFF;"><%=m.getMusicDcpt() %></td>
		    		</tr>
		    		<tr>
		    		<td><img id="imgHead" src="<%=basePath%>rez/data/images/<%=type %>.jpg"/></td>
		    		<td style="font-size:15px;font-weight:bold;"><%=m.getMusicTitle() %></td>
		    		</tr>
		    		<tr>
		    		<td style="font-size:8px;"><%=m.getMusicType() %></td>
		    		<td style="text-align:right;">---<%=m.getSinger() %></td>
		    		</tr>
		    		<tr>
			    		<td style="text-align:right;">
				    		<a href="/UMusic/shareM.do?method=read&musicId=<%=m.getId()%>">
				    			点赞
				    		</a>
				    		<%=m.getReadedCount() %>
			    		</td>
			    		<td style="text-align:right;">
			    			<a href="/UMusic/shareM.do?method=feedback&musicId=<%=m.getId()%>"
			    				onclick="javascript:alert('收藏成功！')">
				    			收藏
				    		</a>
				    		<%=m.getFeedbackCount() %>
			    		</td>
		    		</tr>
		    		<tr>
						<td rowspan=2>
						<audio controls="controls" id="audio_player">
							<source src="<%=basePath%>UserData/UserMusic/<%=m.getMusicTitle() %>"/>
						</audio>
						</td>
					</tr>
					</table>
					<hr/>
					<table>
						<%
						if(request.getSession().getAttribute("userName") == null &&
							request.getSession().getAttribute("userPwd") == null)
						{
						%>
							<tr><td><a href="login.jsp">登录</a>后更多精彩^_^</td></tr>
						<% 
						}
						else
						{	
					    	List feedbacklist = (List)request.getSession().getAttribute("feedbacklist");
					    	if(feedbacklist != null)
					    	{
						    	Iterator feedbackitr = feedbacklist.iterator();
						    	
								while(feedbackitr.hasNext())
								{
									Feedback f = (Feedback)feedbackitr.next();
									
									if(f.getMusicId().equals(m.getId()))
									{
							%>
								<tr>
									<td>
										<div id="feedback"><%=f.getUserName() %>:<%=f.getContent() %>
											&nbsp;&nbsp;&nbsp;&nbsp;<%=f.getPubTime() %></div>
									</td>
								</tr>
							<%
									}	
								}
							%>
							<tr>
							<html:form action="/feedback">
							<html:hidden property="method" value="save"></html:hidden>
							<input type="hidden" name="musicId" value="<%=m.getId()%>" />
								<td><html:textarea property="content"/>
								<html:errors property="content"/></td>
								<td><html:submit>评论</html:submit></td>
							</html:form>
							</tr>
						<%
							}
						}
						%>	
					</table>
				
			</div>
			<%
			}
			}
			%>
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
	
	</body>
</html>

