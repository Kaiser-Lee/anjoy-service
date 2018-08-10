
var prefix = "/pm/thinkTask"
$(function() {
	load();
});

function load() {
	$('#exampleTable')
			.bootstrapTreeTable(
					{
						id : 'id',
						code : 'id',
		                parentCode : 'task_pid',
						type : "GET", // 请求数据的ajax类型
						url : prefix + '/list', // 请求数据的ajax的url
						ajaxParams : {}, // 请求数据的ajax的data属性
						expandColumn : '0', // 在哪一列上面显示展开按钮
						striped : true, // 是否各行渐变色
						bordered : true, // 是否显示边框
						expandAll : false, // 是否全部展开
						columns : [
								/*{
									checkbox : true
								},*/
																{
									field : 'task_name', 
									title : '任务标题' 
								},
																/*{
									field : 'taskDesc', 
									title : '任务描述' 
								},*/
																{
									field : 'task_level', 
									title : '任务等级' 
								},
																{
									field : 'task_beg', 
									title : '开始时间' 
								},
																{
									field : 'task_end', 
									title : '结束时间' 
								},
								
								{
									field : 'holder_name', 
									title : '任务执行人' 
								},
																{
									field : 'task_state', 
									//title : '0：进行中 1：已完成 3：代码审查 4:代码部署中' 
									title : '状态',
									formatter : function (row){
										if(row.task_state==0){
											return "进行中";
										}
										return "已完成";
										
									}
								},
																{
									field : 'name', 
									title : '任务创建人' 
								},
																{
									field : 'create_time', 
									title : '创建时间'
								},
																{
									field : 'task_delay', 
									title : '是否延期' ,
									formatter : function (row, value, index) {
										if (row.task_delay=='是'){
											return "<span style='color:red;'>已延期</span>";
										}
										return  "<span>未延期</span>";
									}
								},
																{
									field : 'ispm', 
									title : '是否外部提单' ,
									formatter : function (row, value, index){
										//console.log(row);
										if(row.ispm==0){
											return "否";
										}
										return "是";
									}
								},
																{
									title : '操作',
									field : 'id',
									formatter : function(row, value, index) {
										//console.log(row.id);
										var e = '<a class="btn btn-primary btn-sm '+s_edit_h+'" href="#" mce_href="#" title="任务详情" onclick="edit(\''
												+ row.id
												+ '\')">任务详情</a> ';
										
										var a = '<a class="btn btn-primary btn-sm '+s_edit_h+'" href="#" mce_href="#" title="结束任务" onclick="finish(\''
										+ row.id
										+ '\')">结束任务</a> ';
										
										var d = '<a class="btn btn-warning btn-sm '+s_remove_h+'" href="#" title="删除"  mce_href="#" onclick="remove(\''
												+ row.id
												+ '\')"><i class="fa fa-remove"></i></a> ';
										var f = '<a class="btn btn-success btn-sm" href="#" title="备用"  mce_href="#" onclick="resetPwd(\''
												+ row.id
												+ '\')"><i class="fa fa-key"></i></a> ';
										return e + d + a;
									}
								} ]
					});
}
function reLoad() {
	load();
}
function add() {
	layer.open({
		type : 2,
		title : '增加',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '1000px', '620px' ],
		content : prefix + '/add' // iframe的url
	});
}
function edit(id) {
	layer.open({
		type : 2,
		title : '查看任务明细',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '60%', '80%' ],
		content : prefix + '/detail/' + id // iframe的url
	});
}
function remove(id) {
	layer.confirm('确定要删除选中的记录？', {
		btn : [ '确定', '取消' ]
	}, function() {
		$.ajax({
			url : prefix+"/remove",
			type : "post",
			data : {
				'id' : id
			},
			success : function(r) {
				if (r.code==0) {
					layer.msg(r.msg);
					reLoad();
				}else{
					layer.msg(r.msg);
				}
			}
		});
	})
}

function resetPwd(id) {
}
function batchRemove() {
	var rows = $('#exampleTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
	if (rows.length == 0) {
		layer.msg("请选择要删除的数据");
		return;
	}
	layer.confirm("确认要删除选中的'" + rows.length + "'条数据吗?", {
		btn : [ '确定', '取消' ]
	// 按钮
	}, function() {
		var ids = new Array();
		// 遍历所有选择的行数据，取每条数据对应的ID
		$.each(rows, function(i, row) {
			ids[i] = row['id'];
		});
		$.ajax({
			type : 'POST',
			data : {
				"ids" : ids
			},
			url : prefix + '/batchRemove',
			success : function(r) {
				if (r.code == 0) {
					layer.msg(r.msg);
					reLoad();
				} else {
					layer.msg(r.msg);
				}
			}
		});
	}, function() {

	});
}

function finish(id){
		$.ajax({
			cache : true,
			type : "POST",
			url : "/pm/thinkTask/endTask",
			data : {
				id: id,
				taskState: '1'
			},
			async : false,
			error : function(request) {
				parent.layer.alert("Connection error");
			},
			success : function(data) {
				if (data.code == 0) {
					reLoad();
				} else {
					parent.layer.alert(data.msg)
				}
	
			}
		});
}