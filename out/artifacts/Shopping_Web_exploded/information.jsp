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
			 .display {
				position:absolute;
				left:30%;
				top:7%;
				width: auto;
				height: auto;
				text-align:center;
				line-height:40px;
				font-weight:bold;
				font-size:20px;
				border: medium double rgb(252, 50, 117);
				background:rgb(241, 207, 207);
			}
			.display .text{
				fon-size:24px;
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
	CarDAO dao = new CarDAO();
	Car cars=null;
	cars =dao.oneCar(kw); 
	%>
	<script>
        onload=function(){
        	if(<%=flag%>==1){
        		document.getElementById("gouwuche").innerHTML="<a href='cart.jsp'>购物车</a>"
        		document.getElementById("dl").innerText="欢迎您：<%=user.getUsername()%>";
        		document.getElementById("zc").innerHTML="<a href='LogoutServlet' target='_blank' >注销</a>";
        		document.getElementById("jiaru").innerHTML="<input type='submit' class='button' value='加入购物车' style='vertical-align:middle'>";
        	}else{
        		document.getElementById("dl").innerText="登录";
        		document.getElementById("zc").innerHTML="<a href='./register.html' target='_blank' >注册</a>";
        		document.getElementById("gouwuche").innerHTML="<a href='javascript:void(0)'>购物车</a>";
        		document.getElementById("jiaru").innerHTML="<input type='button' class='button' id='button' value='加入购物车' style='vertical-align:middle'>";
        		document.getElementById("button").onclick=function(){
        			alert("请登录后再加入购物车");
        		}
        		document.getElementById("gouwucheDiv").onclick=function(){
        			alert("请登录后再使用购物车功能！")
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
	<!-- <div class="text"><span>产品信息如下：</span></div> -->
	<form action="GouwucheSer" method="post">
	<div class="display" >
		<ul >
			<li><div class="text"><span>产品信息如下：</span></div>
			<li><div><img src=<%=cars.getImg()%> style="width:450px"></div>
			<li><div>车名:&nbsp;<%=cars.getCname()%></div>
			<li><div>品牌:&nbsp;<%=cars.getBrands()%></div>
			<li><div>类型:&nbsp;<%=cars.getItems()%></div>
			<li><div>价格(w):&nbsp;<%=cars.getPrice()%></div>
			<li><div>库存:&nbsp;<%=cars.getInventory()%></div>			
			<li><div>销量:&nbsp;<%=cars.getSales()%></div>
			<input type="hidden" name="cno" value="<%=cars.getCno()%>">
			<li><div id="jiaru"></div>
		</ul>
	</div>		
	</form>
	</body>
</html>