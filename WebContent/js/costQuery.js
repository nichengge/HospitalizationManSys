var $tbody = $("#show");
var start = 0;
var end = 15;
$(function() {
	$("#patientId").click(selectPatient);
	$(".confirm").click(query);
	$(".clear").click(clear);
});

$(function() {
	/*
	 * 读取cookie值，判断是什么类型的用户。 如果是患者，则把姓名、住院号设置为只读， 并把数据回显出来
	 */
	// cookie内容：{user:用户ID#用户姓名#用户类型描述}
	var cookie = getCookie('user');
	var userid = cookie.split("#")[0].substring(0);
	var usertype = cookie.split("#")[2].substring(0);
	// alert(usertype);
	if (usertype == 0) {// 是患者类型的用户
		document.getElementById("patientId").setAttribute("type", "hidden");
		document.getElementById("patientNum").setAttribute("style",
				"display:none;");
		document.getElementById("patientName").setAttribute("readOnly", false);
		$.ajax({// 通过身份证查询patient表的患者信息
			url : "patient/patientQueryBycerificateNo.do",
			data : {
				"cerificateNo" : userid
			},
			type : "post",
			dataType : "JSON",
			success : function(result) {
				if (result.state == 0) {
					var list = result.data;
					var lastNameNum = list.length;// 只显示最近一次住院记录
					var patientID = list[lastNameNum - 1].patientId;
					var patientName = list[lastNameNum - 1].name;
					$("#patientId").val(patientID);
					$("#patientName").val(patientName);
				}
			}
		});
	}
});

// 重置
function clear() {
	window.location.reload();
}

// 查询
function query() {
	// 提交form表单
	var findData = $("#costQueryForm").serialize();
	$.ajax({
		url : "cost/costQuery.do",
		type : "post",
		data : findData,
		dataType : "JSON",
		async : false,
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
					alert("未查询到数据！");
					$("#showbuttom").hide();
					$("#reset").click();
				}
				showList(list, start, end);
			}
		}
	});
}

function showList(lists, start, end) {
	if (lists.length > 0) {
		for (var i = start; i < end; i++) {
			var cost = lists[i];
			var trStyle;
			if ((i + 1) % 2 == 0) {
				trStyle = "<tr style='background-color:#eff6fa'>";
			} else {
				trStyle = "<tr>";
			}
			var costTime = cost.costTime.substring(0, cost.costTime.length - 2)
			var $tr = trStyle + "<td class='num'>" + (i + 1) + "</a></td>"
					+ "<td class='name'>" + cost.id + "</td>"
					+ "<td class='name'>" + cost.patientId + "</td>"
					+ "<td class='name'>" + cost.patientName + "</td>"
					+ "<td class='node'>" + cost.account + "</td>"
					+ "<td class='node'>" + cost.type + "</td>"
					+ "<td class='time'>" + costTime + "</td>"
					+ "<td class='node'>" + cost.userName + "</td>" + "</tr>";
			$tbody.append($tr);
		}
	}
}

// 病人的查询弹窗
function selectPatient() {
	$('.showDialog').Dialog("open");
	count = 0;
}

$('.showDialog').Dialog({
	title : '选择病人',
	autoOpen : false,
	width : 1000,
	height : 400
});

function close() {
	$('.showDialog').Dialog('close');
}
