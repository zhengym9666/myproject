<%@ page language="java"  pageEncoding="gb2312"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>嵌入聊天</title>
    <!--juggle库 all in one-->
    <!--
    <script src="../../stuchat/js/lib/juggle-all.js" type="text/javascript"></script>
    -->
    <!--juggle库 small require-->
    <script src="<%=request.getContextPath()%>/stuchat/js/lib/juggle-help.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/stuchat/js/lib/juggle-event.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/stuchat/js/lib/juggle-mv.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/stuchat/js/lib/juggle-websocket.js" type="text/javascript"></script>

    <script src="<%=request.getContextPath()%>/stuchat/js/lib/jquery.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/stuchat/js/lib/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>

    <link href='<%=request.getContextPath()%>/stuchat/js/anychat/css/anychat.css' rel='stylesheet' type='text/css'/>
    <link href='<%=request.getContextPath()%>/stuchat/js/lib/jquery.mCustomScrollbar.min.css' rel='stylesheet' type='text/css'/>

    <!--源码文件-->
    <!--
        <script src="../../stuchat/js/anychat/src/ChatObjEventType.js" type="text/javascript"></script>
        <script src="../../stuchat/js/anychat/src/GetUrlParam.js" type="text/javascript"></script>
        <script src="../../stuchat/js/anychat/src/NotificationExt.js" type="text/javascript"></script>
        <script src="../../stuchat/js/anychat/src/LoginChatProxy.js" type="text/javascript"></script>
        <script src="../../stuchat/js/anychat/src/UserObj.js" type="text/javascript"></script>
        <script src="../../stuchat/js/anychat/src/GroupObj.js" type="text/javascript"></script>
        <script src="../../stuchat/js/anychat/src/TalkMediator.js" type="text/javascript"></script>
    -->
    <!--合成文件-->
    <script src="<%=request.getContextPath()%>/stuchat/js/anychat/dist/anychat.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/test/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/test/css/chatface.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/test/js/jquery.qqFace.js"  charset="UTF-8"></script>
    <%@ page contentType="text/html;charset=UTF-8" import="java.util.ResourceBundle" %>
    <%
        ResourceBundle resource = ResourceBundle.getBundle("/admin/chat");
    %>
</head>
<script type="text/javascript">
    window.onload = function () {

        var curWwwPath=window.document.location.href;
        var pathName=window.document.location.pathname;
        var pos=curWwwPath.indexOf(pathName);
        var port=window.location.port;
        var portIndex=curWwwPath.indexOf(port);
        var ip=curWwwPath.substring(7,portIndex-1);
        //anychat.loginChatProxy.url = "ws://"+ip+":8082/chat_server/ws";
        //获取ws的访问地址
        var ws_url= "<%=resource.getString("ws_url")%>";
        console.log("ws的访问地址："+ws_url);
        anychat.loginChatProxy.url = ws_url;
        var talkMediator = new anychat.TalkMediator();
        //alert(anychat.loginChatProxy.url);
        talkMediator.initView();
    }
</script>
<body style="background:url(images/chatbg.png) no-repeat;background-position-y:12px;">
<div class="top" style="width:100%;"></div>
<div class="window_P" style="">
    <dl class="windowL_P fl">
        <dt>
            <span>通讯录</span>
        </dt>
        <dd>
            <ul id="talkList">

                <li class="group">
                    <p>我的好友<span class="cur_P" id="currentOnline">0</span>/ <span class="all_P" id="allUser">0</span>
                    </p>
                    <ul id="talkUserList">

                    </ul>
                </li>
            </ul>
        </dd>
    </dl>
    <dl class="windowR_P fl ">
        <dt>
            <span class="title_P" id="toTypeName">无</span>
            <i class="closeBtn_P" id="talk_close"></i>
            <a class="sprite icon6"></a>
            <a class="sprite icon7"></a>
            <a class="sprite icon8"></a>
        </dt>
        <dd class="talkCon_P" id="chatList">

        </dd>
        <dd class="funList_PJY">
            <div class="pr">
                <a href="javascript:;"></a>
                <a href="javascript:;" class="history_P"></a>
                <span class="emotion" ><img alt="表情" width="30px" style="margin-top:-10px;" src="././arclist/1.gif"></span>
                <a class="sprite icon1"></a>
                <a class="sprite icon2"></a>
                <a class="sprite icon3"></a>
                <a class="sprite icon4"></a>
                <a class="sprite icon5"></a>
            </div>
        </dd>
        <dd class="textWin_P">
            <div>
                <div  contenteditable="true" class="mytext_P" id="sendChatContent" style="width:  100%;height: 61px;line-height: 33px;font-size: 16px;"></div>
            </div>
        </dd>
        <dd class="btnList_P">
            <a href="javascript:void(0);" class="send_P" id="sendChat">发送</a>
        </dd>

    </dl>
    <dl class="windowR_P left2_P fl">
        <dt>
            <span class="title2_P"> <i class="return_P" id="returnChat"></i>消息记录（<span id="toTypeName2"></span>）</span>
            <i class="closeBtn_P"></i>

        </dt>
        <dd class="hisList_P">
            <div id="histortChat">

            </div>
        </dd>
        <dd class="hisFoot_P">
            <div class="pageList_P">
                <a href="javascript:;" class="first_P" id="firstPage"></a>
                <a href="javascript:;" class="prev_P" id="prePage"></a>
                <a href="javascript:;" class="next_P" id="nextPage"></a>
                <a href="javascript:;" class="last_P" id="lastPage"></a>
            </div>
            <div class="timeBox_P">
                <a href="javascript:;" id="historyTime"></a>
                <input type="text" class="hide" id="d1"/>
            </div>
            <div class="clear"></div>
        </dd>

    </dl>
    <div class="clear"></div>
</div>
</body>
<script>

        $(function () {
            $('.emotion').qqFace({

                id: 'facebox',

                assign: 'sendChatContent',

                path: 'arclist/'	//表情存放的路径

            });

            $(".sub_btn").click(function () {

                var str = $("#sendChat").html();

                $("#show").html(replace_em(str));

            });

        });

    //查看结果

    function replace_em(str) {

        /*str = str.replace(/\</g, '&lt;');

        str = str.replace(/\>/g, '&gt;');

        str = str.replace(/\n/g, '<br/>');

        str = str.replace(/\[em_([0-9]*)\]/g, '<img src="arclist/$1.gif" border="0" />');*/

        return str;

    }
        /** 如果发送的消息包含图片需要进行转换，如<span>12312[em_5][em_26]</span>
         * 正则表达式：\[em_([0-9]*)\]
         *     替换表达式：<img src="arclist/$1.gif">
         *     替换结果：<span>12312<img src="arclist/5.gif"><img src="arclist/26.gif"></span>
         */
        function replace_emToHtml(str) {
            str = str.replace(/\[em_([0-9]*)\]/g, '<img src="arclist/$1.gif">');
            return str;

        }

</script>
</html>