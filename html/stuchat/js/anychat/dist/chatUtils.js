

(function (window) {
    if (!window.anychat) window.anychat = {};
    var NotificationExt = function () {
        /**
         * 登录成功
         * @type {string}
         */
        this.LOGIN_CHAT_SERVER_SUCCESS = "loginChatServerSuccess";
        /**
         * 接到自己发给别人的信息
         * @type {string}
         */
        this.CHAT_TO_USER_MESSAGE = "chatToUserMessage";
    };
    window.anychat.notificationExt = new NotificationExt();
})(window);

//监听消息，并发送到服务端
(function (window) {
    if (!window.anychat) window.anychat = {};
    var notificationExt = window.anychat.notificationExt;
    var webSocketEventType = window.juggle.webSocketEventType;
    var Proxy = window.juggle.Proxy;
    var LoginChatProxy = function () {
        Proxy.apply(this);
        this.url = null;
        this.webSocketClient = null;
        /**
         * 初始化，监听消息
         * @param webSocketClient
         */
        this.init = function (webSocketClient) {
            this.webSocketClient = webSocketClient;
            this.webSocketClient.addEventListener(webSocketEventType.getMessage("2"), this.onLoginChatServer, this);
            this.webSocketClient.addEventListener(webSocketEventType.getMessage("14"), this.onToUserMessage, this);
        };
        /**
         * 登录成功
         * @param event
         */
        this.onLoginChatServer = function (event) {
            this.notifyObservers(this.getNotification(notificationExt.LOGIN_CHAT_SERVER_SUCCESS, event.mData));
        };
        /**
         * 登录聊天服务器
         * @param token
         */
        this.loginChat = function (token) {
            var data = {
                "wsOpCode": 1,
                "token": token
            };
            this.webSocketClient.send(data);
        };
        /**
         * 发给好友的消息，推送给自己
         * @param event
         */
        this.onToUserMessage = function (event) {
            this.notifyObservers(this.getNotification(notificationExt.CHAT_TO_USER_MESSAGE, event.mData));
        };
        /**
         * 推送消息
         * @param chatContent
         * @param toType
         * @param toTypeId
         */
        this.sendMessage = function (chatContent, toType, toTypeId) {
            var data = {
                "wsOpCode": 5,
                "chatContent": chatContent,
                "toType": toType,
                "toTypeId": toTypeId
            };
            this.webSocketClient.send(data);
        };
    };
    window.anychat.loginChatProxy = new LoginChatProxy();
})(window);

(function (window) {
    if (!window.anychat) window.anychat = {};
    var chatObjEventType = window.anychat.chatObjEventType;
    var EventDispatcher = window.juggle.EventDispatcher;

    //获取路径 | | |
    var pathName=window.document.location.pathname;
    //截取，得到项目名称
    var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);

    var UserObj = function () {
        this.user = null;
        this.view = null;
        this.chatList = [];
        this.shadow = null;
        EventDispatcher.apply(this);
        //初始化
        this.init = function (user) {
            this.user = user;
        };
        //添加监听
        this.addOptListener = function () {
            this.addClickListener(this, this.onClick);
        };
        this.addClickListener = function (userObj, call) {
            var callFunc = function (event) {
                call.call(userObj, event);
            };
            this.view.on("click", callFunc);
        };
    };
    window.anychat.UserObj = UserObj;
})(window);


//监听服务端发来的消息并做响应的处理
(function (window) {
    if (!window.anychat) window.anychat = {};
    var chatObjEventType = window.anychat.chatObjEventType;
    var getUrlParam = window.anychat.getUrlParam;
    var notificationExt = window.anychat.notificationExt;
    var loginChatProxy = window.anychat.loginChatProxy;
    var GroupObj = window.anychat.GroupObj;
    var UserObj = window.anychat.UserObj;
    var Mediator = window.juggle.Mediator;
    var WebSocketClient = window.juggle.WebSocketClient;
    var webSocketEventType = window.juggle.webSocketEventType;

    //获取路径 | | |
    var pathName=window.document.location.pathname;
    //截取，得到项目名称
    var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);

    var TalkMediator = function () {
        //webscoket对象
        this.webSocketClient = null;
        //当前模块 1代表聊天 2代表聊天记录
        this.nowModule = 1;
        this.token = null;
        this.initView = function (tokenID) {
            //获取url传递过来的token
            this.token = tokenID;
            if (this.token === null || this.token === undefined) {
                //token是空应该提示无法登陆
                return;
            }
            //链接聊天服务器
            this.loginChatServer();
        };
        //链接聊天服务器
        this.loginChatServer = function () {
            this.logoutChatServer();

            this.webSocketClient = new WebSocketClient(loginChatProxy.url);
            this.webSocketClient.addEventListener(webSocketEventType.CONNECTED, this.onConnected, this);
            this.webSocketClient.addEventListener(webSocketEventType.CLOSE, this.onClose, this);
            loginChatProxy.init(this.webSocketClient);
        };
        this.onClose = function (event) {
            alert("与服务器断开链接");
        };
        //断开聊天服务器
        this.logoutChatServer = function () {
            if (this.webSocketClient !== null && this.webSocketClient !== undefined) {
                this.webSocketClient.close();
                this.webSocketClient.removeEventListeners();
                this.webSocketClient = null;
            }
        };
        //链接成功后发送登陆请求
        this.onConnected = function (event) {
            loginChatProxy.loginChat(this.token);
        };
        // 关心消息数组
        this.listNotificationInterests = [
            notificationExt.LOGIN_CHAT_SERVER_SUCCESS,
            notificationExt.CHAT_TO_USER_MESSAGE];
        // 关心的消息处理
        this.handleNotification = function (data) {
            switch (data.name) {
                case notificationExt.LOGIN_CHAT_SERVER_SUCCESS:
                    this.LoginChatServerSuccess(data.body);
                    break;
                case notificationExt.CHAT_TO_USER_MESSAGE:
                    this.onToUserMessage(data.body);
                    break;
            }
        };
        //登陆成功
        this.LoginChatServerSuccess = function (body) {
            console.log("登录成功");
        };

        this.onLogChatProxy=function () {
            return loginChatProxy;
        }

        this.onToUserMessage = function (body) {
            //接收自己发出的消息，用来检测是否发送消息成功并被接收到,接收到消息，所以发送成功
            //alert(body.message.chatContent);
            console.log("发送消息成功");

        };

        /** 如果发送的消息包含图片需要进行转换，如<span>12312<img src="arclist/5.gif"><img src="arclist/26.gif"></span>
         * 正则表达式：<img src="arclist/([0-9]*).gif">
         *     替换表达式：[em_$1]
         *     替换结果：<span>12312[em_5][em_26]</span>
         */
        this.replace_htmlToEm=function(str){
            str = str.replace(/<img src=\"arclist\/([0-9]*).gif\">/g, '[em_$1]');
            return str;

        }
        /** 如果发送的消息包含图片需要进行转换，如<span>12312[em_5][em_26]</span>
         * 正则表达式：\[em_([0-9]*)\]
         *     替换表达式：<img src="arclist/$1.gif">
         *     替换结果：<span>12312<img src="arclist/5.gif"><img src="arclist/26.gif"></span>
         */
        this.replace_emToHtml=function(str) {
            str = str.replace(/\[em_([0-9]*)\]/g, '<img src="arclist/$1.gif">');
            return str;

        }
        Mediator.apply(this);
    };
    window.anychat.TalkMediator = TalkMediator;
})(window);


(function (window) {

    var EventDispatcher = window.juggle.EventDispatcher;
    var AdminObj = function () {
        this.user = null;
        this.view = null;
        this.chatList = [];
        this.shadow = null;
        this.wsUrl=null;
        this.talkMediator=null;
        EventDispatcher.apply(this);
        //初始化
        this.init = function (user) {
            this.user = user;
        };
        //添加监听
        this.addOptListener = function () {
            this.addClickListener(this, this.onClick);
        };
        this.addClickListener = function (userObj, call) {
            var callFunc = function (event) {
                call.call(userObj, event);
            };
            this.view.on("click", callFunc);
        };
        //oriAdminUrl,ws_url
        this.initAdminToken=function () {
            //wsUrl=ws_url;
            var adminToken = null;
            var curWwwPath=window.document.location.href;
            var port=window.location.port;
            var portIndex=curWwwPath.indexOf(port);
            var ip=curWwwPath.substring(7,portIndex-1);
            //var identityUrl = "http://"+ip+":8082/StartpointServer/s";
            //var oriIdentityUrl = "http://"+ip+":8080/gd_stu_dev/login/getAdminToken.action";
            //var oriIdentityUrl = oriAdminUrl;
            var oriIdentityUrl = "http://localhost:8080/ori/login/getAdminToken.action";

            //请求admintoken，为了后面获取组列表
            var data = {
                'hOpCode': '20',
                'userName': '123456',
                'userPassword': '000000'
            };
            var header = [];
            header["hOpCode"] = "20";
            var httpClient = new juggle.HttpClient();
            this.talkMediator = new anychat.TalkMediator();
            httpClient.send(data, oriIdentityUrl, header);
            httpClient.addEventListener(juggle.httpEventType.SUCCESS, adminSuccess, this);
            httpClient.addEventListener(juggle.httpEventType.ERROR, adminError, this);

            function adminSuccess(event) {
                var returnData = JSON.parse(event.mData);
                adminToken = returnData.tokenId;
                this.initWs(adminToken);
                console.log("登录成功 adminToken"+adminToken);

            }

            function adminError(event) {
                alert("获取admintoken失败");
            }
        };

        this.initWs=function(adminToken) {
            var curWwwPath = window.document.location.href;
            var port = window.location.port;
            var portIndex = curWwwPath.indexOf(port);
            var ip = curWwwPath.substring(7, portIndex - 1);
            //anychat.loginChatProxy.url = "ws://" + ip + ":8080/AnyChatServer/ws";
            anychat.loginChatProxy.url = "ws://localhost:8082/chat_server/ws";
            //anychat.loginChatProxy.url = wsUrl;
            //console.log("ws接口地址："+wsUrl);

            //alert(anychat.loginChatProxy.url);
            this.talkMediator.initView(adminToken);
        };

        this.getTalkMediator=function(){
            return this.talkMediator;
        }
    };
    window.anychat.AdminObj = AdminObj;
})(window);