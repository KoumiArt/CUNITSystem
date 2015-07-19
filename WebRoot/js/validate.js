$.extend($.fn.validatebox.defaults.rules, {
	 	mobile: {
        validator: function (value) {
        	var reg = /^1[3|4|5|8|9]\d{9}$/;
            return reg.test(value);
        },
        message: '输入手机号码格式不准确.'
	}
});