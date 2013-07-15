package com.mtea.mapabc.util
{
	import com.mapabc.maps.api.MFlexMap;
	import com.mapabc.maps.api.basetypes.MLngLat;
	import com.mapabc.maps.api.core.MMap;
	import com.mapabc.maps.api.overlays.MMarker;
	import com.mtea.mapabc.util.Printf;
	
	/**
	 * 标注工具类
	 * 作者: LiangQiYe
	 * 版本: 1.0
	 * 日期: 2012-4-24
	 * 说明: 
	 */
	public class MarkerUtil
	{
		public function MarkerUtil()
		{
		}
		/**
		 * 根据MMarker对象获得经纬度值拼凑而成的唯一Id值
		 */
		public static function getId(marker:MMarker):String
		{
			if(marker==null){
				ErrorUtil.throws("根据MMarker对象获得经纬度值拼凑而成的唯一Id值时,MMarker对象为Null");
			}
			return marker.lnglat.lngX.toString()+":"+marker.lnglat.latY.toString();
		}
		/**
		 * 根据MMarker对象获得经纬度值拼凑而成的唯一Id值
		 */
		public static function getId2(lnglat:MLngLat):String
		{
			if(lnglat==null){
				ErrorUtil.throws("根据MMarker对象获得经纬度值拼凑而成的唯一Id值时,lnglat对象为Null");
			}
			return lnglat.lngX.toString()+":"+lnglat.latY.toString();
		}
		/**
		 * 根据MMarker对象获得其基本的描述
		 */
		public static function getDesc(marker:MMarker):String
		{
			if(marker==null){
				ErrorUtil.throws("根据MMarker对象获得其基本的描述时,MMarker对象为Null");
			}
			return Printf("标注[经度=%s,纬度=%s]",marker.lnglat.lngX.toString(),marker.lnglat.latY.toString());
		}
		/**
		 * 隐藏标注
		 */
		public static function hide(mapAbc:MFlexMap,marker:MMarker):void
		{
			mapAbc.setOverlayVisibleById(getId(marker),false);
		}
		/**
		 * 显示标注
		 */
		public static function show(mapAbc:MFlexMap,marker:MMarker):void
		{
			mapAbc.setOverlayVisibleById(getId(marker),true);
		}
	}
}