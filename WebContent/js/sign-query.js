var $tbody = $("#show");
var start = 0;
var end = 7;
//加载后执行
$(function(){
	 $(".confirm").click(confirm);
	 $(".clear").click(clear);
});

//执行查询
function confirm(){
	var queryData = $("#signQueryForm").serialize();
	$.ajax({
		url:'sign/signQuery.do',
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
					setPageNo: true  //是否显示跳转第几页
				});
				$("#showbuttom").show();
				}else{
					alert("未查询到数据！");
					$("#showbuttom").hide();
					$(".clear").click();
				}
				showList(lists,start,end);
			}	 		 
		}
	});
}
//显示查询结果
function showList(lists,start,end){
	if(lists.length>0){
		for(var i=start;i<end;i++){
			var patient = lists[i];
			var ctime = patient.measureTime;
			var newDate = new Date();
			newDate.setTime(ctime);
			var trStyle;
			if(patient.pulse==null){
				patient.pulse=0;
			}
			if(patient.breathing==null){
				patient.breathing=0;
			}
			if((i+1)%2==0){
				trStyle = "<tr style='background-color:#eff6fa'>";
			}else{
				trStyle = "<tr>";
			}
			var measureTime=patient.measureTime.substring(0,patient.measureTime.length-2);
			var $tr = trStyle+
					"<td class='num'>"+(i+1)+"</td>"+
					"<td class='node'>"+patient.patientId+"</td>"+
					"<td class='num'>"+patient.bedNo+"</td>"+
					"<td class='num'>"+patient.patientName+"</td>"+
					"<td class='name'>"+patient.temperature+"</td>"+
					"<td class='name'>"+patient.pulse+"</td>"+
					"<td class='name'>"+patient.breathing+"</td>"+
					"<td class='name'>"+patient.bloodSugar+"</td>"+
					"<td class='name'>"+patient.bloodPressure+"</td>"+
					"<td class='name'>"+patient.vein+"</td>"+
					"<td class='time'>"+measureTime+"</td>"+
					"<td class='name'>"+patient.userName+"</td>"+
					"</tr>";
			$tbody.append($tr);
			}
	}
}

//清空条件按钮
function clear(){
	$("#signQueryForm :input").val("");
}