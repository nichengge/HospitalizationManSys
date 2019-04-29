var list;
$(function(){
	// 为按钮设置监听事件
	$("#reset").click(reset);
	$("#add").click(add);

	$('#wardNo').on('focus', function() {
		$('#wardError').empty();
	});
	$('#wardspace').on('focus', function() {
		$('#wardspaceerror').empty();
	});
	$('.icon').on('click', function() {
		$('#departError').empty();
		$('#typeError').empty();
	});
	$('#createTime').on('focus', function() {
		$('#createTime').empty();
	});

	// 为下拉列表设置数据
	// 为科室的下拉列表增加数据
	$.ajax({
		url : 'common/list.do',
		type : 'post',
		data : {
			"name" : "科室"
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				var $ul = $("#depart");
				$ul.empty();
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {
						var common = list[i];
						var $li = "<li value=" + common.value + ">"
								+ common.name + "</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
	// 为病房类型设置数据
	$.ajax({
		url : 'common/typeList.do',
		type : 'post',
		data : {
			"id" : ""
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				var list = result.data;
				var $ul = $("#types");
				$ul.empty();
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {
						var common = list[i];
						var $li = "<li value=" + common.value + ">"
								+ common.name + "</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
	//查询所有的病房列表
	$.ajax({
		url : 'ward/wardQuery.do',
		type : 'post',
		data : {
			"id" : ""
		},
		dataType : 'JSON',
		success : function(result) {
			if (result.state == 0) {
				list = result.data;
			}
		}
	});
});
function check() {
	var date = new Date();
	var wardNo = $("#wardNo").val();
	var departmentNo = $("#departmentNo").val();
	var typeNo = $("#typeNo").val();
	var wardspace = $("#wardspace").val();
	var createTime = $("#createTime").val();

	if (wardNo == null || wardNo == "") {
		$("#wardError").css("color", "red");
		$("#wardError").text("* 病房号不能为空");
		return false;
	}
	var regex =  /^\+?[1-9][0-9]*$/;
	if(!regex.test(wardNo)){
		$("#wardError").css("color", "red");
		$("#wardError").text("* 病房号必须为正整数");
		return false;
	}
	if(list!=null&&list.length>0){
		for(var i=0;i<list.length;i++){
			var ward = list[i];
			if(ward.wardNo==wardNo){
				$("#wardError").css("color", "red");
				$("#wardError").text("* 病房号已存在");
				return false;
			}
		}
	}

	if (departmentNo == null || departmentNo == "") {
		$("#departError").css("color", "red");
		$("#departError").text("* 科室必须选择");
		return false;
	}

	if (typeNo == null || typeNo == "") {
		$("#typeError").css("color", "red");
		$("#typeError").text("* 病房类型必须选择");
		return false;
	}

	if (wardspace == null || wardspace == "") {
		$("#wardspaceerror").css("color", "red");
		$("#wardspaceerror").text("* 病房容量不能为空");
		return false;
	}
	var regex1 =  /^\+?[1-9][0-9]*$/;
	if(!regex1.test(wardspace)){
		$("#wardspaceerror").css("color", "red");
		$("#wardspaceerror").text("* 病房容量必须为整数");
		return false;
	}
	
	if (createTime == null || createTime == "") {
		$("#createError").css("color", "red");
		$("#createError").text("* 创建时间不能为空");
		return false;
	}
	/*if(createTime<=getNowFormatDate()){
		$("#createError").css("color", "red");
		$("#createError").text("* 创建时间不能小于当前时间");
		return false;
	}*/
	return true;
}
function add() {
	console.log(list);
	// 提交前的校验
	if (!check()) {
		return false;
	}
	var wardData = $("#wardForm").serialize();
	$.ajax({
		type : "POST",
		dataType : "json",
		url : "ward/wardSave.do",
		data : wardData,
		success : function(result) {
			if (result.state == 0) {
				alert("增加成功！");
			}
			window.location.reload();
		},
		error : function(result) {
			alert("增加失败");
			window.location.reload();
		}
	});

}
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    return currentdate;
}
function reset() {
	$("#wardForm :input").val("");
	$("#wardForm").find("span").text("");
	$("#type").find("span").text("请选择");
	$("#department").find("span").text("请选择");
	$("#wardError").css("color", "");
	$("#createTime").val(getNowFormatDate());
	$("#wardError").text("*必须为正整数");
	$("#wardspaceerror").text("*必须为正整数");

}
