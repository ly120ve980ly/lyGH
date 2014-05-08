package com.luyi.umusic.service.impl;

import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public FileUploadServlet()
	{
		super();
	}
	
	public void destory()
	{
		super.destroy();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		this.doPost(request, response);
	}
	
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		final long MAX_SIZE = 10 * 1024 * 1024;
		
		final String[] allowedExt = new String[]{"jpg", "JPG", "gif", "GIF", "jpeg",
				"JPEG", "txt", "doc", "mp3", "MP3", "wma", "m4a"};
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		DiskFileItemFactory dfif = new DiskFileItemFactory();
		dfif.setSizeThreshold(4096);
		dfif.setRepository(new File(request.getRealPath("/") + "FilesUploadTemp"));
		
		ServletFileUpload sfu = new ServletFileUpload(dfif);
		sfu.setSizeMax(MAX_SIZE);
		
		PrintWriter out = response.getWriter();
		List fileList = null;
		
		try
		{
			fileList = sfu.parseRequest(request);
		} catch(FileUploadException e)
		{
			if(e instanceof SizeLimitExceededException)
			{
				out.println("<script>alert(\"文件尺寸超过规定大小:\" + MAX_SIZE + \"字节\");</script>");
				return;
			}
			e.printStackTrace();
		}
		
		if(fileList == null || fileList.size() == 0)
		{
			out.println("<script>alert(\"请选择上传文件！\");</script>");
			return;
		}
		
		Iterator fileItr = fileList.iterator();
		while(fileItr.hasNext())
		{
			FileItem fileItem = null;
			String path = null;
			long size = 0;
			
			fileItem = (FileItem)fileItr.next();
			
			if(fileItem == null || fileItem.isFormField())
			{
				continue;
			}
			path = fileItem.getName();
			
			size = fileItem.getSize();
			
			if("".equals(path) || size == 0)
			{
				out.println("<script>alert(\"请选择上传文件！\");</script>");
				
				return;
			}
			
			String t_name = path.substring(path.lastIndexOf("\\") + 1);
			String t_ext = t_name.substring(t_name.lastIndexOf(".") + 1);
			int allowFlag = 0;
			
			int allowedExtCount = allowedExt.length;
			for(; allowFlag < allowedExtCount; allowFlag++)
			{
				if(allowedExt[allowFlag].equals(t_ext))
				{
					break;
				}
			}
			if(allowFlag == allowedExtCount)
			{
				out.println("<script>alert(\"请上传正确类型的文件！\");</script>");
				return;
			}
			
			String u_name = null;
			System.out.print(t_ext);
			System.out.print("luyi");
			
			try
			{
				if(t_ext.equals("jpg") || t_ext.equals("JPG") || t_ext.equals("gif") 
						|| t_ext.equals("GIF") || t_ext.equals("jpeg") || t_ext.equals("JPEG"))
				{
					u_name = request.getRealPath("/") + "UserData\\UserPhoto\\" + t_name;
					
					fileItem.write(new File(u_name));
					System.out.println(u_name);
					
					out.println("<script>alert(\"图片上传成功！\");</script>");
				}
				if(t_ext.equals("mp3") || t_ext.equals("MP3") || t_ext.equals("wma") 
					|| t_ext.equals("WMA") || t_ext.equals("m4a") || t_ext.equals("M4A"))
				{
					//音乐
					u_name = request.getRealPath("/") + "UserData\\UserMusic\\" + t_name;
					
					fileItem.write(new File(u_name));
					System.out.println(u_name);
					
					out.println("<script>alert(\"音乐上传成功，快去乐库看看吧！\");</script>");
				}
				else
				{
					//其他
					u_name = request.getRealPath("/") + "UserData\\UserOther\\" + t_name;
				}
				fileItem.write(new File(u_name));
				System.out.println(u_name);
				
				out.println("<script>alert(\"文件上传成功，快去乐库看看吧！\");</script>");
			} catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
}
