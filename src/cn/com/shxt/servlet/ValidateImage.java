/**
 * 
 */
package cn.com.shxt.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Administrator wangzongchao
 * @create date 2013-4-26
 * @version V 1.0
 * 输出一张带有验证码的随机图片
 */
public class ValidateImage extends HttpServlet {
 
	private static final long serialVersionUID = -3736034264621006342L;
	//指定宽和高
	private static final  int WIDTH=110;
	private static final  int HEIGHT=26;
	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//通过BufferedImage 在内存构建一副图片
		BufferedImage image=new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		
		//得到图形,图行得到后就可以像图形上写随机数了
		Graphics2D g=(Graphics2D) image.getGraphics();
		
		//1,设置图形背景色
		setBackGround(g);
		
		//2，设置图形边框
		setBorder(g);
		
		
		//3,画图形干扰线
		drawRandomLine(g);
		
		
		//【方式1：汉字验证码】4,向图形上写随机汉字 
		 //String validateCode=drawRandomNum(g);
		
		//【方式2：数字验证码】4,向图形上写随机数
		String validateCode=draw_RandomNum(g);
		//【注意：此处将产生的随机数封装到了session，要判断客户端输入的验证码正确与否，直接通过session获取生成的验证码的值，在此处服务端验证】
		request.getSession().setAttribute("validateCode", validateCode);
	
		//5，将图形写给浏览器
		response.setContentType("image/jpeg");//通知浏览器以图形方式打开
		//发头设置浏览器不要缓存产生的图片
		response.setDateHeader("expries", -1);
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		ImageIO.write(image, "jpg", response.getOutputStream());
	//	request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * 设置显示图形的背景颜色
	 * @param g
	 */
	private void setBackGround(Graphics g) {
		//白色
		g.setColor(Color.WHITE);
		//填充
		g.fillRect(0, 0, WIDTH, HEIGHT);
		
	}

	/**
	 * 设置图形的边框
	 * @param g
	 */
	private void setBorder(Graphics g) {
		 g.setColor(Color.BLUE);
		 
		 g.drawRect(1,1,WIDTH-2,HEIGHT-2);
	}

	/**
	 * 设置图形干扰线
	 * @param g
	 */
	private void drawRandomLine(Graphics g) {
	  g.setColor(Color.GREEN);
	  //画几条干扰线
	  for(int i=0;i<5;i++){
		 
		//生成在图形长宽范围内的坐标
		int x1=  new Random().nextInt(WIDTH);
		int y1=  new Random().nextInt(HEIGHT);
		
		int x2=  new Random().nextInt(WIDTH);
		int y2=  new Random().nextInt(HEIGHT);
		
		g.drawLine(x1, y1, x2, y2);
		 
	  }
		
	}

	/**
	 * 向图形上写文字
	 * @param g
	 * @return 产生的随机验证码
	 */
	private String drawRandomNum(Graphics2D g) {
		//设置文字颜色
		 g.setColor(Color.RED);
		 
		 g.setFont(new Font("宋体",Font.BOLD,15));
		  
		 String baseCode="\u7684\u4e00\u4e86\u662f\u6211\u4e0d\u5728\u4eba\u4eec\u6709\u6765\u4ed6\u8fd9\u4e0a\u7740\u4e2a\u5730\u5230\u5927\u91cc\u8bf4\u5c31\u53bb\u5b50\u5f97"+
		 "\u4e5f\u548c\u90a3\u8981\u4e0b\u770b\u5929\u65f6\u8fc7\u51fa\u5c0f\u4e48\u8d77\u4f60\u90fd\u628a\u597d\u8fd8\u591a\u6ca1\u4e3a\u53c8\u53ef\u5bb6\u5b66"+
		 
		 "\u53ea\u4ee5\u4e3b\u4f1a\u6837\u5e74\u60f3\u751f\u540c\u8001\u4e2d\u5341\u4ece\u81ea\u9762\u524d\u5934\u9053\u5b83\u540e\u7136\u8d70\u5f88\u50cf\u89c1"+
		 
		 "\u4e24\u7528\u5979\u56fd\u52a8\u8fdb\u6210\u56de\u4ec0\u8fb9\u4f5c\u5bf9\u5f00\u800c\u5df1\u4e9b\u73b0\u5c71\u6c11\u5019\u7ecf\u53d1\u5de5\u5411\u4e8b"+
		 
		"\u547d\u7ed9\u957f\u6c34\u51e0\u4e49\u4e09\u58f0\u4e8e\u9ad8\u624b\u77e5\u7406\u773c\u5fd7\u70b9\u5fc3\u6218\u4e8c\u95ee\u4f46\u8eab\u65b9\u5b9e"+
		 
		 "\u5403\u505a\u53eb\u5f53\u4f4f\u542c\u9769\u6253\u5462\u771f\u5168\u624d\u56db\u5df2\u6240\u654c\u4e4b\u6700\u5149\u4ea7\u60c5\u8def\u5206\u603b\u6761"+
		 
		 "\u767d\u8bdd\u4e1c\u5e2d\u6b21\u4eb2\u5982\u88ab\u82b1\u53e3\u653e\u513f\u5e38\u6c14\u4e94\u7b2c\u4f7f\u5199\u519b\u5427\u6587\u8fd0\u518d\u679c";
		 
		 
		 //向图形上显示几个文字，就循环几次
		 int x=3;
		 String validateCode="";
		 for (int i = 0; i <4; i++) {
			 //随机获取4个汉字
			String ch=  baseCode.charAt(new Random().nextInt(baseCode.length()))+"";
			validateCode+=ch;
			 int degree=new Random().nextInt()%30;//生成-30~30之间的随机数
			 g.rotate(degree*Math.PI/180,x,10);//设置旋转的角度
			 g.drawString(ch,x, 18);//18为显示的文字距离图像上方的距离
			 g.rotate(-degree*Math.PI/180,x,10);
		     x+=30;
		}
		 System.out.println("本次产生的验证码："+validateCode);
		 return validateCode;
	}

	
	/**
	 * 向图形上写数字 
	 * @param g
	 * @return 产生的随机验证码
	 */
	private String draw_RandomNum(Graphics2D g) {
		//设置文字颜色
		 g.setColor(Color.RED);
		 
		 g.setFont(new Font("宋体",Font.BOLD,15));
		  
		 
		 //向图形上显示几个文字，就循环几次
		 int x=3;
		 String validateCode="";
		 for (int i = 0; i <4; i++) {
			 //随机获取4个数字
			//String ch=  baseCode.charAt(new Random().nextInt(baseCode.length()))+"";
			 int maxNum=8;
			 int minNum=1;
			 String ch=String.valueOf((Math.round(Math.random()*(maxNum-minNum+1)+minNum)));
			 validateCode+=ch;
			 int degree=new Random().nextInt()%30;//生成-30~30之间的随机数
			 g.rotate(degree*Math.PI/180,x,10);//设置旋转的角度
			 g.drawString(ch,x, 18);//18为显示的文字距离图像上方的距离
			 g.rotate(-degree*Math.PI/180,x,10);
		     x+=30;
		}
		 System.out.println("本次产生的验证码："+validateCode);
		 return validateCode;
	}
	 
}
