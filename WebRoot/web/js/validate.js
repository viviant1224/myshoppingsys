
	function validateUserName(userName,label) {
		
	if(userName.trim()=="") {
		
		document.getElementById(label).innerHTML="<font color = 'red'>"+"用户名不能为空"+"</font>";
			return false;
		} else if(!isNaN(userName)){
				
			document.getElementById(label).innerHTML="<font color = 'red'>"+"用户名不能全为数字"+"</font>";
			return false;
		
			} else if(userName.length<5){
				document.getElementById(label).innerHTML="<font color = 'red'>"+"字符长度不得小于"+"</font>";
				return false;
				
				
				} else {
					document.getElementById(label).innerHTML="<font color = 'green'>"+"用户名合法"+"</font>";
					return true;
					}
	}
	
	
	
	function validatepassword(password,label) {
		
		if(password.trim()=="") {
			document.getElementById(label).innerHTML="<font color = 'red'>"+"密码不能为空"+"</font>";
			return false;
			} else {
				document.getElementById(label).innerHTML="<font color = 'green'>"+"密码合法"+"</font>";
				return true;
				}
		
		
		}
		
	function validateage(age,label) {
			
			if(age.trim()=="") {
			
				document.getElementById(label).innerHTML="年龄输入不能为空！";
				return false;
				} else if(isNaN(age)) {
					document.getElementById(label).innerHTML="年龄只能为数字！";
				return false;
					} else if(age<0||age>120) {
						document.getElementById(label).innerHTML="请输入年龄的合法范围（1··120）！";
				return false;
						} else {
							
								document.getElementById(label).innerHTML="输入正确！";
				return true;
							}
		}
	
	
	function validatetel(tel,label) {
		
		
		var reg = new RegExp("[1][358][0-9]{9}$");
		
		var boolean=reg.test(tel);
		if(boolean) {
			document.getElementById(label).innerHTML="<font color = 'green'>"+"电话号码合法"+"</font>";
			return true;
			} else {
				
				document.getElementById(label).innerHTML="<font color = 'red'>"+"电话号码输入有误！"+"</font>";
				return false;
				}
		
		}
	function validateQQ(qq,label) {
		var reg = new RegExp("^[1-9][0-9]{4,10}$");
		var boolean = reg.test(qq);
		if(boolean) {
			document.getElementById(label).innerHTML="<font color = 'green'>"+"qq号码合法"+"</font>";
			return true;
			} else {
				
				document.getElementById(label).innerHTML="<font color = 'red'>"+"qq号码输入有误！"+"</font>";
				return false;
				}
		
		}
	 function regIsEmail(email,label)
        {
            var reg = new RegExp("^[0-9a-zA-Z]+@[0-9a-zA-Z]+[\.]{1}[0-9a-zA-Z]+[\.]?[0-9a-zA-Z]+$");
            var boolean = reg.test(email);
			if(boolean) {
			document.getElementById(label).innerHTML="<font color = 'green'>"+"邮箱合法"+"</font>";
			return true;
			} else {
				
				document.getElementById(label).innerHTML="<font color = 'red'>"+"邮箱格式错误！"+"</font>";
				return false;
				}
			
        }
		
		function validateGoodsName (goodsName) {
				
			if(goodsName.trim()=="") {
				alert("商品名不能为空");
		//document.getElementById(label).innerHTML="<font color = 'red'>"+"用户名不能为空"+"</font>";
				return false;
				} else if(!isNaN(userName)){
				alert("商品名不能全为数字");	
				//document.getElementById(label).innerHTML="<font color = 'red'>"+"用户名不能全为数字"+"</font>";
				return false;
		
				} else if(userName.length<5){
					alert("字符长度不得小于5");
					//document.getElementById(label).innerHTML="<font color = 'red'>"+"字符长度不得小于5"+"</font>";
					return false;
				
				
					} else {
					//document.getElementById(label).innerHTML="<font color = 'green'>"+"用户名合法"+"</font>";
						return true;
						}			
				}
		function validateDiscount(discount) {
			if(discount<0) {
				alert("折扣不合法(0-10折之间)")
				return false;
				} else if(discount>10) {
					alert("折扣不合法(0-10折之间)")
					return false;
					}  else {
						return true;
						}
			}
			
		function validateCategory(category) {
					if(category.trim()=="") {
				alert("类别不能为空");
				return false;
				} else {
					return true;
					}
				}
		function validateUpdate_(update_) {	
			if(update_.trim()=="") {
				alert("出产日期不能为空");
				return false;
				} else {
					return true;
					}
		}	
		
		function validateFirstPrice(firstPrice){
			if(firstPrice.trim=="") {
				alert("进价不能为空");
				return false;
				} else if(isNaN(firstPrice)){
					alert("进价只能为数字");
				return false;
					
					} else if(firstPrice<0) {
						
						alert("进价不合法");
				return false;
						} else {
							
							
							return true;
							}
			}	
			
				function validatePrice(price){
			if(price.trim=="") {
				alert("售价不能为空");
				return false;
				} else if(isNaN(price)){
					alert("售价只能为数字");
				return false;
					
					} else if(price<0) {
						
						alert("售价不合法");
				return false;
						} else {
							
							
							return true;
							}
			}	
		function validateZipcode(zipcode,label) {
					
					var reg = /^\d+$/;
					if (!reg.test(zipcode))  {
						document.getElementById(label).innerHTML="<font color = 'red'>"+"邮编格式错误！"+"</font>";
						return false;	
					}else if (zipcode.length != 6) {
						document.getElementById(label).innerHTML="<font color = 'red'>"+"邮政编码长度必须是6位！"+"</font>";
						// alert("邮政编码长度必须是6位");
						return false;
					} else {
						document.getElementById(label).innerHTML="<font color = 'red'>"+""+"</font>";
						return true;
					}
					
					
				}

				