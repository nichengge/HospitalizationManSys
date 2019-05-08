$(function() {
	$("#save").click(save);
	$("#reset").click(reset);
	$("#drugQuery").click(drugShow);
});
// 药品名字的检查
function checkdrugname() {
	$.ajax({
		type : "POST",
		dataType : "json",
		url : "drugs/drugsFind.do",
		data : saveData,
		success : function(result) {
			if (result.state == 0) {
				alert("保存成功！");
			}
			window.location.reload();
		},
		error : function(result) {
			alert("保存失败");
			window.location.reload();
		}
	});

}
// 药品的保存
function save() {
	if (Number($("#year").val()) < 0 || Number($("#mouth").val()) < 0
			|| Number($("#day").val()) < 0) {
		alert("保质期不能为负！");
		return false;
	} else if ($("#year").val() == "" && $("#mouth").val() == ""
			&& $("#day").val() == "") {
		alert("保质期不能为空！");
		return false;

	}

	// 提交form表单
	var saveData = $("#drugsForm").serialize();
	$.ajax({
		type : "POST",
		dataType : "json",
		url : "drugs/drugsSave.do",
		data : saveData,
		success : function(result) {
			if (result.state == 0) {
				alert("保存成功！");
			}
			window.location.reload();
		},
		error : function(result) {
			alert("保存失败");
			window.location.reload();
		}
	});
}

// 药品查询
function drugShow() {
	$(".drugsDialog").Dialog("open");
}

$('.drugsDialog').Dialog({
	title : '选择药品',
	autoOpen : false,
	width : 1000,
	height : 400
});

function closeDrugs() {
	$('.drugsDialog').Dialog('close');
}

function reset() {
	/*
	 * window.open("doctor-find.html","选择医生","height=500, width=900,
	 * top=100,left=200, toolbar=no, menubar=no, scrollbars=no,
	 * resizable=no,location=no,status=no");
	 */
	$("#drugsForm :input").val("");
}
