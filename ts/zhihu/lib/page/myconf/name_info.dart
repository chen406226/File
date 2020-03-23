//
import 'package:flutter/material.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'package:zhihu/constant/constant.dart';
import '../../util/separator.dart';

class NameInfoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _NameInfoState();
  }
}


class _NameInfoState extends State<NameInfoPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;
  _rightArrow() {
    return Icon(
      Icons.chevron_right,
      color: const Color.fromARGB(225, 204, 204, 204),
    );
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
              padding:EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Text("请确认您的信息，姓名可点击修改",style: TextStyle(color: Color(0xffaaaaaa),),),
            ),
            Container(
              width: Scwidth,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.3,color: Color(0xffaaaaaa)))
                    ),
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
                  Container(
                    width: Scwidth-40,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.5,color: Color(0xffeeeeee)))
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 90,
                          child: Text("有效期：",style: TextStyle(fontSize: 12,color: Color(0xff999999)),),
                        ),
                        Text("2018.2.12-2020.10.1")
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}