<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="profileList" title="人员列表" 
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/profile/list',method:'get',pageSize:30,toolbar:toolbar">
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
<div id="profileEditWindow" class="easyui-window" title="人员修改" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:50%;height:50%;padding:10px;">
	<form id="profileEditForm" method="post">  
    <div style="text-align:center;padding:5px">  
        <label for="id">编号:</label>  
        <input class="easyui-validatebox" type="text" name="id" data-options="required:false" readonly="readonly"/>  
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
	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
</div>  
</div>
<script>
    function submitForm(){
		$('#profileEditForm').form('submit',{
			url : "profile/update",
			success : function(data){
				if(data.status == 200) {
					$.messager.alert('提示','修改人员成功!',undefined,function(){
            			$("#profileList").datagrid("reload");
            		});
				}
			}
		});
		
	}
	function clearForm(){
		$('#profileEditForm').form('clear');
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
        	$(".tree-title:contains('新增商品')").parent().click();
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
        	
        	$("#profileEditWindow").window({
        		onOpen : function(){
        			//回写数据
        			var data = $("#profileList").datagrid("getSelections")[0];
        			alert(data);
        			$("#profileEditForm").form("load",data);
        		}
        	}).window("open");
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
                	$.post("/rest/item/delete",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','删除商品成功!',undefined,function(){
            					$("#profileList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    }];
</script>