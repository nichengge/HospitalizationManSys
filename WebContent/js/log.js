var start = 0;
var end = 25;
// 将用户的权限作为全局变量
var startTime = $("#startTime");
var endTime = $("#endTime");
var $tbody = $("#show");

$(function() {
	$("#select").click(Query);
	$("#reset").click(Reset);
});

function Query() {
	// 查询日志
	var startTimes = startTime.val();
	var endTimes = endTime.val();
	var event_type = $("#des").val();
	var data = {
		"startTime" : startTimes,
		"endTime" : endTimes,
		"type" : event_type
	};
	$.ajax({
		url : 'log/LogsQuery.do',
		type : 'post',
		data : data,
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				$tbody.empty();
				// 分页
				if (list.length > 0) {
					$('.pagination').pagination(list.length, {
						callback : function(page) {
							start = page * this.items_per_page;
							end = (page + 1) * this.items_per_page;
							$tbody.empty();
							showList(list, start, end);
							return true;
						},
						display_msg : true, // 是否显示记录信息
						setPageNo : true
					// 是否显示跳转第几页
					});
					$("#showbuttom").show();
				} else {
					alert("未找到信息！");
					$("#showbuttom").hide();
					$(".clear").click();
				}

				showList(list, start, end);
			}
		}
	});
}

function showList(list, start, end) {
	if (list.length > 0) {
		for (var i = start; i < end; i++) {
			var log = list[i];
			var trStyle;
			//var logdetial = "..." + log.detial.match(/.*(.{55})/)[1];// 显示最后55个字符
			var logdetial = "..." + log.detial.substring(log.detial.length-55);// 显示最后55个字符
			if ((i + 1) % 2 == 0) {
				trStyle = "<tr style='background-color:#eff6fa'>";
			} else {
				trStyle = "<tr>";
			}
			var $tr = $(trStyle
					+ "<td class='node'>"
					+ log.id
					+ "</td>"
					+ "<td class='time'>"
					+ log.type
					+ "</td>"
					+ "<td class='name'>"
					+ log.create_time
					+ "</td>"
					+ "<td class='name'>"
					+ logdetial
					+ "</td>"
					+ "<td class='name'><a href='javascript:void(0)' onclick='LogDelete(this);'>删除</a>&nbsp;&nbsp;&nbsp;&nbsp;"
					+ "<a href='javascript:void(0)' onclick='LogDetials(this)'>查看详情</a></td>"
					+ "</tr>");
			$tbody.append($tr);
		}
	}
}

// 删除日志
function LogDelete(obj) {
	alert("权限不足!WARN及其以上级别日志永久保存;WARN以下级别日志保留72小时");
}

// 日志详情
function LogDetials(obj) {
	// 得到所选log的ID
	var id = obj.parentNode.parentNode.childNodes[0].innerText;
	// 通过ID查询该日志详情
	$.ajax({
		url : 'log/LogQueryById.do',
		type : 'post',
		data : {
			'id' : id
		},
		dataType : 'JSON',
		success : function(result2) {
			if (result2.state == 0) {
				var onelog = result2.data;
				// 分页
				if (onelog.length > 0) {
					var id = onelog[0].id;
					var type = onelog[0].type;
					var create_time = onelog[0].create_time;
					var detial = onelog[0].detial;
					showOneLog(id, type, create_time, detial);
				} else {
					/**
					 * 因为每隔3天的凌晨12点执行清log库， 出现这个原因肯定是请求的前一秒在12点以前，收到请求以后超过了12点
					 */
					alert("发生了很神奇的错误!一般原因是大半夜了你还在加班^-^");
				}
			}
		}
	});
}

// 上一条日志
function PreviousLog() {
	var nowID = $("#logid").html().trim();
	var PreviousId = parseInt(nowID) - 1;
	$.ajax({
		url : 'log/LogQueryById.do',
		type : 'post',
		data : {
			'id' : PreviousId
		},
		dataType : 'JSON',
		success : function(Previousresult) {
			if (Previousresult.state == 0) {
				var onelog = Previousresult.data;
				// 分页
				if (onelog.length > 0) {
					var id = onelog[0].id;
					var type = onelog[0].type;
					var create_time = onelog[0].create_time;
					var detial = onelog[0].detial;
					showOneLog(id, type, create_time, detial);
				} else {
					alert("没有上一个了");
				}
			}
		}
	});
}

// 下一条日志
function NextLog() {
	var nowID = $("#logid").html().trim();
	// alert("当前ID"+nowID);
	var NextId = parseInt(nowID) + 1;
	// alert("下一个ID"+NextId);
	$.ajax({
		url : 'log/LogQueryById.do',
		type : 'post',
		data : {
			'id' : NextId
		},
		dataType : 'JSON',
		success : function(Nextresult) {
			if (Nextresult.state == 0) {
				var onelog = Nextresult.data;
				// 分页
				if (onelog.length > 0) {
					var id = onelog[0].id;
					var type = onelog[0].type;
					var create_time = onelog[0].create_time;
					var detial = onelog[0].detial;
					showOneLog(id, type, create_time, detial);
				} else {
					alert("没有下一个了");
				}
			}
		}
	});
}

function Reset() {
	window.location.reload(true);
}

// 查看日志详情弹窗
$('.showUser').Dialog({
	title : '事件详情',
	autoOpen : false,
	width : 430,
	height : 300
});

function showOneLog(id, type, create_time, detial) {
	$('.showUser').Dialog('open');
	$("#logid").html(id);
	$("#logcreate_time").html(create_time);
	$("#logtype").html(type);
	$("#logdetial").val(detial);
}

function no() {
	$('.showUser').Dialog('close');
}
