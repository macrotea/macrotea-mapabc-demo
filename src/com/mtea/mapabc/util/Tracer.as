package com.mtea.mapabc.util
{
	import com.demonsters.debugger.MonsterDebugger;
	import com.demonsters.debugger.MonsterDebuggerFlex;
	import com.mtea.mapabc.util.Printf;
	
	import mx.controls.Alert;
	import mx.formatters.DateFormatter;
	
	/**
	 * (地图)调试信息类
	 * 作者: LiangQiYe
	 * 版本: 1.0
	 * 日期: 2012-3-13
	 * 说明:
	 */
	public final class Tracer
	{
		//首次类功能描述
		public static var descOnce:Boolean=true;
		public static var descText:String=
			"*************************************************************************************\n" +
			"LiangQiYe: Tracer为调试信息类,在发布阶段可以设置Tracer.enable=false;从而关闭调试信息\n" +
			"*************************************************************************************";
		
		//是否启用
		public static var enable:Boolean=true;
		
		//日期格式化
		private static var dateFormatter:DateFormatter=new DateFormatter();
		private static var PATTERN:String="MM-DD JJ:NN:SS";
		
		//定义调试信息模板
		private static const TRACE_USERNAME:String="LiangQiYe"
		private static const TRACE_MODULE:String="Map"
		private static const TRACE_TEMPLATE:String="[%s-%s-%s] %s %s"
		private static var mdObject:Object=new Object();
		
		public function Tracer(){}
		
		/**
		 * 调试信息输出
		 */
		public static function debug(msg:String,target:Object=null,isAlert:Boolean=false):void
		{
			if(descOnce){
				trace(descText);
				//提示Arthropod配置成功
				Debug.log("已经启用Arthropod调试监控");
				//提示MonsterDebugger配置成功
				
				mdebug("已经启用MonsterDebugger调试监控")
				descOnce=false;
			}
			
			dateFormatter.formatString=PATTERN;
			if(enable){
				trace(Printf(TRACE_TEMPLATE,TRACE_USERNAME,"Debug",TRACE_MODULE,dateFormatter.format(new Date()),msg));
				Debug.log(msg);
				mdebug(msg,target);
				if(isAlert){
					Alert.show(msg);
				}
			}
		}
		/**
		 * 调试信息输出
		 */
		public static function mdebug(msg:String,target:Object=null):void
		{
			if(target) 	{MonsterDebugger.initialize(target);MonsterDebugger.trace(target,msg);}
			else		{MonsterDebugger.initialize(Tracer.mdObject);MonsterDebugger.trace(Tracer.mdObject,msg);}
		}
		
		
	}
}