/**
 * 
 */
package cn.com.shxt.utils;

import java.util.Calendar;

/**
 * @author Administrator wangzongchao
 * @create date 2013-4-20
 * @version V 1.0
 */
public class FileUtil {
	
	/**
	 * 得到当前时间作为文件名
	 */
	 public  static String getDateTimeAsFileName(){
	    	Calendar calendar=Calendar.getInstance();
	    	int month=calendar.get(Calendar.MONTH)+1;
	    	int date=calendar.get(Calendar.DATE);
	    	int hour=calendar.get(Calendar.HOUR_OF_DAY);
	    	int minute=calendar.get(Calendar.MINUTE);
	    	int second=calendar.get(Calendar.SECOND);
	    	return calendar.get(Calendar.YEAR)+""+( month>=10?month:"0"+month)+""+(date>10?date:"0"+date)+""+(hour>10?hour:"0"+hour)+""+(minute>10?minute:"0"+minute)+""+(second>10?second:"0"+second);
	    }
	 /**
	  * 产生随机数
	  * @return
	  */
		 public static int getRandom(){
			  int res= (int)(Math.random()*100);
			  return res;
		 }
	  /**
	   * 截取文件后缀
	   * @param filename
	   * @return
	   */
		 public static String getExtension(String filename){
				String fileExtension= filename.substring((filename.lastIndexOf(".")+1));
				return  fileExtension;
				 
		 } 
		 
}
