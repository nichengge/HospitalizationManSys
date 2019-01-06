var start = 0;
var end = 7;
var $tbody = $("#show");

$(function(){
	$("#find").click(find);
	$("#reset").click(reset);
});

//库存查询
function find(){
	//提交form表单
	var findData = $("#stock_query").serialize();
	$.ajax({
		type:"POST",
		dataType:"json",
		url:"drugs/stockQuery.do",
		data:findData,
		success:function(result){
			 if(result.state==0){
				 var list = result.data;
					$tbody.empty();
					//分页
					if(list.length>0){
					$('.pagination').pagination(list.length,{
						 callback: function(page){
							 start = page * this.items_per_page;
							 end = (page+1)*this.items_per_page;
							 $tbody.empty();
							 showList(list,start,end);
							 return true;
						}, 
						display_msg: true,	//是否显示记录信息
						setPageNo: true     //是否显示跳转第几页
					});
					$("#showbuttom").show();
					}else{
						alert("未查询到数据！");
						$("#showbuttom").hide();
						$("#reset").click();
					}
					showList(list,start,end); 
			 }
		},
		error:function(result){
			alert("查询失败");
		}
		
	});
}
function showList(list,start,end){
	if(list.length>0){
		for(var i=start;i<end;i++){
			var stock = list[i];
			var $tr = "<tr onclick='jump(this);'>"+
				"<td class='num'>"+(i+1)+"</td>"+
				"<td class='name'>"+stock.drugsId+"</td>"+
				"<td class='name'>"+stock.drugsName+"</td>"+
				"<td class='node'>"+stock.price+"</td>"+
				"<td class='node'>"+stock.account+"</td>"+
				"</tr>";
			$tbody.append($tr);
		}
	}
}

function reset(){
	$("#stock_query :input").val("");
}

function jump(obj){
	var drugsId = $(obj).children().siblings().next().html();
	var drugsName = $(obj).children().next().next().html();
	var price = $(obj).children().next().next().next().html();
	var num = $(obj).children().next().next().next().next().html();
	$('#drugsId',window.parent.document).val(drugsId);
	$('#drugsName',window.parent.document).val(drugsName);
	$('#price',window.parent.document).val(price);
	$('#num1',window.parent.document).val(num);
	parent.closeDrugs();
}

 