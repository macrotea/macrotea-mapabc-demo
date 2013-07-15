package com.mtea.mapabc.util
{
	import mx.controls.Alert;

	/**
	 * 错误工具类
	 * 作者: LiangQiYe
	 * 版本: 1.0
	 * 日期: 2012-3-13
	 * 说明:
	 */
	public final class ErrorUtil
	{
		/**
		 * 抛出异常信息
		 */
		public static function throws(message:String,isAlert:Boolean=false):void
		{
			if(isAlert) Alert.show(message,"异常信息通过ErrorUtil工具类抛出");
			trace("ErrorUtil.throws()提示信息："+message);
			throw new Error(message);
		}
	}
}