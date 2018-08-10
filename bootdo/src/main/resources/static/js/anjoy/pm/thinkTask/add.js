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
	selectLoad();
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
		save();
	}
});
function save() {
	var content_sn = $("#Desc").summernote('code');
	if($("#taskName").val()==''){
		parent.layer.msg("任务标题不能为空");
		return;
	}
	if($("#userId").val()==''){
		parent.layer.msg("任务执行人不能为空");
		return;
	}
	if($("#taskBeg").val()==''){
		parent.layer.msg("请选择开始时间");
		return;
	}
	if($("#taskEnd").val()==''){
		parent.layer.msg("请选择结束时间");
		return;
	}
	if(content_sn==''){
		parent.layer.msg("任务描述不能为空");
		return;
	}
	$("#taskDesc").val(content_sn);
	$.ajax({
		cache : true,
		type : "POST",
		url : "/pm/thinkTask/save",
		data : $('#signupForm').serialize(),// 你的formid userId
		async : false, 
		error : function(request) {
			parent.layer.alert("Connection error");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("操作成功");
				//parent.reLoad();
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
function changeLevel(){
	$("#taskLevel").val($("#level").val());
}
function selectLoad() {
	var html = "";
	$.ajax({
		url : '/pm/thinkTask/getTaskSupList',
		type :'get',
		success : function(data) {
			//加载数据
			for (var i = 0; i < data.length; i++) {
				html += '<option value="' + data[i].id + '">' + data[i].task_name + '</option>'
			}
			$(".chosen-select").append(html);
			$(".chosen-select").chosen({
				maxHeight : 200
			});
			//点击事件
			$('.chosen-select').on('change', function(e, params) {
				//console.log(params.selected);
				var opt = {
					query : {
						type : params.selected,
					}
				}
				$('#exampleTable').bootstrapTable('refresh', opt);
				$("#taskPid").val(params.selected);
			});
		}
	});
}