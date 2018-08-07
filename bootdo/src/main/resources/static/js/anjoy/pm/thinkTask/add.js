$().ready(function() {
	$('.summernote').summernote({
		height : '220px',
		lang : 'zh-CN',
		callbacks: {
            onImageUpload: function(files, editor, $editable) {
                sendFile(files);
            }
        }
	});
	validateRule();
});

$(function () {
    laydate({
        elem : '#taskBeg',
        min: Date()
    });
    laydate({
        elem : '#taskEnd',
        min: Date()
    });
});

$.validator.setDefaults({
	submitHandler : function() {
		//save();
	}
});
function save() {
	$.ajax({
		cache : true,
		type : "POST",
		url : "/pm/thinkTask/save",
		data : $('#signupForm').serialize(),// 你的formid
		async : false,
		error : function(request) {
			parent.layer.alert("Connection error");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("操作成功");
				parent.reLoad();
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);

			} else {
				parent.layer.alert(data.msg)
			}

		}
	});

}
function validateRule() {
	var icon = "<i class='fa fa-times-circle'></i> ";
	$("#signupForm").validate({
		rules : {
			name : {
				required : true
			}
		},
		messages : {
			name : {
				required : icon + "请输入姓名"
			}
		}
	})
}
function openUser(){
	layer.open({
		type : 2,
		title : '选择执行人',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '90%', '85%' ],
		content : '/pm/thinkTask/findExecutor/' // iframe的url
	});
}
function loadUser( userId,userName){
	$("#userId").val(userId);
	$("#userName").val(userName);
}