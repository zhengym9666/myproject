<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/31
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<script src="js/lib/jquery.min.js" type="text/javascript"></script>
<head>
    <style>
        *{margin:0px; padding:0px;}
         ul{
             width:520px;
         height:30px;
         list-style:none;
         }
        ul li{
            width:64px; height:30px;
        border:1px solid #000;
        float:left;
        line-height:30px;
        text-align:center;

        }
        ul li ul{
            width:65px; height:95px;background:#F00;
        display:none;
        }
        ul li:hover ul{
            display:block;
        }
    </style>
</head>
<body>
<title>Title</title>
<ul>
        <li>浮动1
            <ul>
                    <li>二级1</li>
                    <li>二级2</li>
                    <li>二级3</li>
                    </ul>
            </li>
            <li>浮动2
            <ul>
                    <li>二级1</li>
                    <li>二级2</li>
                    <li>二级3</li>
                    </ul>
            </li>
            <li>浮动3</li>
            <li>浮动4</li>
            <li>浮动5</li>
        </ul>

</body>
<script>
    var t=$("input .ProdGrpDivCls_2001").attr("readonly");
    alert(t)

</script>
</html>
