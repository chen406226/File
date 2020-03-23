import 'package:flutter/material.dart';
import '../global_config.dart';
import '../util/screen_utils.dart';
import 'schema.dart';
import 'dart:async';

class CodePage extends StatefulWidget {

  @override
  _codePage createState() => new _codePage();
}

class _codePage extends State<CodePage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;
  var codenum;
  var time = 10;
  var show = false;

  void initState(){
    dotime();
  }

  dotime(){
    print(time);
    show = false;
    var self = this;
    self.setState((){});
    Timer _time = new Timer.periodic(new Duration(seconds: 1),(Timer timer){
      time -= 1;
      if(time==0){
        timer.cancel();
        timer=null;
        time = 10;
        show = true;
      }
      self.setState((){});

      print(time);
    });
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
          child: Column(
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
                    child: Text('输入验证码',style: TextStyle(fontSize: 24),),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 40),
                      child:Text("验证码已发送至"+arg.phone,style: TextStyle(color: Color(0xffaaaaaa)),)
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
                            labelText: "请输入验证码",
                          ),
                          onChanged: (e){
                            codenum = e;
                            this.setState((){});
                          },
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 0,
                        child: Container(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          child: ButtonTheme(
                            height: 18,
                            minWidth: 70,
                            padding: EdgeInsets.all(0.0),
                            child: FlatButton(
//                            padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(show?"重新获取":(time.toString()+"S"),style: TextStyle(fontSize: 12,color: show?Colors.white:Color(0xff3641b7)),),
                              color: Color(0xff3641b7),
                              disabledColor: Color(0xffd9e2f5),
                              disabledTextColor: Color(0xff3641b7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6))
                              ),
//                            elevation: 5.0,
//                            highlightElevation: 8.0,
                              onPressed: show?(){dotime();}:null,
                            ),
                          ) ,
                        ),
                      )
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
                      onPressed: codenum.toString().length<4 ? null:(){

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




