package cn.com.shxt.test;

public class SendMail {

	public void sendPsw(String userAddress,String content,String object){
	 
	MailSenderInfo mailInfo = new MailSenderInfo();
	mailInfo.setMailServerHost("smtp.163.com");
	mailInfo.setMailServerPort("25");
	mailInfo.setValidate(true);
	// 登录邮件发送服务器的用户名和密码
	mailInfo.setUserName("wang_king_123@163.com");
	mailInfo.setPassword("wangking123");
	mailInfo.setFromAddress("wang_king_123@163.com");
	mailInfo.setToAddress(userAddress);
	//主题
	 mailInfo.setSubject(object );
 	//邮件内容
	mailInfo.setContent(content);
	// 这个类主要来发送邮件　　
	SimpleMailSender sms = new SimpleMailSender();
	//sms.sendTextMail(mailInfo);// 发送文体格式
	sms.sendHtmlMail(mailInfo);// 发送HTML格式
	 } 
    }
 