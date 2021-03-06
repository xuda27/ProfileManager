<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="profileList" title="人员列表" 
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/profile/list',method:'get',pageSize:20,toolbar:toolbar">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'id',width:60">人员ID</th>
        	<th data-options="field:'name',width:60">姓名</th>
            <th data-options="field:'birthday',width:60">生日</th>
            <th data-options="field:'gender',width:50">性别</th>
            <th data-options="field:'career',width:70">职业</th>
            <th data-options="field:'address',width:70,align:'right'">地址</th>
            <th data-options="field:'mobile',width:100">手机</th>
        </tr>
    </thead>
</table>
<!-- 人员修改表  -->
<div id="profileEditWindow" class="easyui-window" title="人员修改" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:30%;height:55%;padding:10px;">
	<form id="profileEditForm" method="post">  
    <div style="text-align:center;padding:5px">  
        <label for="id">编号:</label>  
        <input class="easyui-numberbox" type="text" name="id" data-options="required:false" readonly="readonly"/>  
    </div>  
    <div style="text-align:center;padding:5px">  
        <label for="name">姓名:</label>  
        <input class="easyui-validatebox" type="text" name="name" data-options="required:true" />  
    </div>  
    <div style="text-align:center;padding:5px">  
        <label for="birthday">生日:</label>  
        <input class="easyui-validatebox" type="text" name="birthday" data-options="required:true" />  
    </div>
    <div style="text-align:center;padding:5px">  
        <label for="gender">性别:</label>
        <select class="easyui-combobox" name="gender">
        	<option value="男">男</option>
        	<option value="女">女</option>
        </select>
    </div>
    <div style="text-align:center;padding:5px">  
        <label for="career">职业:</label>  
        <input class="easyui-validatebox" type="text" name="career" data-options="required:true" />  
    </div>
    <div style="text-align:center;padding:5px">  
        <label for="address">地址:</label>  
        <input class="easyui-validatebox" type="text" name="address" data-options="required:true" />  
    </div>
    <div style="text-align:center;padding:5px">  
        <label for="mobile">手机:</label>  
        <input class="easyui-validatebox" type="text" name="mobile" data-options="required:true" />  
    </div>
</form>
<div style="text-align:center;padding:5px">
	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitEditForm()">提交</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearEditForm()">重置</a>
</div>  
</div>
<!-- 人员新增窗口  -->
<div id="profileAddWindow" class="easyui-window" title="人员新增" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:30%;height:55%;padding:10px;">
	<form id="profileAddForm" method="post">  
    <div style="text-align:center;padding:5px">  
        <label for="id">编号:</label>  
        <input class="easyui-numberbox" type="text" name="id" data-options="required:false"/>  
    </div>  
    <div style="text-align:center;padding:5px">  
        <label for="name">姓名:</label>  
        <input class="easyui-validatebox" type="text" name="name" data-options="required:true" />  
    </div>  
    <div style="text-align:center;padding:5px">  
        <label for="birthday">生日:</label>  
        <input class="easyui-validatebox" type="text" name="birthday" data-options="required:true" />  
    </div>
    <div style="text-align:center;padding:5px">  
        <label for="gender">性别:</label>
        <select class="easyui-combobox" name="gender">
        	<option value="男">男</option>
        	<option value="女">女</option>
        </select>
    </div>
    <div style="text-align:center;padding:5px">  
        <label for="career">职业:</label>  
        <input class="easyui-validatebox" type="text" name="career" data-options="required:true" />  
    </div>
    <div style="text-align:center;padding:5px">  
        <label for="address">地址:</label>  
        <input class="easyui-validatebox" type="text" name="address" data-options="required:true" />  
    </div>
    <div style="text-align:center;padding:5px">  
        <label for="mobile">手机:</label>  
        <input class="easyui-validatebox" type="text" name="mobile" data-options="required:true" />  
    </div>
</form>
<div style="text-align:center;padding:5px">
	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitAddForm()">提交</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearAddForm()">重置</a>
</div>  
</div>
<script>
    function submitEditForm(){
		//有效性验证
		if(!$('#profileEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$.post("/profile/update", $("#profileEditForm").serialize(), function(data){
			if(data && data.status == 200){
				$.messager.alert('提示','修改人员成功!');
				clearEditForm();
				$("#profileEditWindow").window("close");
				$("#profileList").datagrid("reload"); 
			}else{
				$.messager.alert('出错','修改人员失败!');
			}
		});
	}
	function clearEditForm(){
		$('#profileEditForm').form('clear');
	}
	
	function submitAddForm(){
		//有效性验证
		if(!$('#profileAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$.post("/profile/insert", $("#profileAddForm").serialize(), function(data){
			if( data && data.status == 200){
				$.messager.alert('提示','新增人员成功!');
				clearAddForm();
				$("#profileAddWindow").window("close");
				$("#profileList").datagrid("reload"); 
			}else{
				$.messager.alert('出错','新增人员失败!');
			}
		});
	}
	function clearAddForm(){
		$('#profileAddForm').form('clear');
	}
	
    function getSelectionsIds(){
    	var profileList = $("#profileList");
    	var sels = profileList.datagrid("getSelections"); // 返回所有被选择的行，当没有记录被选择时，将返回一个空数组。
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(","); // 元素是通过指定的分隔符进行分隔的。
    	return ids;
    }
    
    var toolbar = [{
        text:'新增',
        iconCls:'icon-add',
        handler:function(){
        	$("#profileAddWindow").window("open");
        }
    },{
        text:'修改',
        iconCls:'icon-edit',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','必须选择一个人员才能修改!');
        		return ;
        	}
        	if(ids.indexOf(',') > 0){
        		$.messager.alert('提示','只能选择一个人员!');
        		return ;
        	}
        	
        	$("#profileEditWindow").window("open").window({
        		onOpen : function(){
        			//回写数据
        			var data = $("#profileList").datagrid("getSelections")[0];
        			$("#profileEditForm").form("load",data);
        		}
        	});
        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中人员!');
        		return ;
        	}
        	$.messager.confirm('确认','确定删除编号为 '+ids+' 的人员吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
                	$.post("/profile/delete",params, function(data){
            			if(data && data.status == 200){
            				/* $.messager.('提示','删除人员成功!',undefined,function(){
            					$("#profileList").datagrid("reload");
            				}); */
            				$.messager.show({
								title:'提示',
								msg:'删除人员成功!',
								timeout:5000,
								showType:'slide'
							});
							$("#profileList").datagrid("reload");
            			} else {
            				$.messager.alert('Warning','GG思密达');  
            			}
            		});
        	    }
        	});
        }
    }];
</script>