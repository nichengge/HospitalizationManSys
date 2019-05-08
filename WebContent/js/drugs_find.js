var start = 0;
var end = 15;
var $tbody = $("#show");

$(function() {
	$("#find").click(find);
	$("#reset").click(reset);
});

// 药品的查询
function find() {
	// 提交form表单
	var findData = $("#durgs_find").serialize();
	$.ajax({
		type : "POST",
		dataType : "json",
		url : "drugs/drugsFind.do",
		data : findData,
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
					$("#reset").click();
				}
				showList(list, start, end);
			}
		},
		error : function(result) {
			alert("查询失败");
		}

	});
}
function showList(list, start, end) {
	if (list.length > 0) {
		for (var i = start; i < end; i++) {
			var drugs = list[i];
			var $tr = "<tr>" + "<td class='num'>" + (i + 1) + "</td>"
					+ "<td class='name'>" + drugs.drugsid + "</td>"
					+ "<td class='time'>" + drugs.name + "</td>"
					+ "<td class='node'>" + drugs.addNum + "</td>"
					+ "<td class='node'>" + drugs.price + "</td>"
					+ "<td class='time'>" + drugs.production_time + "</td>"
					+ "<td class='time'>" + drugs.vilidityTime + "</td>"
					+ "<td class='time'>" + drugs.createTime + "</td>"
					+ "</tr>";
			$tbody.append($tr);
		}
	}

}

function reset() {
	$("#durgs_find :input").val("");
}
