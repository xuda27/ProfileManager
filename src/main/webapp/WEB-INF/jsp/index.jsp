<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人员管理系统</title>
<link rel="stylesheet" type="text/css"
	href="js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="js/jquery-easyui-1.4.1/themes/icon.css" />
<script type="text/javascript"
	src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',title:'人员管理系统',split:close"
		style="height: 100px;"></div>
	<div data-options="region:'south',title:'South Title',split:close"
		style="height: 100px;">
		<p>达达软件科技有限公司 &copy;<span>版权所有</span></p>	
	</div>
	<div
		data-options="region:'east',iconCls:'icon-reload',title:'帮助',split:close"
		style="width: 100px;"></div>
	<div data-options="region:'west',title:'菜单',split:true"
		style="width: 100px;">
		<ul id="menu" class="easyui-tree" style="margin-top: 10px;margin-left: 5px;">
         	<li>
         		<span>人员管理</span>
         		<ul>
	         		<li data-options="attributes:{'url':'profile-list'}">人员管理</li>
	         	</ul>
         	</li>
         </ul>
    </div>
	</div>
	<div data-options="region:'center',title:'详细内容'"
		style="padding: 5px; background: #eee;">
		<div id="tabs" class="easyui-tabs">
		    <div title="首页" style="padding:20px;">
		        	
		    </div>
		</div>
	</div>
	
<script type="text/javascript">
$(function(){
	$('#menu').tree({
		onClick: function(node){
			if($('#menu').tree("isLeaf",node.target)){
				var tabs = $("#tabs");
				var tab = tabs.tabs("getTab",node.text);
				if(tab){
					tabs.tabs("select",node.text);
				}else{
					tabs.tabs('add',{
					    title:node.text,
					    href: node.attributes.url,
					    closable:true,
					    bodyCls:"content"
					});
				}
			}
		}
	});
});
</script>
</body>
</html>