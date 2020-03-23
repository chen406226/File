//
import 'package:flutter/material.dart';
import 'package:myapp/page/myconf/bank.dart';
import 'package:myapp/page/myconf/bank_schema.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'package:myapp/constant/constant.dart';
import '../../util/separator.dart';
import 'dart:async';


class BindCardPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _BindCardState();
  }
}


class _BindCardState extends State<BindCardPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;

  String name="不知道是什银行";
  String img='';
  String checkcode;
  int time = 10;
  var show = true;


  _rightArrow() {
    return Icon(
      Icons.chevron_right,
      color: const Color.fromARGB(225, 204, 204, 204),
    );
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
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: new AppBar(
        title: new Text("认证中心",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: new SafeArea(
        child:ListView(
          children: <Widget>[
            Container(
              width:Scwidth,
              padding:EdgeInsets.fromLTRB(0, 15, 0, 15),
              child:Align(
                alignment: Alignment.center,
                child: Text("绑卡只限于实名认证下的银行卡绑定",style: TextStyle(color: Color(0xffaaaaaa),),),
              )
            ),
            Container(
              width: Scwidth,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    width: Scwidth-40,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.3,color: Color(0xffaaaaaa)))
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 90,
                          child: Text("姓名：",style: TextStyle(fontSize: 12,color: Color(0xff999999)),),
                        ),
                        Text("小小成")
                      ],
                    ),
                  ),
                  Container(
                    width: Scwidth-40,
                    height: 60,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 90,
                          child: Text("身份证：",style: TextStyle(fontSize: 12,color: Color(0xff999999)),),
                        ),
                        Text("3203243544523454")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Scwidth,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    width: Scwidth-40,
                    height: 60,
//                    decoration: BoxDecoration(
//                        border: Border(bottom: BorderSide(width: 0.5,color: Color(0xffaaaaaa)))
//                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 90,
                          child: Text("银行卡号：",style: TextStyle(fontSize: 12,color: Color(0xff999999)),),
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (n){},
                            decoration: InputDecoration(
                              labelText: "请输入您的银行卡号",
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        )

                      ],
                    ),
                  ),
                  Container(
                    width: Scwidth-40,
                    height: 60,
                    child: GestureDetector(
                      onTap: () async{
                        final result = await Navigator.push(context, MaterialPageRoute(builder: (context){return BankPage();}));
                        BankSchema bank = result as BankSchema;
                        this.setState((){name = bank.name;img = bank.img;});
                      },
                      child: Row(children: <Widget>[
                        img.length>0?
                        Container(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  Constant.ASSETS_IMG+img,
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              Text(name)
                            ],
                          ),
                        ):Text("请选择开户银行"),
                        Expanded(child: Align(
                          child: _rightArrow(),
                          alignment: Alignment.centerRight,
                        ))
                      ],),
                    )
                  ),
                ],
              ),
            ),
            Container(
              width: Scwidth,
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: Scwidth-40,
                    height: 60,
//                    decoration: BoxDecoration(
//                        border: Border(bottom: BorderSide(width: 0.3,color: Color(0xffaaaaaa)))
//                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 90,
                          child: Text("手机号：",style: TextStyle(fontSize: 12,color: Color(0xff999999)),),
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (n){},
                            decoration: InputDecoration(
                              labelText: "请输入您的手机号",
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: Scwidth-40,
                    height: 60,
                    child: Row(
                      children: <Widget>[
//                        Container(
//                          width: 90,
//                          child: Text("验证码：",style: TextStyle(fontSize: 12,color: Color(0xff999999)),),
//                        ),
                        Container(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "请输入验证码",
                            ),
                            onChanged: (v){
                              checkcode = v;

                            },
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.all(0),
                              padding: EdgeInsets.all(0),
                              child: ButtonTheme(
                                child: FlatButton(
                                  child: Text(show?"获取验证码":(time.toString()+"S"),style: TextStyle(fontSize: 12,color: Colors.blue),),
                                  color: Color(0xffffffff),
                                  disabledColor: Color(0xffffffff),
                                  onPressed: show?(){dotime();}:null,
                                ),
                              ) ,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ButtonTheme(
//                    buttonColor:Colors.green,
              minWidth: Scwidth-40,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: FlatButton(
                  child: Text("已确认无误，下一步",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  color: Color(0xff3641b7),
                  disabledColor: Color(0xffd9e2f5),
                  disabledTextColor: Color(0xff3641b7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){}));
                  }

//                    padding: ,
              ),
            ),
            Container(
              height: 30,
            )
          ],
        ),

      ),
    );
  }
}