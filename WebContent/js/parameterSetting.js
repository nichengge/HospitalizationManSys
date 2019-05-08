var $tbodys = $("#showCode");
var $tbody = $("#show");
var id = "";
var value = "";
var danqian = null;
$(function() {
	$("#codeadd").click(codeadd);
	$("#codesave").click(codesave);
	$(".ok").click(ok);
	$(".normal").click(closeDrugs);

	// 参数查询
	$
			.ajax({
				url : 'common/parameterQuery.do',
				type : 'post',
				data : {
					"id" : ""
				},
				dataType : 'JSON',
				success : function(result) {
					if (result.state == 0) {
						var list = result.data;
						$tbody.empty();
						if (list.length > 0) {
							for (var i = 0; i < list.length; i++) {
								var parameter = list[i];
								var $tr = "<tr onclick='showParameter(this);'><td><label style='display:none;'>"
										+ parameter.id
										+ "</label>"
										+ "<input readonly='readonly' size='50%'  type='text' value='"
										+ parameter.code
										+ "'/></td><td>"
										+ "<input readonly='readonly' size='50%'  type='text' value='"
										+ parameter.name + "'/></td></tr>";
								$tbody.append($tr);
							}
						}
					}
				}
			});

	$("#parameter").click(showParameter);
});

function showParameter(obj) {
	$(obj).parent().find("input").css('background-color', '#FFFFFF');
	$(obj).find("input").css('background-color', '#E8F1F7');
	window.code = obj.childNodes[0].childNodes[1].value;// 取参数编码设置为全局变量，后面的函数还要使用这个变量。天坑。。。。鼓捣了一下午。。。坑爹
	$
			.ajax({
				url : 'common/parameterCodeQuery.do',
				type : 'post',
				data : {
					"code" : code
				},
				dataType : 'JSON',
				success : function(result) {
					if (result.state == 0) {
						$("#codetitle").css("display", "");
						$("#codelist").css("display", "");
						$tbodys.empty();
						var list = result.data;
						if (list.length > 0) {
							for (var i = 0; i < list.length; i++) {
								var paracode = list[i];
								var $tr = "<tr><td><label style='display:none;'>"
										+ paracode.id
										+ "</label>"
										+ "<input readonly='readonly' size='50%' type='text' value='"
										+ paracode.code
										+ "'/></td><td>"
										+ "<input  readonly='readonly' size='50%' type='text' value='"
										+ paracode.name
										+ "'/></td><td><img src='images/delico.png' onclick='deletetr(this);'></td></tr>";
								$tbodys.append($tr);

							}
						}
					}
				}
			});
}

function codeadd() {
	var $addtr = "<tr><td><label style='display:none;'></label>"
			+ "<input onblur='checkNo(this);' onfocus='checkNof(this);' size='50%' type='text'"
			+ "</td><td>"
			+ "<input  size='50%' onblur='checkName(this);' onfocus='checkNamef(this);' type='text'"
			+ "'</td><td><img  onclick='deletetr(this);' src='images/delico.png'></td></tr>";
	$tbodys.append($addtr);
}

function deletetr(obj) {
	id = $(obj).parent().parent('tr').find("label").text();
	value = $(obj).parent().parent('tr').find("input").val();
	window.dangqian = obj;
	selectDrugs();
}

/**
 * 对输入框进行校验： 1.是否为空 2.是否与其他有重复
 */
// 判空
function checkNull(obj) {
	var value = $(obj).val();
	if (value == "") {
		$(obj).css("color", "red");
		$(obj).val("*不能为空");
		return false;
	}
}

function changeColor(obj) {
	$(obj).css("color", "");
	$(obj).val("");
}

// 判断是否重复
function checkNo(obj) {
	checkNull(obj);
	var code = $(obj).val();
	var reg = /^[1-9]\d*$/;
	if (!reg.test(code)) {
		$(obj).css("color", "red");
		$(obj).val("*请输入正整数");
		return false;
	}
	var leng = $("#showCode tr").length;
	var nums = new Array();
	var times = 0;
	for (var i = 0; i <= leng; i++) {
		number = $("#showCode tr").eq(i).find("input:first").val();
		if (number == $(obj).val()) {
			times = times + 1;
		}
	}
	if (times > 1) {
		$(obj).css("color", "red");
		$(obj).val("*参数重复");
		return false;
	}
}

function checkNof(obj) {
	changeColor(obj);
}

function checkName(obj) {
	checkNull(obj);
	var leng = $("#showCode tr").length;
	var times = 0
	for (var i = 0; i < leng; i++) {
		var number = $("#showCode tr").eq(i).find("input")[1].value;
		console.log(number);
		if (number == $(obj).val()) {
			times = times + 1;
		}
	}
	if (times > 1) {
		$(obj).css("color", "red");
		$(obj).val("*参数重复");
	}
}

function checkNamef(obj) {
	changeColor(obj);
}

// 保存
function codesave() {
	var leng = $("#showCode tr").length;
	var array = "";
	for (var i = 0; i < leng; i++) {
		var id = $("#showCode tr").eq(i).find("label").text();
		var value2 = $("#showCode tr").eq(i).find("input:first").val();
		var name = $("#showCode tr").eq(i).find("input")[1].value;
		if (id == "") {
			id = "-1";
		}
		array = array + id + ":" + value2 + ":" + name + ":" + code + ",";
	}
	$.ajax({
		url : 'common/parameterCodeSave.do',
		type : 'post',
		data : {
			"list" : array,
			"code" : code
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				alert("保存成功！");
			} else if (result.state == 0) {
				alert("保存成功!");
			} else if (result.state == 4) {
				alert("请到病房管理-新置病房菜单添加新病房!");
			} else if (result.state == 5) {
				alert("系统角色不允许修改!");
			} else if (result.state == 6) {
				alert("请求码异常!");
			}
			window.location.reload();
		}
	});
}

// 点击删除的确认
function ok() {
	if (id == "") {
		// 没有在数据库中的数据直接删除
		// alert("进入删除区");
		$(dangqian).parent().parent('tr').remove();
	} else {
		// 在数据库中的参数要发送请求删除
		$.ajax({
			url : 'common/parameterCodeDelete.do',
			type : 'post',
			data : {
				"id" : id,
				"value" : value,
				"code" : code
			},
			dataType : 'JSON',
			success : function(result) {
				if (result.state == 0) {
					alert("删除成功");
				} else if (result.state == 1) {
					alert("当前科室正在使用!");
				} else if (result.state == 2) {
					alert("当前职称正在使用!");
				} else if (result.state == 3) {
					alert("当前病房类型正在使用!");
				} else if (result.state == 4) {
					alert("当前病房正在使用!");
				} else if (result.state == 5) {
					alert("系统角色不允许删除");
				} else if (result.state == 6) {
					alert("请求码异常!");
				}
				window.location.reload();
			}
		});
	}
	closeDrugs();
}

// 确认弹窗
function selectDrugs(obj) {
	var ok = $(".ErrorDialog").Dialog("open");
}

$('.ErrorDialog').Dialog({
	title : '确认提示',
	autoOpen : false,
	width : 400,
	height : 200
});

function closeDrugs() {
	$('.ErrorDialog').Dialog('close');
}
