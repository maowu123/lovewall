<%@page import="org.java.pojo.Biaobai3"%>
<%@page import="org.java.pojo.Biaobai2"%>
<%@page import="org.java.pojo.Biaobai1"%>
<%@page import="org.java.pojo.Biaobai4"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.java.pojo.Biaobai5"%>
<%@page import="java.util.List"%>
<%@page import="org.java.dao.impl.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="<%=request.getContextPath()%>/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css" media="all">
<style type="text/css">
#md6 {
  background: -webkit-linear-gradient(left top, #b0e0e6 , #ffffff,  #ffffff); 
  background: -o-linear-gradient(bottom right, #b0e0e6,  #ffffff,  #ffffff); 
  background: -moz-linear-gradient(bottom right, #b0e0e6,  #ffffff,  #ffffff); 
  background: linear-gradient(to bottom right, #b0e0e6 ,  #ffffff,  #ffffff); 
}
html { overflow-x:hidden; }
</style>
</head>
<body>
	
	<div class="layui-row layui-col-space15" style="float: center">
	<%
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		List<Biaobai1> biaobai1list = DaoFactory.getBiaobai1Dao().getAll();
		for (Biaobai1 biaobai1 : biaobai1list) {
	%>
		<div class="layui-col-md6" style="width:100%;">
			<div class="layui-card" id="md6">
				<div class="layui-card-header">
					<img src="<%=request.getContextPath()%>/img/user.jpg" width="40"
						height="40" /> 用户名
				</div>
				<div class="layui-card-body">
					我要表白<%=biaobai1.getDepartment()%>的 <a href=""> <%=biaobai1.getLovename()%></a>
					<%=biaobai1.getGender()%><br> 我想说:<%=biaobai1.getContentwithouthtml()%><br>
					<a
						href="<%=request.getContextPath()%>/biaobai/biaobai1Show.jsp?id=<%=biaobai1.getId()%>"
						style="float: right">
						<button class="btn btn-info btn-mini">详细信息</button>
					</a><br>
					<div class="layui-card-header"></div>
					<div style="margin: 5px 5px 5px 5px;">
						<div style="margin: 5px 5px 5px 5px; float: left;">
							<img src="a.jpg" width="100" height="100" />
						</div>
						<div style="margin: 5px 5px 5px 5px; float: left;">
							<img src="a.jpg" width="100" height="100" />
						</div>
						<div style="margin: 5px 5px 5px 5px; float: left;">
							<img src="a.jpg" width="100" height="100" />
						</div>
					</div>
					<div style="clear: both;">
						<i class="icon-thumbs-up"></i><%=biaobai1.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-comment"></i><%=biaobai1.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-calendar"></i><%=format.format(biaobai1.getIssuedate())%>
					</div>
				</div>
			</div>
		</div>
		<br />
			<%
		}
	%>
	</div>
	<script src="<%=request.getContextPath()%>/layui/layui.js"
		charset="utf-8"></script>
	<script>
		layui.use('element', function() {
			var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script>
	<script>
		layui.use([ 'element', 'layer' ], function() {
			var element = layui.element;
			var layer = layui.layer;

			//监听折叠
			element.on('collapse(test)', function(data) {
				layer.msg('展开状态：' + data.show);
			});
		});
	</script>
	<script>
		layui
				.use(
						[ 'laypage', 'layer' ],
						function() {
							var laypage = layui.laypage, layer = layui.layer;

							//总页数低于页码总数
							laypage.render({
								elem : 'demo0',
								count : 50
							//数据总数
							});

							//总页数大于页码总数
							laypage.render({
								elem : 'demo1',
								count : 70 //数据总数
								,
								jump : function(obj) {
									console.log(obj)
								}
							});

							//自定义样式
							laypage.render({
								elem : 'demo2',
								count : 100,
								theme : '#1E9FFF'
							});
							laypage.render({
								elem : 'demo2-1',
								count : 100,
								theme : '#FF5722'
							});
							laypage.render({
								elem : 'demo2-2',
								count : 100,
								theme : '#FFB800'
							});

							//自定义首页、尾页、上一页、下一页文本
							laypage.render({
								elem : 'demo3',
								count : 100,
								first : '首页',
								last : '尾页',
								prev : '<em>←</em>',
								next : '<em>→</em>'
							});

							//不显示首页尾页
							laypage.render({
								elem : 'demo4',
								count : 100,
								first : false,
								last : false
							});

							//开启HASH
							laypage.render({
								elem : 'demo5',
								count : 500,
								curr : location.hash.replace('#!fenye=', '') //获取hash值为fenye的当前页
								,
								hash : 'fenye' //自定义hash值
							});

							//只显示上一页、下一页
							laypage.render({
								elem : 'demo6',
								count : 50,
								layout : [ 'prev', 'next' ],
								jump : function(obj, first) {
									if (!first) {
										layer.msg('第 ' + obj.curr + ' 页');
									}
								}
							});

							//完整功能
							laypage.render({
								elem : 'demo7',
								count : 100,
								layout : [ 'count', 'prev', 'page', 'next',
										'limit', 'refresh', 'skip' ],
								jump : function(obj) {
									console.log(obj)
								}
							});

							//自定义排版
							laypage.render({
								elem : 'demo8',
								count : 1000,
								layout : [ 'limit', 'prev', 'page', 'next' ]
							});
							laypage.render({
								elem : 'demo9',
								count : 1000,
								layout : [ 'prev', 'next', 'page' ]
							});
							laypage.render({
								elem : 'demo10',
								count : 1000,
								layout : [ 'page', 'count' ]
							});

							//自定义每页条数的选择项
							laypage.render({
								elem : 'demo11',
								count : 1000,
								limit : 100,
								limits : [ 100, 300, 500 ]
							});

							//将一段数组分页展示

							//测试数据
							var data = [ '北京', '上海', '广州', '深圳', '杭州', '长沙',
									'合肥', '宁夏', '成都', '西安', '南昌', '上饶', '沈阳',
									'济南', '厦门', '福州', '九江', '宜春', '赣州', '宁波',
									'绍兴', '无锡', '苏州', '徐州', '东莞', '佛山', '中山',
									'成都', '武汉', '青岛', '天津', '重庆', '南京', '九江',
									'香港', '澳门', '台北' ];

							//调用分页
							laypage
									.render({
										elem : 'demo20',
										count : data.length,
										jump : function(obj) {
											//模拟渲染
											document
													.getElementById('biuuu_city_list').innerHTML = function() {
												var arr = [], thisData = data
														.concat()
														.splice(
																obj.curr
																		* obj.limit
																		- obj.limit,
																obj.limit);
												layui.each(thisData, function(
														index, item) {
													arr.push('<li>' + item
															+ '</li>');
												});
												return arr.join('');
											}();
										}
									});

						});
	</script>
	<hr>
	<br />
</body>
</html>