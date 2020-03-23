//
import 'package:flutter/material.dart';
import 'package:zhihu/page/myconf/bindCard_first.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'package:zhihu/constant/constant.dart';
import '../../util/separator.dart';
import 'name_info.dart';
import '../../util/localsave.dart';
import 'dart:convert';

class ApproveInfoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _ApproveInfoState();
  }
}


class _ApproveInfoState extends State<ApproveInfoPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;
  _rightArrow() {
    return Icon(
      Icons.chevron_right,
      color: const Color.fromARGB(225, 204, 204, 204),
    );
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();

//    var m = json.encode({"name":"ck"});
//    var n = json.decode(m);
//    print(n["name"]);
    pue();
  }

  pue()async{
    var data =await LocalSave.getlogindata("logindata");
    var t = json.decode(data);
//    Map<String, dynamic> obj = json.decode(data);
    print(t);
//    print(obj["token"]);
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
        child:Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20,20,20,0),
              padding: EdgeInsets.all(10),
              width: Scwidth-40,
//              height: 190,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.white
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
//                            return HomePage();
                    return NameInfoPage();

                  }));},
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("授信送好礼",style: TextStyle(fontSize: 12,color: Color(0xff999999)),),
                        Expanded(child: Align(
                          alignment: Alignment.centerRight,
                          child: Text("已认证",style: TextStyle(fontSize: 14,color: Color(0xff990000)),),
                        )),
                        _rightArrow()
                      ],
                    ),
                    Container(
                      width: Scwidth-60,
                      height: 56,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(5.0),
                        color: Color(0xfff4f4f4)
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Image.asset(
                              Constant.ASSETS_IMG+'icon_name@3x.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text("完善个人信息",style: TextStyle(fontSize: 14),),
                          ),
                          Container(
                            child: Text("基础授信",style: TextStyle(height:1.1,fontSize: 10,color: Color(0xff999999)),),
                            height: 13,
                            decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(2.0),
                              border:Border.all(width: 0.5,color: Color(0xffaaaaaa))
                            ),
                          )

                        ],
                      ),
                    )
                  ],
                )
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20,20,20,0),
              padding: EdgeInsets.all(10),
              width: Scwidth-40,
//              height: 190,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.white
              ),
              child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
//                            return HomePage();
                      return ApproveInfoPage();

                    }));},
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("授信送好礼",style: TextStyle(fontSize: 12,color: Color(0xff999999)),),
                          Expanded(child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("已认证",style: TextStyle(fontSize: 14,color: Color(0xff00ff00)),),
                          )),
                          _rightArrow()
                        ],
                      ),
                      Container(
                        width: Scwidth-60,
                        height: 56,
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(5.0),
                            color: Color(0xfff4f4f4)
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Image.asset(
                                Constant.ASSETS_IMG+'icon_contact_select@3x.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text("联系人",style: TextStyle(fontSize: 14),),
                            ),
                            Container(
                              child: Text("基础授信",style: TextStyle(height:1.1,fontSize: 10,color: Color(0xff999999)),),
                              height: 13,
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(2.0),
                                  border:Border.all(width: 0.5,color: Color(0xffaaaaaa))
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20,20,20,0),
              padding: EdgeInsets.all(10),
              width: Scwidth-40,
//              height: 190,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.white
              ),
              child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
//                            return HomePage();
                      return ApproveInfoPage();

                    }));},
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("授信送好礼",style: TextStyle(fontSize: 12,color: Color(0xff999999)),),
                          Expanded(child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("已认证",style: TextStyle(fontSize: 14,color: Color(0xff0000ff)),),
                          )),
                          _rightArrow()
                        ],
                      ),
                      Container(
                        width: Scwidth-60,
                        height: 56,
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(5.0),
                            color: Color(0xfff4f4f4)
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Image.asset(
                                Constant.ASSETS_IMG+'icon_operator_select@3x.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text("运营商认证",style: TextStyle(fontSize: 14),),
                            ),
                            Container(
                              child: Text("基础授信",style: TextStyle(height:1.1,fontSize: 10,color: Color(0xff999999)),),
                              height: 13,
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(2.0),
                                  border:Border.all(width: 0.5,color: Color(0xffaaaaaa))
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20,20,20,0),
              padding: EdgeInsets.all(10),
              width: Scwidth-40,
//              height: 190,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.white
              ),
              child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
//                            return HomePage();
                      return BindCardPage();

                    }));},
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("授信送好礼",style: TextStyle(fontSize: 12,color: Color(0xff999999)),),
                          Expanded(child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("已绑定",style: TextStyle(fontSize: 14,color: Color(0xff990000)),),
                          )),
                          _rightArrow()
                        ],
                      ),
                      Container(
                        width: Scwidth-60,
                        height: 56,
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(5.0),
                            color: Color(0xfff4f4f4)
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Image.asset(
                                Constant.ASSETS_IMG+'icon_card_select@3x.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text("银行卡认证",style: TextStyle(fontSize: 14),),
                            ),
                            Container(
                              child: Text("基础授信",style: TextStyle(height: 1.1,fontSize: 10,color: Color(0xff999999)),),
                              height: 13,
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(2.0),
                                  border:Border.all(width: 0.5,color: Color(0xffaaaaaa))
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
          ],
        ),

      ),
    );
  }
}