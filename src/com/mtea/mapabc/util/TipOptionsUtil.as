package com.mtea.mapabc.util
{
	import com.mapabc.maps.api.overlays.options.MTipOptions;
	import com.mapabc.maps.api.styles.MLineStyle;
	import com.mapabc.maps.api.styles.MFontStyle;
	import com.mapabc.maps.api.styles.MFillStyle;
	/**
	 * 标注提示窗口样式设置工具类
	 * 作者: LiangQiYe
	 * 版本: 1.0
	 * 日期: 2012-3-13
	 * 说明:
	 */
	public final class TipOptionsUtil
	{
		public function TipOptionsUtil()
		{
		}
		/**
		 * 获得默认的标注提示窗口样式且设置标题和内容
		 */
		public static function getDefaultTipOptions(title:String,content:String):MTipOptions {
			var tipOptions:MTipOptions=new MTipOptions();
			tipOptions.hasShadow=true;//设置tip有阴影
			tipOptions.roundRectSize=5;//设置tip圆边长度
			var borderStyle:MLineStyle=new MLineStyle();//设置tip边框样式
			borderStyle.color=0x005890;
			borderStyle.thickness=2;
			tipOptions.borderStyle=borderStyle;
			
			tipOptions.title=title;//设置tip标题
			var titleFontStyle:MFontStyle=new MFontStyle();//设置tip标题字体
			titleFontStyle.color=0XFFFFFF;
			titleFontStyle.size=14;
			titleFontStyle.name="Arial";
			titleFontStyle.bold=true;
			tipOptions.titleFontStyle=titleFontStyle;
			
			var titleFillStyle:MFillStyle=new MFillStyle();//设置tip标题填充色
			titleFillStyle.color=0x005890;
			tipOptions.titleFillStyle=titleFillStyle;
			tipOptions.content="\n"+content;//设置tip内容
			var contentFontStyle:MFontStyle=new MFontStyle();//设置tip内容字体
			contentFontStyle.color=0x000000;
			contentFontStyle.size=12;
			contentFontStyle.name="宋体";
			contentFontStyle.bold=false;
			tipOptions.contentFontStyle=contentFontStyle;
			
			var contentFillStyle:MFillStyle=new MFillStyle();//设置tip内容填充色
			contentFillStyle.color=0xFFFFFF;
			tipOptions.fillStyle=contentFillStyle;
			
			return tipOptions;
		}
	}
}