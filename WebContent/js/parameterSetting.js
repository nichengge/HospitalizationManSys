var $tbodys = $("#showCode");
var $tbody = $("#show");
var id = "";
var danqian = null;
$(function(){
	$("#codeadd").click(codeadd);
	$("#codesave").click(codesave);
	$(".ok").click(ok);
	$(".normal").click(closeDrugs);
	
	//参数查询
	$.ajax({
		url:'common/parameterQuery.do',
		type:'post',
		data:{"id":""},
		dataType: 'JSON',
		success:function(result){
			if(result.state==0){
				var list = result.data;
				$tbody.empty();
				if(list.length>0){
					for(var i=0;i<list.length;i++){
						var parameter = list[i];
						var $tr = "<tr onclick='showParameter(this);'><td><label style='display:none;'>"+parameter.id+
							  "</label>"+
							  "<input readonly='readonly' size='50%'  type='text' value='"+parameter.code+
							  "'/></td><td>"+
							  "<input readonly='readonly' size='50%'  type='text' value='"+parameter.name+
							  "'/></td></tr>";
						$tbody.append($tr);
					}
				}
			}
		}
	});
	
	$("#parameter").click(showParameter);
});

function showParameter(obj){
	$(obj).parent().find("input").css('background-color','#FFFFFF');
	$(obj).find("input").css('background-color','#E8F1F7');
	var code = obj.childNodes[0].childNodes[1].value;
	$.ajax({
		url:'common/parameterCodeQuery.do',
		type:'post',
		data:{"code":code},
		dataType: 'JSON',
		success:function(result){
			if(result.state==0){
				$("#codetitle").css("display","");
				$("#codelist").css("display","");
				$tbodys.empty();
				var list = result.data;
				if(list.length>0){
					for(var i=0;i<list.length;i++){
						var paracode = list[i];
						var $tr = "<tr><td><label style='display:none;'>"+paracode.id+
						  "</label>"+
						  "<input readonly='readonly' size='50%' type='text' value='"+paracode.code+
						  "'/></td><td>"+
						  "<input  size='50%' type='text' value='"+paracode.name+
						  "'/></td><td><img src='images/delico.png' onclick='deletetr(this);'></td></tr>";
					$tbodys.append($tr);
						
					}
				}
			}
		}
	});
}

function codeadd(){
	var $addtr = "<tr><td><label style='display:none;'></label>"+ 
	"<input onblur='checkNo(this);' onfocus='checkNof(this);' size='50%' type='text'"+ 
	"</td><td>"+
	"<input  size='50%' onblur='checkName(this);' onfocus='checkNamef(this);' type='text'"+
	"'</td><td><img  onclick='deletetr(this);' src='images/delico.png'></td></tr>";
	$tbodys.append($addtr);
}
 
function deletetr(obj){
   id = $(obj).parent().parent('tr').find("label").text();
   dangqian = obj;
   selectDrugs();
}

/**
 * 对输入框进行校验：
 * 1.是否为空
 * 2.是否与其他有重复
 * @param obj
 */
//判空
function checkNull(obj){
	var value = $(obj).val();
	if(value==""){
		$(obj).css("color","red");
		$(obj).val("*不能为空");
		return false;
	}
}

function changeColor(obj){
	$(obj).css("color","");
	$(obj).val("");
}
//判断是否重复
function checkNo(obj){
	 checkNull(obj);
	 var code=$(obj).val();
	 var reg = /^[1-9]\d*$/;
	 if(!reg.test(code)){
		 $(obj).css("color","red");
		 $(obj).val("*请输入正整数");
		 return false;
	 }
	 var leng = $("#showCode tr").length; 
	 var nums = new Array(); 
	 var times = 0;
	  for(var i=0; i<=leng; i++) 
	  { 
	    number = $("#showCode tr").eq(i).find("input:first").val(); 
	    if(number==$(obj).val()){
	    	times = times + 1;
	    }
	  } 
	  if(times>1){
		  $(obj).css("color","red");
		  $(obj).val("*重复了");
		  return false;
	  }
}

function checkNof(obj){
	changeColor(obj);
}

function checkName(obj){
	checkNull(obj);
	 var leng = $("#showCode tr").length; 
	 var times = 0
	  for(var i=0; i<leng; i++) 
	  { 
	    var number = $("#showCode tr").eq(i).find("input")[1].value; 
	    console.log(number);
	    if(number==$(obj).val()){
	    	times = times + 1;
	    }
	  } 
	  if(times>1){
		  $(obj).css("color","red");
		  $(obj).val("*重复了");
	  }
}

function checkNamef(obj){
	changeColor(obj);
}

//保存
function codesave(){
	var code = $("#id").text();
	var leng = $("#showCode tr").length;
	var array="";
	for(var i=0; i<leng; i++) 
	{ 	
		var id =  $("#showCode tr").eq(i).find("label").text();
		var value = $("#showCode tr").eq(i).find("input:first").val(); 
	    var name = $("#showCode tr").eq(i).find("input")[1].value; 
	    if(id==""){
	    	id="-1";
	    }
	    array=array+id+":"+value+":"+name+":"+code+",";
	} 
	$.ajax({
		url:'common/parameterCodeSave.do',
		type:'post',
		data:{"list":array,"code":code},
		dataType: 'JSON',
		success:function(result){
			 alert("保存成功！");
			window.location.reload();
		}
	});
}
//点击删除的确认
function ok(){
	 if(id==""){
		   //没有在数据库中的数据直接删除
		   $(dangqian).parent().parent('tr').remove();
	  }else{
		  //在数据库中的参数要发送请求删除
		  $.ajax({
				url:'common/parameterCodeDelete.do',
				type:'post',
				data:{"id":id},
				dataType: 'JSON',
				success:function(result){
					if(result.state==0){
						alert("删除成功");
					}
					window.location.reload();
				}
				});
	   }
	 closeDrugs();
}

//确认弹窗
function selectDrugs(obj){
	var ok = $(".ErrorDialog").Dialog("open");
}

$('.ErrorDialog').Dialog({
	title:'确认提示',
	autoOpen:false,
	width:400,
	height:200
});

function closeDrugs(){
	$('.ErrorDialog').Dialog('close');
}
