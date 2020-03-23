import 'package:flutter/material.dart';
import 'package:myapp/index/index.dart';
import '../global_config.dart';
import '../util/screen_utils.dart';
import 'check_code.dart';
import 'schema.dart';
import '../api/Stringuntil.dart';
import 'dologin.dart';
import '../util/localsave.dart';
import 'package:device_info/device_info.dart';
import 'dart:convert';
//import 'package:amap_location/amap_location.dart';


 class LoginPage extends StatefulWidget {

   @override
   _loginPage createState(){return new _loginPage();}
 }

class _loginPage extends State<LoginPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;

  var iphonenum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    Navigator.pushNamed(context, '/');
//    Map m = new Map();
//    m["loginName"]=18677716111;
//    m["loginPwd"] = StringUt.generateMd5toUpper("a1111111");
//    m["versionNumber"] = "3.0-debug";
//    var x = StringUt.getsignMsg(m);
//    print(x);
//    print(StringUt.generateMd5(x));
    ste();

  }


  ste()async{
    var m = await LocalSave.getlogindata("logindata");
    print(m);

//    await LocalSave.savedevice();
//    var tt = await LocalSave.getdevice();
//    print(tt);
//    print(json.decode(m)["token"]);
  }


   @override
  Widget build(BuildContext context) {
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
                    icon: Icon(Icons.close,),
                    padding: EdgeInsets.all(0.0),
                    alignment: Alignment.centerLeft,
                    onPressed: (){
//                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                        return Index();
                      }));
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                    child: Text('登录/注册',style: TextStyle(fontSize: 24),),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
//                    decoration: BoxDecoration(
//                      border:new BorderDirectional(bottom: new BorderSide(color:Color(0xffaaaaaa),width: 1)),
//                    ),
                  width: Scwidth-60*Scwidth/375,
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "请输入手机号",
                      ),
                      onChanged: (e){
                        iphonenum = e;
                        this.setState((){});
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                    child:Text("未注册的手机号验证后自动创建账号",style: TextStyle(color: Color(0xffaaaaaa)),)
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  ButtonTheme(
//                    buttonColor:Colors.green,
                    minWidth: Scwidth-60*Scwidth/375,

                    child: FlatButton(
                      child: Text("下一步",style: TextStyle(color: Colors.white),),
                      color: Color(0xff3641b7),
                      disabledColor: Color(0xffd9e2f5),
                      disabledTextColor: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      onPressed: iphonenum.toString().length<11 ? null:() async{
                        await Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) {
//                              return new CodePage();
                              return new doLoginPage();
                            },
                            settings:RouteSettings(
                                arguments:Info(iphonenum)
                            )
                        ));
                        Navigator.pop(context);
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




