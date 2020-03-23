import 'package:flutter/material.dart';
import '../global_config.dart';
import '../util/screen_utils.dart';
import 'schema.dart';
import 'dart:async';
import 'dart:convert';
import '../api/Stringuntil.dart';
import '../api/request.dart';
import 'package:myapp/router.dart';
import '../util/localsave.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';



class doLoginPage extends StatefulWidget {

  @override
  _codePage createState() => new _codePage();
}

class _codePage extends State<doLoginPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;
  var loginPwd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  Future loginRequest(name)async {
//    final m =
    Map m = new Map();
//    m["loginName"]=18677716111;
    m["loginName"]=name;
    m["loginPwd"] = StringUt.generateMd5toUpper(loginPwd);
//    m["versionNumber"] = "3.0-debug";
    var obj = await Request.get("http://10.1.1.61:3005/api/user/login.htm",params: m);
//    Map<String, dynamic> obj = json.decode(data);
//    print(data);
    if(obj["code"]==200){
      Map datas = obj["data"];
      Request.token = datas["token"];
      Request.userId = datas["userId"];

      print(Request.token);
      print(datas["token"]);
      await LocalSave.savelogindata("logindata", json.encode(obj["data"]));
      Toast.show(obj["msg"], context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      Navigator.pop(context);
    }else{
//      Fluttertoast.showToast(
//          msg: "This is Center Short Toast",
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
//          backgroundColor: Colors.red,
//          textColor: Colors.white,
//          fontSize: 16.0
//      );
      Toast.show(obj["msg"], context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    }

//    print(data);
//    showLoadingDialog(obj["msg"]);

//    Router.push(context, Router.CardPages,'');

  }

  showLoadingDialog(msg) {

    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        return AlertDialog(
          content: ListView(
            children: <Widget>[
//              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text(msg),
              )
            ],
          ),
        );
      },
    );
    new Duration(seconds: 1200);
//    Navigator.pushNamed(context, '/');

  }

  @override
  Widget build(BuildContext context) {
    Info arg = ModalRoute.of(context).settings.arguments;
    print(arg.phone);
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff6f6f6),
        body: Padding(
          padding: EdgeInsets.all(30*Scwidth/375),
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.chevron_left,),
                    padding: EdgeInsets.all(0.0),
                    alignment: Alignment.centerLeft,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                    child: Text('输入密码',style: TextStyle(fontSize: 24),),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 40),
                      child:Text("用户名"+arg.phone,style: TextStyle(color: Color(0xffaaaaaa)),)
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Stack(
//                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      Container(
//                    decoration: BoxDecoration(
//                      border:new BorderDirectional(bottom: new BorderSide(color:Color(0xffaaaaaa),width: 1)),
//                    ),
                        width: Scwidth-60*Scwidth/375,
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: "请输入密码",
                          ),
                          onChanged: (e){
                            loginPwd = e;
                            this.setState((){});
                          },
                        ),
                      ),
                    ],
                  )

                ],
              ),

              Row(
                children: <Widget>[
                  ButtonTheme(
//                    buttonColor:Colors.green,
                    minWidth: Scwidth-60*Scwidth/375,

                    child: FlatButton(
                      child: Text("登录",style: TextStyle(color: Colors.white),),
                      color: Color(0xff3641b7),
                      disabledColor: Color(0xffd9e2f5),
                      disabledTextColor: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      onPressed: (){
                        loginRequest(arg.phone);
                      },

//                    padding: ,
                    ),
                  )

                ],
              ),
              Row(
                children: <Widget>[
                  Text('登录即代表同意'),
                  RawMaterialButton(
                    child: Text('《来花呗使用协议》',style: TextStyle(color: Colors.blue),),
                    onPressed: (){},
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}




