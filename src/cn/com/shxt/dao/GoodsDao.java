package cn.com.shxt.dao;

import java.util.List;
import java.util.Map;

import cn.com.shxt.model.GoodsInfo;



public interface GoodsDao {
	/**
	 * @author 黄威威
	 * @说明 增加货物
	 * @return false代表添加失败，true 代表成功
	 */
	public boolean addGoods(GoodsInfo goods);
	
	/**
	 * @黄威威 Administrator
	 * @说明： 获取省份
	 * @return 一个String 代表所要查的
	 */
	public String getProvince(String provinceId);
	
	/**
	 * @黄威威 Administrator
	 * @说明： 获取市
	 * @return 一个String 代表所要查的
	 */
	public String getCity(String cityId);
	
	/**
	 * @黄威威 Administrator
	 * @说明： 获取县
	 * @return 一个String 代表所要查的
	 */
	public String getArea(String areaId);
	/**
	 * @黄威威 Administrator
	 * @说明： 查询语句
	 * @return 返回一个查询的list集合
	 */
	public List<Map<String, String>> query(String sql);
	
	/**
	 * @黄威威 Administrator
	 * @说明： 修改语句
	 * @return 返回1 成功，返回0 失败
	 */
	public int updateGoodsCar(String sql);
	
	/**
	 * @黄威威 Administrator
	 * @说明： 修改语句，带参数的
	 * @return 返回false:失败，true:成功
	 */
	public boolean updateGoods(GoodsInfo goodsInfo,String id);
	
	/**
	 * @黄威威 Administrator
	 * @说明： 批量修改 
	 * @return 修改几条语句就返回几，返回0，代表没有语句更改
	 */
	public int[] changeNum(String[] sqls);

}
