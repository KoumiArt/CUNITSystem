$.extend($.fn.validatebox.defaults.rules, {
 	userpwd: {
        validator: function (value) {		        
            return $("input[name=loginPwd]").val()==value;
    	},
    	message: '两次输入的密码不一致.'
	}
});
	   
$(function(){
	$("#reg_backId").click(function() {
		$('#win').window('close');
	});
	$("#reg_saveId").click(function() {
		var r = $('#userForm').form('validate');
		if(!r) {
			return false;
		}
		$.post(basePath + "/registerUser",$("#userForm").serializeArray(),function(data){ 
			//$('#tt').tabs('close', '用户信息');					
			if(data !=null && $.trim(data) != "" && data == true){
				$('#win').window('close');
				$.messager.show({
					title:"操作提示",
					msg:"注册成功！",
					timeout:3000,
					showType:"slide"
				});
			} else {
				$("input").val("");
				$.messager.alert("操作提示","注册失败！",'error');
			}						
		});
	});	
});
/*
   $(function(){
		$('#userForm input').each(function () {
            if ($(this).attr('required') || $(this).attr('validType'))
	                $(this).validatebox();
	    });	

		
   });
   */