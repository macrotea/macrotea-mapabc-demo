package com.mtea.mapabc.service
{
	import com.mapabc.maps.api.MFlexMap;
	import com.mapabc.maps.api.basetypes.MLngLat;
	import com.mapabc.maps.api.overlays.MCircle;
	import com.mapabc.maps.api.overlays.options.MAreaOptions;
	import com.mapabc.maps.api.styles.MFillStyle;
	import com.mapabc.maps.api.styles.MLineStyle;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * 报警覆盖物服务 
	 */	
	public class MapAlarmOverlayService
	{
		/**
		 * 默认圆圈名字 
		 */		
		public static const DEFAULT_CIRCLE_NAME:String = "circle";
		
		/**
		 * 默认圆圈半径大小 
		 */	
		public static const DEFAULT_RADIUS:uint = 60;
		
		/**
		 * 默认闪烁次数
		 */	
		public static const DEFAULT_BLINK_TOTAL:uint = 5;
		
		/**
		 * 地图
		 */	
		private var _map:MFlexMap;
		
		/**
		 * 圆中心 
		 */		
		private var _circleCenter:MLngLat;
		
		/**
		 * 二参构造 
		 * @param map
		 * @param circleCenter
		 * 
		 */		
		public function MapAlarmOverlayService(map:MFlexMap,circleCenter:MLngLat)
		{
			this._map = map;
			this._circleCenter = circleCenter;
		}
		
		/**
		 * 创建圆圈
		 * @param id
		 * @param radius
		 * @return 
		 * 
		 */		
		public function createCircle(id:String,radius:uint):MCircle {
			var areopt:MAreaOptions=new MAreaOptions();
			var mlstyle:MLineStyle = new MLineStyle();
			//边线宽度
			mlstyle.thickness = 5;
			//边线颜色
			mlstyle.color = 0xCC0000;
			//1表示不透明;0表示透明
			mlstyle.alpha = 1;
			areopt.areaStyle.borderStyle= mlstyle;
			
			/*无填充*/
			var mfstyle:MFillStyle=new MFillStyle();
			//定义填充颜色
			//mfstyle.color=0xFFF886;
			//1表示不透明;0表示透明
			mfstyle.alpha = 0;
			areopt.areaStyle.fillStyle = mfstyle;
			
			//设置是否圆形高亮显示属性
			//areopt.isDimorphic=true;
			//设置圆形在7，8，9，10缩放级别下显示
			//areopt.zoomLevels=[7,8,9,10];
			
			//设置圆心坐标
			var arr:Array = new Array();
			arr.push(this._circleCenter);
			
			//新建圆形对象
			var circle:MCircle=new MCircle(arr,radius,areopt);
			circle.id=id;
			
			return circle;
		}
		
		/**
		 * 定位圆圈 
		 * @return 
		 */		
		public function locateCircle():void {
			var circle:MCircle = createCircle(DEFAULT_CIRCLE_NAME,DEFAULT_RADIUS);
			
			//添加显示
			this._map.addOverlay(circle,true);
		}
		
		/**
		 * 显示圆圈 
		 * @return 
		 */		
		public function showCircle():void {
			this._map.setOverlayVisibleById(DEFAULT_CIRCLE_NAME,true);
		}
		
		/**
		 * 移除圆圈 
		 * @return 
		 */		
		public function removeCircle():void {
			this._map.removeOverlay(this._map.getOverlayById(DEFAULT_CIRCLE_NAME));
		}
		
		/**
		 * 隐藏圆圈 
		 * @return 
		 */		
		public function hideCircle():void {
			//this._map.removeOverlay(this._map.getOverlayById(DEFAULT_CIRCLE_NAME));
			this._map.setOverlayVisibleById(DEFAULT_CIRCLE_NAME,false);
		}
		
		/**
		 * 开始闪烁定时器
		 * @return 
		 */		
		public function startBlinkTime(blinkTotal:int=5):void {
			if(!blinkTotal) blinkTotal= DEFAULT_BLINK_TOTAL;
			
			//首次显示园,然后通过定时器来不断显示和隐藏圆,达到闪烁的效果
			locateCircle();
			
			var showTimer:Timer = new Timer(400, blinkTotal);
			showTimer.addEventListener(TimerEvent.TIMER, showHandler);
			showTimer.start();
			
			var hideTimer:Timer = new Timer(600, blinkTotal);
			hideTimer.addEventListener(TimerEvent.TIMER, hideHandler);
			hideTimer.start();
		}
		
		/**
		 * 当显示时处理 
		 * @param e
		 * 
		 */		
		private function showHandler(e:TimerEvent):void {
			showCircle();
		}
		
		/**
		 * 当移除时处理 
		 * @param e
		 * 
		 */		
		private function hideHandler(e:TimerEvent):void {
			hideCircle();
		}
	}
}