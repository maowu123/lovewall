<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="./layui/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->

</head>
<body style="background-color: #F2F2F2;">

<div style="position:absolute;width:100%;">
    
        <img src="./image/5.jpg" width="100%" height="100%" />
        <span style="position: absolute; top:70%; left:43%;">添加文字...添加文字...添加文字...</span>
    
</div> 
<!-- <div style="width:1200px; height:200px; background:url(./image/1.jpg) center;text-align:center">表示的字</div> -->
<div class="layui-carousel" id="test10" style="width:100%;position:absolute;top:50%" align="center">
  <div carousel-item="">
    <div><img src="./image/1.jpg"></div>
    <div><img src="./image/1.jpg"></div>
    <div><img src="./image/1.jpg"></div>
    <div><img src="./image/1.jpg"></div>
    <div><img src="./image/1.jpg"></div>
    <div><img src="./image/1.jpg"></div>
    <div><img src="./image/1.jpg"></div>
  </div>
</div>
<div style="width:100%;position:absolute;top:100%;text-align=center">		
	<hr class="layui-bg-black">
	<div align="center">暂定名称：铁大表白墙</div> 
	<div align="center">制作人：王任义，张明倬，郭斌</div>
</div>
<script src="./layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
</script>
<script>
layui.use(['carousel', 'form'], function(){
  var carousel = layui.carousel
  ,form = layui.form;
  
  //常规轮播
  carousel.render({
    elem: '#test1'
    ,arrow: 'always'
  });
  
  //改变下时间间隔、动画类型、高度
  carousel.render({
    elem: '#test2'
    ,interval: 1800
    ,anim: 'fade'
    ,height: '120px'
  });
  
  //设定各种参数
  var ins3 = carousel.render({
    elem: '#test3'
  });
  //图片轮播
  carousel.render({
    elem: '#test10'
    ,width: '100%'
    ,height: '40%'
    ,interval: 5000
  });
  
  //事件
  carousel.on('change(test4)', function(res){
    console.log(res)
  });
  
  var $ = layui.$, active = {
    set: function(othis){
      var THIS = 'layui-bg-normal'
      ,key = othis.data('key')
      ,options = {};
      
      othis.css('background-color', '#5FB878').siblings().removeAttr('style'); 
      options[key] = othis.data('value');
      ins3.reload(options);
    }
  };
  
  //监听开关
  form.on('switch(autoplay)', function(){
    ins3.reload({
      autoplay: this.checked
    });
  });
  
  $('.demoSet').on('keyup', function(){
    var value = this.value
    ,options = {};
    if(!/^\d+$/.test(value)) return;
    
    options[this.name] = value;
    ins3.reload(options);
  });
  
  //其它示例
  $('.demoTest .layui-btn').on('click', function(){
    var othis = $(this), type = othis.data('type');
    active[type] ? active[type].call(this, othis) : '';
  });
});
</script>
</body>
</html>