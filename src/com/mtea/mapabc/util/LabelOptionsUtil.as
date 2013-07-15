package com.mtea.mapabc.util
{
	/**
	 * 文本标签样式设置工具类
	 * 作者: LiangQiYe
	 * 版本: 1.0
	 * 日期: 2012-4-28
	 * 说明:
	 */
	public class LabelOptionsUtil
	{
		public function LabelOptionsUtil()
		{
		}
		/**
		 * 获得默认的文本标签样式
		 */
		public static function getDefaultLabelOptions(content:String):MTipOptions {
			var labelOptions:MLabelOptions=new MLabelOptions();
			
			var fontstyle:MFontStyle = new MFontStyle();
			fontstyle.name="Arial"
			fontstyle.size=15;
			fontstyle.color= 0x0000ff;
			fontstyle.bold=false;
			labelOptions.fontStyle= fontstyle;
			
			labelOptions.alpha=0.7;
			labelOptions.content=content;
			labelOptions.hasBackground=true;
			labelOptions.hasBorder=true;
			labelOptions.borderColor=0x0000ff;
			labelOptions.backgroundColor=0xffffff;
			return labelOptions;
		}
	}
}