package cn.com.shxt.test;

public class FaSong {
	
	public static void fasong(String email,String userName) {
		
		 System.out.println("邮件发送的地址："+email);
		 System.out.println("userName="+userName);
		 SendMail sendmail=new SendMail();
		 String confrim="尊敬的用户，您正在进行小威少威网上商城系统的个人账户更改操作，如果你确实要更改账户信息，请点击下面链接，否则请" +
		  		"不要做任何处理，系统提醒您：保管好个人用户名和密码，以免泄露信息造成不必要的损失!";
		 String href="确定更改账户信息,请点击下面链接<a target='right' href='http://localhost:8090/myshoppingsys/web/setInfo.jsp'>更改账户信息</a>";
		 String content=confrim+""+href;
		  
	     sendmail.sendPsw(email, content,"小威少威网上商城,账户信息更改（系统邮件，请勿回复）");
	}
	
	public static void main(String[] args) {

	}
  
}
