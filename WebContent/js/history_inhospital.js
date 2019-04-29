var $tbody = $("#show");
var start = 0;
var end = 15;
$(function() {
	$("#find").click(confirm);
	$("#cle").click(qingkong);
});

$(function(){
	/*读取cookie值，判断是什么类型的用户。
	*如果是患者，则把身份证号设置为只读，
	*并把数据回显出来
	**/
	//cookie内容：{user:用户ID#用户姓名#用户类型描述} 
	var cookie = getCookie('user');
	var userid = cookie.split("#")[0].substring(0);
	var usertype = cookie.split("#")[2].substring(0);
	//alert(usertype);
	if(usertype == 0){//是患者类型的用户，设置身份证为只读
		$("#cerificateNo").val(userid);
		document.getElementById("cerificateNo").setAttribute("readOnly", false);
		$.ajax({//通过身份证查询patient表的患者信息
			url:"patient/patientQueryBycerificateNo.do",
			data:{"cerificateNo":userid},
			type:"post",
			dataType:"JSON",
			success:function(result){
				if(result.state == 0){
					var lists = result.data;
					$tbody.empty();
					//分页
					if (lists.length > 0) {
						$('.pagination').pagination(lists.length, {
							callback : function(page) {
								start = page * this.items_per_page;
								end = (page + 1) * this.items_per_page;
								$tbody.empty();
								showList(lists, start, end);
								return true;
							},
							display_msg : true, //是否显示记录信息
							setPageNo : true //是否显示跳转第几页
						});
					} else {
						alert("未找到信息！");
						$("#cle").click();
					}
					showList(lists, start, end);
				}
			}
		});
	}
});

//查询按钮
function confirm() {
	var userid = document.getElementById("cerificateNo").value;
	$.ajax({
		url:"patient/patientQueryBycerificateNo.do",
		data:{"cerificateNo":userid},
		type:"post",
		dataType:"JSON",
		success : function(result) {
			if (result.state == 0) {
				var lists = result.data;
				$tbody.empty();
				//分页
				if (lists.length > 0) {
					$('.pagination').pagination(lists.length, {
						callback : function(page) {
							start = page * this.items_per_page;
							end = (page + 1) * this.items_per_page;
							$tbody.empty();
							showList(lists, start, end);
							return true;
						},
						display_msg : true, //是否显示记录信息
						setPageNo : true //是否显示跳转第几页
					});
				} else {
					alert("未找到信息！");
					$("#cle").click();
				}
				showList(lists, start, end);
			}


		}
	});
}

function showList(lists, start, end) {
	if (lists.length > 0) {
		for (var i = start; i < end; i++) {
			var patient = lists[i];
			//将性别转为中文
			var gender = "男";
			if (patient.gender == 2) {
				gender = "女";
			}
			if ((i + 1) % 2 == 0) {
				trStyle = "<tr style='background-color:#eff6fa' onclick='jump(this.firstChild);'>";
			} else {
				trStyle = "<tr onclick='jump(this.firstChild);'>";
			}
			if(patient.leaveTime == "未出院"){
				var admissionTime = patient.admissionTime.substring(0, patient.admissionTime.length - 2);
				var leaveTime = patient.leaveTime;
			}else{
			var admissionTime = patient.admissionTime.substring(0, patient.admissionTime.length - 2);
			var leaveTime = patient.leaveTime.substring(0, patient.leaveTime.length - 2);
			}
			
			var $tr = trStyle +
				"<td class='num'>" + (i + 1) + "</a></td>" +
				"<td class='name'>" + patient.patientId + "</td>" +
				"<td class='name'>" + patient.name + "</td>" +
				"<td class='node'>" + gender + "</td>" +
				"<td class='node'>" + patient.doctorName + "</td>" +
				"<td class='node'>" + patient.cerificateNo + "</td>" +
				"<td class='time'>" + admissionTime + "</td>" +
				"<td class='time'>" + leaveTime + "</td>" +
				"</tr>";
			$tbody.append($tr);
		}
	}
}

//清空条件按钮
function qingkong() {
	window.location.reload(true);
}