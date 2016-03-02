package cn.com.shxt.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * @说明：文件上传的工具类
 * @author 王宗超
 *2013-8-8下午1:44:10
 * version 1.0
 */
public class FileUploadUtil {

	 public static Map<String,String>  fileUpload(HttpServletRequest request, HttpServletResponse response){
		 
	Map<String, String> formMap=null;
		 /**【上传之前的准备】*/
			
	//判断form的enctype是否为： enctype="multipart/form-data" 
	if(ServletFileUpload.isMultipartContent(request)){
	   formMap=new HashMap<String, String>();
		//得到文件的上传目录
	   String path1=request.getRealPath("/");
	   String realPath=  request.getSession().getServletContext().getRealPath("/upload");
	   
	   System.out.println("path1:  "+path1+"---文件上传到的目录： "+realPath);
	   //如果目录不存在，则创建此目录
	   if(!new File(realPath).isDirectory()){
		    new File(realPath).mkdirs();
	   }
	   
	   String temp=  request.getSession().getServletContext().getRealPath("/temp");
	   //如果目录不存在，则创建此目录
	   if(!new File(temp).isDirectory()){
		    new File(temp).mkdirs();
	   }
	   
	   /**【上传的第一步：创建磁盘条目工厂类的对象】*/
	   DiskFileItemFactory factory= new DiskFileItemFactory();
	   //设置磁盘可以存储文件的大小
	   factory.setSizeThreshold(2*1024*1024);//2M
	   //如果上传的文件大小超过factory大小，将文件写入到临时文件
	   factory.setRepository(new File(temp));
	   
	   /**【上传的第二步：创建ServletFileUpload实例】*/
	   ServletFileUpload  upload= new ServletFileUpload(factory);
	   //设置上传的文件总量大小
	   upload.setSizeMax(10*1024*1024);
		
	   //设置上传的单个文件大小
	   upload.setFileSizeMax(1*1024*1024);
	   
	   try {
		//通过ServletFileUpload实例，解析request对象
		 List<FileItem> fileItems=(List<FileItem>)	upload.parseRequest(request);
		 
		 for(FileItem item:fileItems){
			//获取表单中name属性的值 
			String filedName= item.getFieldName();
			
			System.out.println(" filedName : "+filedName);
			
			//判断form组件的类型（普通的表单组件：（text\password\hidden）、文件域：file）
			
			//是普通的表单组件
			if(item.isFormField()){
		    //获取普通表单组件中用户输入的值
			String  formValue=	item.getString("UTF-8");
			formMap.put(filedName, formValue);
			System.out.println(filedName+"： "+formValue);
			}else{
			//是文件域表单组件
			 /**上传之前准备：
			  *  1，得到文件类型
			  *  2，生产唯一的新的文件名
			  */
			//得到文件域的文件名
			String  fileOldName= item.getName();
			//判断有没有选择上传文件，如果选择了才进行上传处理
			if(fileOldName==null||"".equals(fileOldName)){
				System.out.println("没有选择上传文件......");
			}else{
			System.out.println("fileOldName: "+fileOldName);
			String extension=FileUtil.getExtension(fileOldName);
			String newFileName=FileUtil.getDateTimeAsFileName()+FileUtil.getRandom()+"."+extension;
			formMap.put(filedName, newFileName);
			System.out.println(filedName+"： "+newFileName);
			
			//【通过Apache提供给我们第三方jar包中的方法，此中方式效率很高】
			/*try {
				item.write(new File(realPath, newFileName));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			 }*/
			//【我们自己实现的文件上传】
			InputStream  inputStream=  item.getInputStream();
			FileOutputStream  outputStream=new FileOutputStream(new File(realPath, newFileName));
			
			byte [] buffer=new byte[1024];
			int len=0;
			while ( (len=inputStream.read(buffer))!=-1) {
				  outputStream.write(buffer, 0, len);
			}
			outputStream.close();
			inputStream.close();
			 }
			}
		 }
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   return formMap;
	 }else{
		 System.out.println("请查看您表单的enctype是否为： enctype=multipart/form-data，当前enctype属性值不正确！");
		 return formMap;
	 }
	
  } 
}
