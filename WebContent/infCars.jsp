<%@page import="com.clh.bean.*,
java.util.List,
com.clh.dao.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
			<title>小米汽车商城</title>
		<script type="text/javascript" src="./js/index.js"></script>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<link rel="stylesheet" type="text/css" href="./css/myself.css">
		<style>
			body{
				background: rgb(159, 195, 204);
			}
			.empty{
				font-size:50px;
				color:red;
				background: rgb(255, 118, 152,0.1);
			}
			.empty .fanhui{
				font-size:40px;
				text-align:center
			}
				 .display2 {
				width: auto;
				height: auto;
				text-align:center;
				line-height:35px;
				font-weight:bold;
				font-size:16px;
				border: medium double rgb(140, 238, 225);
				background:rgb(241, 207, 207);
			}
			 .tishi{
			 font-size:34px;
			 font-weight:bold;
			 text-align:center;
			 }
			 .biaoge{
			 position: absolute;
			 left:10%; top:10%;
			 width: auto;
			 height: auto;
			 }
			 .button {
			  display: inline-block;
			  border-radius: 4px;
			  background-color: #f4511e;
			  border: none;
			  color: #FFFFFF;
			  text-align: center;
			  font-size: 15px;
			  padding: 12px;
 		 	  width: 125px;
			  transition: all 0.5s;
			  cursor: pointer;
			  margin: 5px;
			}
			
		</style>
			
	</head>
	
	
	<body>
<%	//获取sessio用户名
	User user=new User();
	user.setUsername((String)session.getAttribute("username"));
	int flag=0;
	String u=null;
	if(user.getUsername()!=null){
		flag=1;
	}
	//展示车子
	String kw = request.getParameter("carInf");
	String kw2 = request.getParameter("carInf2");
	if(kw2!=null){
		kw=kw+kw2;
	}
	CarDAO dao = new CarDAO();
	List<Car> cars=null;
	cars =dao.list(kw); 
	%>
	<script>
        onload=function(){
        	if(<%=flag%>==1){
        		document.getElementById("gouwuche").innerHTML="<a href='cart.jsp'>购物车</a>"
        		document.getElementById("dl").innerText="欢迎您：<%=user.getUsername()%>";
        		document.getElementById("zc").innerHTML="<a href='LogoutServlet' target='_blank' >注销</a>";
        	}else{
        		document.getElementById("gouwuche").innerHTML="<a href='javascript:void(0)'>购物车</a>";
        		document.getElementById("dl").innerText="登录";
        		document.getElementById("zc").innerHTML="<a href='./register.html' target='_blank' >注册</a>";
        		document.getElementById("gouwuche").innerHTML="<a href='javascript:void(0)'>购物车</a>";
        		document.getElementById("gouwucheDiv").onclick=function(){
        			alert("请登录后再使用此功能！")
        		}
        	}
        }	
    </script>

	<!-- start header -->
		<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="index.jsp" target="_blank"><span style="font-size:20px">首页</span></a></li>

					</ul>
				</div>
				<div class="right fr">
					<div class="gouwuche fr" id="gouwucheDiv"><span id="gouwuche"></span></div>
					<div class="fr">
						<ul>
							<li><a href="./login.html" target="_blank"><span id="dl"></span></a></li>
							<li>|</li>
							<li id="zc"><a href="./register.html" target="_blank" ></a></li>
							<li>|</li>
							<li><a href="">消息通知</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!-- 商品 -->
	
	<table class="biaoge">
	<%
	if(cars.isEmpty()){%>
		<tr><td><div class="empty">不存在该信息<a href="index.jsp" class="fanhui">点击返回</a></div></td></tr>
	<%}else{
		int i=0; %>
		<tr><td><span class="tishi">找到以下车辆--></span><td><tr>
		<%for(Car c:cars){
			i++;
			if(i%4==1){%> 
			<tr>
				<td>
				<div class="display2">
				<form action="GouwucheSer" method="post">
					<ul>
						
						<li><div><img src=<%=c.getImg()%> style="width:300px"></div>
						<li><div>车名:&nbsp;<%=c.getCname()%></div>
						<li><div>品牌:&nbsp;<%=c.getBrands()%></div>
						<li><div>类型:&nbsp;<%=c.getItems()%></div>
						<li><div>价格:&nbsp;<%=c.getPrice()%></div>
						<li><div>库存:&nbsp;<%=c.getInventory()%></div>			
						<li><div>销量:&nbsp;<%=c.getSales()%></div>
						<input type="hidden" name="cno" value="<%=c.getCno()%>" />
						<li><div id="jiaru1"><input type="submit" class="button" value="加入购物车" style="vertical-align:middle"></div>
						
					</ul>
					</form>
				</div>
				</td>
			<%}else if(i%4==0){ %>
				<td>
				<div class="display2">
				<form action="GouwucheSer" method="post">
					<ul>
						<li><div><img src=<%=c.getImg()%> style="width:300px"></div>
						<li><div>车名:&nbsp;<%=c.getCname()%></div>
						<li><div>品牌:&nbsp;<%=c.getBrands()%></div>
						<li><div>类型:&nbsp;<%=c.getItems()%></div>
						<li><div>价格:&nbsp;<%=c.getPrice()%></div>
						<li><div>库存:&nbsp;<%=c.getInventory()%></div>			
						<li><div>销量:&nbsp;<%=c.getSales()%></div>
						<input type="hidden" name="cno" value="<%=c.getCno()%>">
						<li><div id="jiaru2"><input type="submit" class="button" value="加入购物车" style="vertical-align:middle"></div>
					</ul>
					</form>
				</div>
				</td>
			<tr>
			<%}else{%>
				<td>
				<div class="display2">
				<form action="GouwucheSer" method="post">
					<ul>
						<li><div><img src=<%=c.getImg()%> style="width:300px"></div>
						<li><div>车名:&nbsp;<%=c.getCname()%></div>
						<li><div>品牌:&nbsp;<%=c.getBrands()%></div>
						<li><div>类型:&nbsp;<%=c.getItems()%></div>
						<li><div>价格(w):&nbsp;<%=c.getPrice()%></div>
						<li><div>库存:&nbsp;<%=c.getInventory()%></div>			
						<li><div>销量:&nbsp;<%=c.getSales()%></div>
						<input type="hidden" name="cno" value="<%=c.getCno()%>">
						<li><div id="jiaru3"><input type="submit" class="button" value="加入购物车" style="vertical-align:middle"></div>
					</ul>
					</form>	
				</div>
				<td>
			<%}
		}
	}%>

	</table>
	
	</body>
</html>