$(function() {
	//设置按钮监听
	$("#patientId").click(selectPatient);
	$(".confirm").click(save);
	$(".clear").click(clear);
	$(".jiesuanOK").click(jiesuanOk);
	$(".jiesuanNO").click(Tishiclose);
	var count = 0;
});
//费用查询
function save() {
	//校验是否有查询条件
	var patientId = $("#patientId").val();
	if (patientId == null || "" == patientId) {
		$("#patientIdError").css("color", "red");
		$("#patientIdError").text("*不能为空");
		return false;
	}
	$.ajax({
		url : "cost/costTotal.do",
		type : "post",
		data : {
			"patientId" : $("#patientId").val()
		},
		dataType : "JSON",
		async : false,
		success : function(result) {
			if (result.state == 0) {
				lists = result.data;
				var $tbody = $("#show");
				$tbody.empty();
				if (lists.length > 0) {
					for (var i = 0; i < lists.length; i++) {
						var cost = lists[i];
						if ((i + 1) % 2 == 0) {
							trStyle = "<tr style='background-color:#eff6fa'>";
						} else {
							trStyle = "<tr>";
						}
						var $tr = $(trStyle +
							"<td class='num'>" + (i + 1) + "</td>" +
							"<td class='process'>" + cost.patientId + "</td>" +
							"<td class='process'>" + $("#patientName").val() + "</td>" +
							"<td class='node'>" + cost.type + "</td>" +
							"<td class='name'>" + cost.account.toFixed(2) + "</td>" +
							+"</tr>");
						$tbody.append($tr);
						count=0;
					}
				}
			}
		},
		error : function() {
			alert("失败");
		}
	});
}
function clear() {
	var patientId = $("#patientId").val();
	if (patientId == null || "" == patientId) {
		return false;
	} else {
		count++;
		if (count <= 1) {
			var $tbody = $("#show");
			var $tr = "<tr style='background-color:#A0E5A2'>" +
				"<td class='num'>操作</td>" +
				"<td class='process'>总缴费</td>" +
				"<td class='process'>总花费</td>" +
				"<td class='node'>补交</td>" +
				"<td class='name'>退费</td>" +
				+"</tr>";
			$tbody.append($tr);
			var node = $(".node");
			var name = $(".name");
			//总缴费
			var account = 0;
			//总花费
			var total = 0;
			for (var i = 2; i < node.length; i++) {
				if (node.eq(i).html() == "预交费用") {
					account = name.eq(i - 1).html() * 1;
				}
				if (node.eq(i).html() == "领药费用") {
					total = (total * 1) + (name.eq(i - 1).html() * 1);
				}
				if (node.eq(i).html() == "退药费用") {
					total = total - name.eq(i - 1).html();
				}
				if (node.eq(i).html() == "床位费") {
					total = (total * 1) + (name.eq(i - 1).html() * 1);
				}
			}
			if (total - account >= 0) {
				var $tr1 = "<tr style='background-color:#6AB96E'>" +
					"<td class='num'><a href='javascript:void(0);' onclick='selectTishi();'>结算</a></td>" +
					"<td class='process'>" + account.toFixed(2) + "</td>" +
					"<td class='process'>" + total.toFixed(2) + "</td>" +
					"<td class='node'>" + (total - account).toFixed(2) + "</td>" +
					"<td class='name'>" + 0 + "</td>" +
					+"</tr>";
				$tbody.append($tr1);
			}
			if (total - account < 0) {
				var $tr1 = "<tr style='background-color:#6AB96E'>" +
					"<td class='num'><a href='javascript:void(0);' onclick='selectTishi();'>结算</a></td>" +
					"<td class='process'>" + account.toFixed(2) + "</td>" +
					"<td class='process'>" + total.toFixed() + "</td>" +
					"<td class='node'>" + 0 + "</td>" +
					"<td class='name'>" + (account - total).toFixed(2) + "</td>" +
					+"</tr>";
				$tbody.append($tr1);
			}
		}
	}
}

//病人的查询弹窗
function selectPatient() {
	$("#patientIdError").empty();
	$('.showDialog').Dialog("open");
	count=0;
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
//确认弹窗
function jiesuanOk() {
	//确认结算
	var patientId = $("#patientId").val();
	var url = "patient/jiesuan.do";
	var data = {
		"patientId" : patientId
	};
	$.post(url, data, function(result) {
		alert("结算成功！");
		window.location.reload();
		$('.showJiesuanDialog').Dialog('close');

	});
}

function selectTishi() {
	$('.showJiesuanDialog').Dialog("open");
}

$('.showJiesuanDialog').Dialog({
	title : '确认结算提示',
	autoOpen : false,
	width : 400,
	height : 200
});

function Tishiclose() {
	$('.showJiesuanDialog').Dialog('close');
}