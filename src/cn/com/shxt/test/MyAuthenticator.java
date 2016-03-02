package cn.com.shxt.test;

import javax.mail.*;

public class MyAuthenticator extends Authenticator {
	String userName = "viviant";
	String password = "1224";

	public MyAuthenticator() {
	}

	public MyAuthenticator(String username, String password) {
		this.userName = username;
		this.password = password;
	}

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(userName, password);
	}
}