package cn.com.shxt.service;


import java.util.List;
import java.util.Map;

import cn.com.shxt.dao.GoodsDao;
import cn.com.shxt.model.GoodsInfo;
import cn.com.shxt.utils.DBUtil;

public class GoodsService implements GoodsDao {
	DBUtil dbUtil=new DBUtil();

	@Override
	public boolean addGoods(GoodsInfo goods) {
		// TODO Auto-generated method stub
		 String sql="insert into SHOPGOODS (ID,GOODSNAME,CATEGORY,PRICE,UPDATE_,DISCOUNT,STATE,PROAREA,NUM,IMG,PINPAI,FIRSTPRICE,COLOR,GUIGE,INFO,CHILDCATE)" +
		 		"values(goods.nextval,'"+goods.getGoodsName()+"','"+goods.getCategory()+"','"+goods.getPrice()+"','"+goods.getUpdate_()+"','"+goods.getDiscount()+"','待上架','"+goods.getProArea()+"','"+goods.getNum()+"','"+goods.getImg()+"','"+goods.getPinpai()+"','"+goods.getFirstPrice()+"'," +
		 				"'"+goods.getColor()+"','"+goods.getGuige()+"','"+goods.getInfo()+"','"+goods.getChildcate()+"')";
		 int res= dbUtil.update(sql);
		 if(res==1){
		  return true;
		 }
		  return false;
	}

	@Override
	public String getProvince(String provinceId) {
		
		String sql = "select PROVINCE from PROVINCE t where PROVINCEID='"+provinceId+"'";
		List<Map<String, String>>  proList = dbUtil.queryByList(sql);
		String province = proList.get(0).get("PROVINCE").toString();
		return province;
		
	}


	@Override
	public String getCity(String cityId) {
		String city="";
		String sql = "select CITY from CITY t where CITYID='"+cityId+"'";
		List<Map<String, String>>  cityList = dbUtil.queryByList(sql);
		if(cityList.size()==0) {
			city=" ";
		} else {
			
			city = cityList.get(0).get("CITY").toString();
		}
		return city;
		
	}
	@Override
	public String getArea(String areaId) {
		String area="";
		String sql = "select AREA from AREA t where AREAID='"+areaId+"'";
		List<Map<String, String>>  areaList = dbUtil.queryByList(sql);
		if(areaList.size()==0) {
		area=" ";	
		} else{
			
		area = areaList.get(0).get("AREA").toString();
		}
		return area;
		
	}
	@Override
	public List<Map<String, String>> query(String sql) {
		// TODO Auto-generated method stub
		List<Map<String, String>>  resList=	dbUtil.queryByList(sql);
		return resList; 
	}

	@Override
	public int updateGoodsCar(String sql) {
		int i = dbUtil.update(sql);
		return i;
		
	}


	@Override
	public boolean updateGoods(GoodsInfo goodsInfo,String id) {
		// TODO Auto-generated method stub
		String sql = "update shopgoods set GOODSNAME='"+goodsInfo.getGoodsName()+"',CATEGORY='"+goodsInfo.getCategory()+"',PRICE='"+goodsInfo.getPrice()+"'," +
				"UPDATE_='"+goodsInfo.getUpdate_()+"',DISCOUNT='"+goodsInfo.getDiscount()+"',PROAREA='"+goodsInfo.getProArea()+"',NUM='"+goodsInfo.getNum()+"',IMG='"+goodsInfo.getImg()+"',PINPAI='"+goodsInfo.getPinpai()+"'," +
				"FIRSTPRICE='"+goodsInfo.getFirstPrice()+"',COLOR='"+goodsInfo.getColor()+"',GUIGE='"+goodsInfo.getGuige()+"',INFO='"+goodsInfo.getInfo()+"' where ID='"+id+"'";
		int i = dbUtil.update(sql);
		if(i==1) {
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	public int[] changeNum(String[] sqls) {
		int[] i = dbUtil.updateBatch(sqls);
		return i ;
	}

}
