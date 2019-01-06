  var list;
var $tbody = $("#show");
var start = 0;
var end = 7;
$(function(){
	$(".confirm").click(patientQuery);
	//科室列表
	$.ajax({
		url:'common/list.do',
		type:'post',
		data:{"name":"科室"},
		dataType: 'JSON',
		success:function(result){
			if(result.state==0){
				list = result.data;
				var $ul = $("#depart");
				$ul.append("<li value=''>请选择</li>");
				$ul.empty();
				if(list.length>0){
					for(var i=0;i<list.length;i++){
						var common = list[i];
						var $li = "<li value="+common.value+">"+common.name+
							"</li>";
						$ul.append($li);
					}
				}
			}
		}
	});
});

function patientQuery(){
	var queryData = $("#patientFindForm").serialize();
	$.ajax({
		url:'patient/patientQuery.do',
		type:'post',
		data:queryData,
		dataType: 'JSON',
		success:function(result){
			if(result.state==0){
				var lists = result.data;
				$tbody.empty();
				//分页
				if(lists.length>0){
				$('.pagination').pagination(lists.length,{
					 callback: function(page){
						 start = page * this.items_per_page;
						 end = (page+1)*this.items_per_page;
						 $tbody.empty();
						 showList(lists,start,end);
						 return true;
					}, 
					display_msg: true,	//是否显示记录信息
					setPageNo: true   //是否显示跳转第几页
				});
				$("#showbuttom").show();
				}else{
					alert("未找到信息！");
					$("#showbuttom").hide();
					$(".clear").click();
				}
				showList(lists,start,end);
			}	 		 
		}
	});
}

function showList(lists,start,end){
	if(lists.length>0){
		for(var i=start;i<end;i++){
			var patient = lists[i];
			//将性别转为中文
			var gender = "男";
			if(patient.gender==2){
				gender="女";
			}
			//入院情况转为中文
			var state = "一般";
			if(patient.admissionStatus==2){
				state="急";
			}
			if(patient.admissionStatus==3){
				state="危";
			}
			var trStyle;
			if((i+1)%2==0){
				trStyle = "<tr style='background-color:#eff6fa' onclick='jump(this);'>";
			}else{
				trStyle = "<tr onclick='jump(this);'>";
			}
			var admissionTime=patient.admissionTime.substring(0,patient.admissionTime.length-2);
			var $tr = trStyle+
					"<td class='num'>"+(i+1)+"</td>"+
					"<td class='name'>"+patient.patientId+"</td>"+
					"<td class='time'>"+patient.name+"</td>"+
					"<td class='num'>"+gender+"</td>"+
					"<td class='node'>"+patient.departmentName+"</td>"+
					"<td class='num'>"+patient.roomNo+"</td>"+
					"<td class='num'>"+patient.bedNo+"</td>"+
					"<td class='num'>"+state+"</td>"+
					"<td class='time'>"+admissionTime+"</td>"+
					"</tr>";
			$tbody.append($tr);
			}
	}
}

function jump(obj){
	var id = $(obj).children().siblings().next().html();
	var name = $(obj).children().next().next().html();
	var bedNo = $(obj).children().next().next().next().next().next().next().html();
	console.log("bedNo:"+bedNo);
	var tiao = parent.window.$("#tiao").val();
	$('#patientId',window.parent.document).val(id);
	$('#patientName',window.parent.document).val(name);
	$('#bedNo',window.parent.document).val(bedNo+"号");
	window.location.reload();
	parent.close();
	/*parent.showMessage();*/
}
