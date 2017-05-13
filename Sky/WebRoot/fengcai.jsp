<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>视康云</title>
<link href="css/datouwang.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/koala.min.1.5.js"></script>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}
</style>
</head>
<body>
	<div id="fsD1" class="focus" style="margin:20px 0 0 20px;">
		<div id="D1pic1" class="fPic">
			<div class="fcon" style="display: none;">
				<a href="#"><img src="images/01.png"
					style="opacity: 1; "> </a> <span class="shadow"><a
					href="#">“亮睛行动”走进龙岗实验学校</a> </span>
			</div>

			<div class="fcon" style="display: none;">
				<a href="#"><img src="images/02.png"
					style="opacity: 1; "> </a> <span class="shadow"><a
					href="#">“亮睛行动”受邀参加广西青少年近视预防项目</a> </span>
			</div>

			<div class="fcon" style="display: none;">
				<a href="#"><img src="images/03.png"
					style="opacity: 1; "> </a> <span class="shadow"><a
					href="#">“亮睛行动”建立大鹏第二小学站</a> </span>
			</div>

			<div class="fcon" style="display: none;">
				<a href="#"><img src="images/04.png"
					style="opacity: 1; "> </a> <span class="shadow"><a
					href="#">“亮睛行动”走进五联崇和学校</a> </span>
			</div>
			<div class="fcon" style="display: none;">
				<a href="#"><img src="images/05.png"
					style="opacity: 1; "> </a> <span class="shadow"><a
					href="#">“视觉健康关爱服务站”项目参加第三届中国慈展会</a> </span>
			</div>
			<div class="fcon" style="display: none;">
				<a href="#"><img src="images/06.png"
					style="opacity: 1; "> </a> <span class="shadow"><a
					href="#">国务院副主任苏凤杰参观指导景龙服务站工作</a> </span>
			</div>
		</div>
		<div class="fbg">
			<div class="D1fBt" id="D1fBt">
				<a href="javascript:void(0)" hidefocus="true" target="_self"
					class=""><i>1</i> </a> <a href="javascript:void(0)"
					hidefocus="true" target="_self" class=""><i>2</i> </a> <a
					href="javascript:void(0)" hidefocus="true" target="_self"
					class="current"><i>3</i> </a> <a href="javascript:void(0)"
					hidefocus="true" target="_self" class=""><i>4</i> </a><a
					href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>5</i>
				</a><a href="javascript:void(0)" hidefocus="true" target="_self"
					class=""><i>6</i> </a>
			</div>
		</div>
		<span class="prev"></span> <span class="next"></span>
	</div>
	<script type="text/javascript">
		Qfast.add('widgets', {
			path : "js/terminator2.2.min.js",
			type : "js",
			requires : [ 'fx' ]
		});
		Qfast(false, 'widgets', function() {
			K.tabs({
				id : 'fsD1', //焦点图包裹id  
				conId : "D1pic1", //** 大图域包裹id  
				tabId : "D1fBt",
				tabTn : "a",
				conCn : '.fcon', //** 大图域配置class       
				auto : 1, //自动播放 1或0
				effect : 'fade', //效果配置
				eType : 'click', //** 鼠标事件
				pageBt : true,//是否有按钮切换页码
				bns : [ '.prev', '.next' ],//** 前后按钮配置class                          
				interval : 3000
			//** 停顿时间  
			})
		})
	</script>
	<div style="text-align:center;clear:both;">
		<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
		<script src="/follow.js" type="text/javascript"></script>
	</div>
</body>

</html>