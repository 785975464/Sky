<%@taglib prefix="s" uri="/struts-tags" %><!-- pageEncoding="GB2312" -->

<%@ page pageEncoding="utf-8"%>

<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>视康云</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<script src="jquery/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.min.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
 <link rel="stylesheet" type="text/css" href="materialize/css/materialize.min.css"  media="screen,projection"/>
 <link rel="stylesheet" type="text/css" href="materialize/css/ghpages-materialize.css">

<script src="bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="jquery/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="js/dataTables.bootstrap.js"></script>
  
</head>
  <style type="text/css">
	html,body{
		height:100%;
	}
	.sky-content{
		height:500px;
	}
	.align-center {
	   text-align:center;
	}
	.sky-content .part4 .context .row {
		padding-left: 0%;
		height: 0;
	}
	.myhiddenelement{
		display:none;
	}
  </style>
<body>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title" id="community-manage" >视觉分级管理
				</div>
				
				<div class="context">
						<div class="table-responsive" style="height: 100%;overflow-y: auto;">
							<table class="table table-hover table-bordered big-data table-striped" id="mytable" name="mytable" >
							</table>
						</div>
						<%-- <div>
							<input type="button"  id="exportBtn" style=" left: 0px; top: 2px;width:120px;
								 background-color: #3CBE86;color: #fff;" onclick="downloadfile();" value="数据导出"/>
						</div>
						  <form action="CommunityEyesightServlet.servlet" method="POST" id="visionTj">
  							<div>
  								<input type="hidden" value="${session.loginuser.getAddress()}" name="address" id="address"/>
        						<input type="submit" name="btn" id="btn" style="position:relative;top: 20px;width:120px;
        							background-color: #3CBE86;color: #fff;" value="查看视觉统计图" />
        					</div>
  						  </form> --%>

				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var height = document.getElementById("page-container").scrollHeight;
		parent.AdjustIframeHeight(height);
		$(window).resize(function() {
			var height = document.getElementById("page-container").scrollHeight;
			parent.AdjustIframeHeight(height);
		});
	</script>
	
<script type="text/javascript">
var table;	//申明全局变量
$(document).ready( function () {
	table = $('#mytable').DataTable({
		"paging":true,
		"pagingType":"full_numbers",
		"lengthMenu":[10,25,50],
		"processing": true,
		// 'bStateSave': true,	//状态保存
		"searching": true, //是否开启搜索
        //"serverSide": true,//开启服务器获取数据，true代表后台处理分页，false代表前台处理分页  
        // "order": [[ 0, "desc" ]], //默认排序
		"ajax":{ // 获取数据
        	"url":"communityVisionInfo.action",
        	"dataType":"json" //返回来的数据形式
        },
        "columns":[ //定义列数据来源
			{'title':"用户名",'data':"username",'class':"myhiddenelement"},
			{'title':"姓名",'data':"realname"},
			{'title':"出生日期",'data':"age"},
			{'title':"联系电话",'data':"phone"},
			{'title':"学校",'data':"schoolname"},
			{'title':"最近筛查日期",'data':"checkTime"},
			{'title':"复查天数",'data':null},
			{'title':"rightEyeLittleValue",'data':"rightEyeLittleValue",'class':"myhiddenelement"},
			{'title':"rightEyeVisualFunction",'data':"rightEyeVisualFunction",'class':"myhiddenelement"},
			{'title':"leftEyeLittleValue",'data':"leftEyeLittleValue",'class':"myhiddenelement"},
			{'title':"leftEyeVisualFunction",'data':"leftEyeVisualFunction",'class':"myhiddenelement"},
			{'title':"右眼视觉等级",'data':null},
			{'title':"左眼视觉等级",'data':null},
			{'title':"视觉等级",'data':"visionlevel"},
			{'title':"操作",'data':null} // 自定义列
			
			// {'title':"AddressID",'data':"a_id",'class':"myhiddenelement"},

			
			// {'title':"District",'data':null,'class':"align-center"}, // 自定义列
			// {'title':"action",'data':null,'class':"align-center"} // 自定义列
		],

  		"columnDefs": [
  		// 	{
	   //      	"targets":[3,4,5,6,7],
	   //      	"visible":false //隐藏列
	   //      },
	   		{
	        	"targets": [6],
	        	"render": function(data, type, row ,full) {
	        		return  recheckDays(row.checkTime,row.visionlevel);
	        	}
	        },
  			{
	        	"targets": [11],
	        	"render": function(data, type, row ,full) {
	        		return  levelComputing(row.rightEyeLittleValue,row.leftEyeLittleValue,row.rightEyeVisualFunction,row.age);
	        	}
	        },
	        {
	        	"targets": [12],
	        	"render": function(data, type, row ,full) {
	        		return  levelComputing(row.leftEyeLittleValue,row.rightEyeLittleValue,row.leftEyeVisualFunction,row.age);
	        	}
	        },
	        {
	        	"targets": [14],
	        	"render": function(data, type, row ,full) {
	        		return  "<a class='btn-sm' href='stuVisionInfo.action?username="+row.username+"'>查看视觉档案</a>";
	        				//"<a class='btn-sm' href='modifyCommunityInfo.action?username="+row.username+"'>修改</a>"+
	        				//"<a class='btn-sm' onclick='_deleteFun(this)'>删除</a>"+
	        				//"<a class='btn-sm' href='stuVisionInfo.action?username="+row.username+"'>档案</a>";
	        	}
	        }
	    ],

  		"language":{ // 定义语言
        	"sProcessing":"加载中...",
        	"sLengthMenu":"每页显示 _MENU_ 条记录",
        	"sZeroRecords":"没有匹配的结果",
        	"sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "搜索:",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上一页",
                "sNext": "下一页",
                "sLast": "末页"
            },
            "oAria": {
                "sSortAscending": ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        }
	});
});

//计算复查天数
function recheckDays(checkTime,level){
	
	try {
		var nowtime=Date.parse(new Date());
		var lasttime=Date.parse(checkTime);
// 		console.log("nowtime:"+nowtime+" & lasttime:"+lasttime);
		var days=parseInt((nowtime-lasttime)/(1000*60*60*24));
		if(level=="预警"){
			return showTips(60-days);
		}
		if(level=="正常" || level=="异常" || level=="亚健康"){
			return showTips(90-days);
		}
		return "视觉健康档案异常";
	}catch(err){
		console.log(err);
		return "视觉健康档案异常";
	}
}
//给出就诊提示
function showTips(days){
	var d=parseInt(days);
	var dd=Math.abs(d);
	if(d>0){
		if(d<10){
			dd = "00"+d;
		}
		else if(d<100){
			dd = "0"+d;
		}
		return "距离下次复查还有"+dd+"天";
	}
	else{
// 		d=Math.abs(d);
		if(dd<10){
			dd = "00"+dd;
		}
		else if(dd<100){
			dd = "0"+dd;
		}
		return "距离本次复查已超过"+dd+"天";
	}
}
//计算左右眼视觉等级	
function levelComputing(EyeValue, anotherEyeValue, VisualFunction, birthdate){
	///System.out.println("This is levelComputing()!");
	//System.out.println("接收到的参数为："+EyeValue+VisualFunction+age);
	var state = -2;
	var visionstate= ["未知","异常","预警","正常","错误","亚健康"];	//存放视觉状态，1表示正常，0表示预警，-1表示异常，-2表示未知，2表示错误，3表示亚健康
	try{
		var temp=Math.abs( (Math.log(1/EyeValue)-Math.log(1/anotherEyeValue))/Math.log(10) );
		if( isNaN(temp) || !isFinite(temp) ){		//如果temp计算结果异常，则置为错误，状态2
			state = 2;
			return visionstate[state+2];
		}
		if(temp>=0.2){
			state = -1;
			return visionstate[state+2];
		}
		
		var d = new Date();
		var born = new Date(birthdate);
		var age=d.getFullYear()-born.getFullYear();
		state = IsVisualFunctionNormal(EyeValue,VisualFunction,age);
		return visionstate[state+2];
	}catch(err){
		console.log(err);
		state = 2;
		return visionstate[state+2];
	}
}
	
///******************************判断每个学生视力是否正常
function IsVisualFunctionNormal(EyeValue, VisualFunction, age){
	//System.out.println("EyeValue:"+EyeValue+"\tVisualFunction:"+VisualFunction+"\tage"+age);
	if(!IsAgeLegal(EyeValue,age)){
		return -1;
	}
	else if(VisualFunction<=0.36){
		return 1;
	}
	else if(VisualFunction>0.36 && VisualFunction<=0.46){
		return 0;
	}
	else //if(VisualFunction>0.45)
		{
		return 3;
	}
}
	
///******************************判断每个学生年龄是否合法	
function IsAgeLegal(EyeValue,age){
	if(age>=0 && age<5){
		if(EyeValue>=0.45)	//EyeValue>=0.5，2016-6-20修改阈值
			return true;
		else
			return false;
	}
	else if(age>=5 && age<8){
		if(EyeValue>=0.55)	//EyeValue>=0.5
			return true;
		else
			return false;
	}
	else if(age>=8 && age<12){
		if(EyeValue>=0.7)	//EyeValue>=0.8
			return true;
		else
			return false;
	}
	else if(age>=12 && age<150){
		if(EyeValue>=0.9)	//EyeValue>=1.0
			return true;
		else
			return false;
	}
	else
		return false;
}
	
	</script>
	<script type="text/javascript">   
       function downloadfile()    
      {
              var communitymanage = document.getElementById("community-manage");
              //var importForm = document.getElementById("importForm");
              //var userID = document.getElementById("userID");
              //var operate = document.getElementById("operate");
              var pageTable = document.getElementById("pageTable");
              var exportBtn = document.getElementById("exportBtn");
              var visionTj = document.getElementById("visionTj");
              
              communitymanage.style.display="none";				//隐藏控件
              exportBtn.style.display="none";
              pageTable.style.display="none";
              visionTj.style.display="none";

			  var tb=document.getElementById("table_export");    //获取表格对象
			  //alert("tb.rows.length为："+tb.rows.length);
			  //alert("tb.rows.cells.length为："+tb.rows[0].cells.length);
			  
			  for(var i = 0; i<tb.rows.length; i++){
			  	//tb.rows[i].cells[0].style.display="";
			  	tb.rows[i].cells[tb.rows[0].cells.length-1].style.display="none";
              }
              

              window.document.execCommand("SelectAll");
	          window.document.execCommand("Copy");
	          
	          communitymanage.style.display="";			//恢复显示
	          //importForm.style.display="";
	          //userID.style.display="display";
	          //operate.style.display="";
			  
			  for(var i = 0; i<tb.rows.length; i++){
			  	//tb.rows[i].cells[0].style.display="none";
			  	tb.rows[i].cells[tb.rows[0].cells.length-1].style.display="";
              }
              
              exportBtn.style.display="";
              pageTable.style.display="";
              visionTj.style.display="";
			  alert("已成功复制表格！请粘贴至Excel中！");
      }    
    </script>
</body>
</html>
