//
import 'package:flutter/material.dart';
import 'package:myapp/page/borrow/repay_doing.dart';
import 'package:myapp/page/borrow/repay_fail.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'package:myapp/constant/constant.dart';
import '../../util/separator.dart';
import 'repay_suc.dart';




class RepayDelayPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _RepayDelayState();
  }
}


class _RepayDelayState extends State<RepayDelayPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;




  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: new AppBar(
        title: new Text("申请展期",style: TextStyle(color: Colors.black),),
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
              margin: EdgeInsets.all(20),
              width: Scwidth-40,
              height: 165,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Color(0xff3843b7)
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[Text("借款金额（元）",style: TextStyle(color: Colors.white),)],),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0,10,0,10),
                          child:Text("3000",style: TextStyle(fontSize: 40,color: Colors.white),),
                        ),
                      ],
                    ),
                    MySeparator(),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0,15,0,0),
                          child:Text("展期还款手续费300元，滯納金22元",style: TextStyle(fontSize: 14,color: Color(0xffdddddd)),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            ButtonTheme(
//                    buttonColor:Colors.green,
              minWidth: Scwidth-40,
              height: 48 ,
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: FlatButton(
                child: Text("确认展期",style: TextStyle(color: Colors.white),),
                color: Color(0xff3641b7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
//                    return RepaySucPage();
//                    return RepayDoingPage();
                    return RepayFailPage();
                  }));
                },
              ),
            ),
          ],
        ),

      ),
    );
  }
}