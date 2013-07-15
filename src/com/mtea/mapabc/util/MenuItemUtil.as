package com.mtea.mapabc.util
{
	import com.mapabc.maps.api.MFlexMap;
	import com.mapabc.maps.api.MMenuItem;
	import com.mapabc.maps.api.core.MMap;
	import com.mapabc.maps.api.overlays.MMarker;

	public final class MenuItemUtil
	{
		public function MenuItemUtil()
		{
		}
		
		public static function setupMenuItemsForMarker(labelArray:Array,mapObj:MFlexMap,func:Function):void {
			var menuItemArray:Array=new Array();
			for(var i:int=0;i<labelArray.length;i++){
				var menuItem:MMenuItem=new MMenuItem();
				menuItem.menuType="classMenu";;
				//只为标注添加菜单
				menuItem.objectType= MMarker.TYPE_NAME;
				menuItem.order=(i+1);
				menuItem.menuText=labelArray[i];
				menuItem.functionName=func;
				menuItem.id=labelArray[i];
				menuItem.isEnabled=true;
				menuItem.isHaveSeparator=false;
				menuItemArray.push(menuItem);
			}
			mapObj.addMenuItems(menuItemArray);
		}
		
		public static function setupMenuItemsForMap(labelArray:Array,mapObj:MFlexMap,func:Function):void {
			var menuItemArray:Array=new Array();
			for(var i:int=0;i<labelArray.length;i++){
				var menuItem:MMenuItem=new MMenuItem();
				menuItem.menuType="classMenu";;
				//只为地图添加菜单
				menuItem.objectType= "";
				menuItem.order=(i+1);
				menuItem.menuText=labelArray[i];
				menuItem.functionName=func;
				menuItem.id=labelArray[i];
				menuItem.isEnabled=true;
				menuItem.isHaveSeparator=false;
				menuItemArray.push(menuItem);
			}
			mapObj.addMenuItems(menuItemArray);
		}

	}
}