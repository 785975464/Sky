<%@taglib prefix="s" uri="/struts-tags" %><!-- pageEncoding="GB2312" -->
<%@ page pageEncoding="utf-8"%>

<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>视康云</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<script src="jquery/jquery-2.1.1.min.js"></script>
 <link rel="stylesheet" type="text/css" href="css/main.min.css" >
 <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
 <link rel="stylesheet" type="text/css" href="materialize/css/materialize.min.css"  media="screen,projection"/>
 <link rel="stylesheet" type="text/css" href="materialize/css/ghpages-materialize.css">
<script src="bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="materialize/js/materialize.min.js"></script>
  <script type="text/javascript" src="jquery/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="js/dataTables.bootstrap.js"></script>
  
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
	button:hover{
		background-color: #ec971f !important;
	}
  </style>
</head>

<body>	<!-- onload="code();" -->
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title" id="community-manage" >社区管理
					<!-- 用于实现下拉框查询学校 -->
					
					    <!-- <a href="createCommunityInfo.action" class="btn btn-sm"
					    	style="position:absolute;left:120px;top:2px;background-color: #3CBE86;color: #fff;"	>添加学生</a>
						<a href="download.action?fileName=muban.xlsx" class="btn btn-sm"
							style="position:absolute;left:200px;top:2px;background-color: #3CBE86;color: #fff;" >Excel文件模板</a> -->
					 
				</div>
				<div class="context">
					<form name="addform" id="addform" class="form-horizontal"
						action="downloadPersonInfo" method="post">
						<div class="table-responsive" style="height: 100%;overflow-y: auto;">
							<table class="table table-hover table-bordered big-data table-striped" id="mytable" name="mytable" >
							</table>
						</div>
						<div>
							<button type="button" class="btn btn-warning" style="position:absolute;left:20px;"
											id="choosebox" onclick="chooseAll()">全选</button>
							<button type="submit" class="btn btn-warning"  id="download" style="position:relative;left:120px;">下载</button>		
						</div>
					</form>
				</div>
						
<!--         		<form action="importCommunityExcelFile.action" enctype="multipart/form-data" method="post" id="importForm"> -->
<!--                 		<div style="position:relative;width:100%;height: 30px;margin-left: 10px;"> -->
<!-- 							<input id="fileSelect" name="uploadfile" type="file" style="border:1px solid; height: 30px;z-index:100;opacity: 0;position: absolute;top: 0;left: 0;width: 100px;" onchange="importFile()"> -->
<!-- 							<a id="importBtn" class="btn btn-default btn-sm" style="position: absolute; left: 0; top: 0; width: 100px;background-color: #3CBE86;color: #fff;">批量导入</a> -->
<!-- 							<a id="importSubmitBtn" class="btn btn-primary btn-sm hidden" style="position: absolute; left: 110px; top: 0; width: 80px;" -->
<!-- 								 onclick="a();$('#importForm').submit();" data-toggle="modal"  data-target="#myModal">确认提交</a> -->
								 <!-- 这两个属性data-toggle="modal"  data-target="#myModal"用来创建模态框 -->
<!-- 							<input id="fileName" type="text" class="hidden" value="" style="width:auto;height:30px;border:0;position:absolute;left:200px;top:0;" readonly> -->
<!-- 							<script type="text/javascript"> -->
<!-- 								function importFile() { -->
<!-- 									$('#importSubmitBtn').removeClass('hidden'); -->
<!-- 									$('#fileName').removeClass('hidden'); -->
<!-- 									document.getElementById('importBtn').innerHTML = '重新选择'; -->
<!-- 									$('#fileName').val($('#fileSelect').val());  //显示选择的文件 -->
<!-- 									var textWidth = $('#fileName').parent().width()-200; -->
<!-- 									$('#fileName').width(textWidth); -->
<!-- 								} -->
<!-- 							</script> -->
<!-- 							<a class="btn-sm" href="downloadFile.action?loadsql=<s:property value='loadsql'/>&loadvalues=<s:property value='loadvalues'/>"  -->
<!-- 								style="position:absolute;right:20px;top:2px;background-color: #3CBE86;color: #fff;" id="download">点击此处可将查询结果下载至本地</a> -->
							
<!-- 						</div> -->
						
<!--         		</form> -->
				 
				<!-- 模态框（Modal） -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
				   aria-labelledby="myModalLabel" aria-hidden="true" >
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" 
				               data-dismiss="modal" aria-hidden="true">
				                  &times;
				            </button>
				            <h4 class="modal-title" id="myModalLabel">
				              	 上传进度
				            </h4>
				         </div>
				         <div class="modal-body">
				      		正在上传中，请勿关闭页面！
				      		<div class="progress progress-striped active" >	<!-- style="width: 60%;" margin-left:20%; -->
							   <div class="progress-bar progress-bar-info" role="progressbar" id="myProBar"
							      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 	
							      style="width: 0%;">
							      <span class="sr-only"></span>	<!-- 30% 完成（信息） -->
							   </div>
							</div>
							<div>
								<h3>
								当前进度：
								</h3>
								<!-- 
								<button type="button" class="btn btn-info" onclick="setPro();">信息按钮</button>
								 -->
								<span style="color:#f00; text-align:center;display:block;font-size:20px;" id="check"></span>
							</div>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal" onclick="importCommunityResultInfo.jsp">停止		<!-- stopImport.action -->
				            </button>
				            <!-- 
				            <button type="button" class="btn btn-primary">
				             	  提交更改
				            </button>
				             -->
				         </div>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
				
				
			</div>
		</div>
	</div>
	
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
        	"url":"communityInfo.action",
        	"dataType":"json" //返回来的数据形式
        },
        "columns":[ //定义列数据来源
			{'title':"用户名",'data':"username",'class':"myhiddenelement"},
			{'title':"勾选",'data':null,'class':"align-center"},
			{'title':"姓名",'data':"realname"},
			{'title':"性别",'data':"gender"},
			{'title':"出生日期",'data':"age"},
			{'title':"学校",'data':"schoolname"},
			{'title':"年级",'data':"grade"},
			{'title':"班级",'data':"stuClass"},
			{'title':"民族",'data':"nation"},
			{'title':"身高",'data':"height"},
			{'title':"体重",'data':"weight"},
			{'title':"监护人",'data':"guardianName"},
			{'title':"视觉等级",'data':"visionlevel"},
			{'title':"操作",'data':null,'class':"align-center"} // 自定义列
			
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
	        	"targets": [1],
	        	"render": function(data, type, row ,full) {
// 	        		return  row.community+"("+row.province+","+row.city+","+row.county+","+row.street+")";
	        		return "<input type='checkbox' id='"+row.username+"' name='downloadbox' value='"+row.username+"' class='mycheckbox'/><label for='"+row.username+"' ></label>";
	        	}
	        },
	        {
	        	"targets": [13],
	        	"render": function(data, type, row ,full) {
	        		return  "<a class='btn-sm' href='modifyCommunityInfo.action?username="+row.username+"'>修改</a>"+
	        				"<a class='btn-sm' onclick='_deleteFun(this)'>删除</a>"+
	        				"<a class='btn-sm' href='stuVisionInfo.action?username="+row.username+"'>档案</a>";
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

//删除操作
function _deleteFun(obj) {
	var tr=obj.parentNode.parentNode;	// 按钮的父节点的父节点是tr
	var id = tr.cells[0].innerText;
// 	console.log("要删除的用户id为："+id);
	if(!confirm('确定要删除吗？')){
		return;
	}
	$.ajax({
	    //url: "__MODULE__/School/deleteSchool",
	    url: "delPersonInfo.action",
	    data: {"username": id},
	    type: "post",
	    success: function (backdata) {
	    	var obj=eval('('+backdata+')');
// 		    console.log(backdata);
	        if (backdata.indexOf("成功")>0) {
	            start = $("#mytable").dataTable().fnSettings()._iDisplayStart; 
				total = $("#mytable").dataTable().fnSettings().fnRecordsDisplay(); 

				table.ajax.reload();

				if((total-start)==1){ 
					if (start > 0) { 
						// $("#mytable").dataTable().fnPageChange( 'previous', true ); 
						table.fnPageChange( 'previous', true );
					}
				}
	        } 
	        Materialize.toast(obj.msg, 2000);
	    },
	    error: function (error) {
// 		    Materialize.toast("网络异常，请稍后再试！", 2000);
			var obj=eval('('+error+')');
	    	Materialize.toast(obj.msg, 2000);
	        console.log(error);
	    }
	});
}



function chooseAll(){
	var downloadbox = document.getElementsByName("downloadbox");
	if(document.getElementById("choosebox").innerHTML=="全选"){
		for(var i=0;i<downloadbox.length;i++){
			downloadbox[i].checked = true;
		}
		document.getElementById("choosebox").innerHTML="取消";
	}
	else{
		for(var i=0;i<downloadbox.length;i++){
			downloadbox[i].checked = false;
		}
		document.getElementById("choosebox").innerHTML="全选";
	}
}




		var timerId;
		//var index=0;
		function a(){
			//每隔0.5秒自动调用方法，实现进度条的实时更新
			//timerId=window.setInterval(getForm,500);
			timerId=window.setInterval(checkprocess,500);
		}
// 		function checkprocess() {
// 			alert("checkprocess");
// 			var username = document.getElementById("username").value;
// 			var url = "checkProcess.action";
// 			createXMLHttpRequest();
// 			xmlHttpReq.open("POST", url, true);
// 			xmlHttpReq.onreadystatechange = getRowsPercentage;
// 			xmlHttpReq.send(null);
// 		}
		
// 		function getRowsPercentage() {
// 			alert(xmlHttpReq.readyState);
// 			if (xmlHttpReq.readyState == 4) {
// 				alert("已接收到完整信息！xmlHttpReq.responseText为"+xmlHttpReq.responseText);
// 				var rows = eval('(' + xmlHttpReq.responseText + ')');
// 				var currentrows = rows.CURRENTROWS-3;
// 				var totalrows = rows.TOTALROWS-4;
// 				if(totalrows<=0){
// 					document.getElementById("check").innerText = "0%";
// 					document.getElementById("myProBar").style.width="0%";
// 					alert(currentrows*100/totalrows);		//后台返回删除成功消息
// 				}
// 				else{
// 					document.getElementById("check").innerText = Math.round(currentrows*100/totalrows)+"%";
// 					document.getElementById("myProBar").style.width=currentrows*100/totalrows+"%";
// 				}
// 				if(currentrows*100/totalrows>=100){
// 					window.clearInterval(timerId);
// 					document.getElementById("check").innerText = "已完成！";
// 				}
// 			}
// 		}

		function code(){
			var href = document.getElementById("download").href;
			document.getElementById("download").href = encodeURI(href);
		}
	</script>
	<script type="text/javascript">   
       function downloadfile()    
      {
              var communitymanage = document.getElementById("community-manage");
              var importForm = document.getElementById("importForm");
              var userID = document.getElementById("userID");
              var operate = document.getElementById("operate");
              var pageTable = document.getElementById("pageTable");
              var exportBtn = document.getElementById("exportBtn");
              
              communitymanage.style.display="none";				//隐藏控件
              importForm.style.display="none";
              //userID.style.display="";
              operate.style.display="none";
              exportBtn.style.display="none";
              pageTable.style.display="none";

			  var tb=document.getElementById("table_export");    //获取表格对象
			  //alert("tb.rows.length为："+tb.rows.length);
			  //alert("tb.rows.cells.length为："+tb.rows[0].cells.length);

			  for(var i = 0; i<tb.rows.length; i++){
			  	tb.rows[i].cells[0].style.display="";
			  	tb.rows[i].cells[tb.rows[0].cells.length-1].style.display="none";
              }

              window.document.execCommand("SelectAll");
	          window.document.execCommand("Copy");
	          
	          communitymanage.style.display="";			//恢复显示
	          importForm.style.display="";
	          //userID.style.display="display";
	          operate.style.display="";
			  for(var i = 0; i<tb.rows.length; i++){
			  	tb.rows[i].cells[0].style.display="none";
			  	tb.rows[i].cells[tb.rows[0].cells.length-1].style.display="";
              }
              exportBtn.style.display="";
              pageTable.style.display="";
			  alert("已成功复制表格！请粘贴至Excel中！");
      }    
    </script>
</body>
</html>
