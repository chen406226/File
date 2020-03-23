//
import 'package:flutter/material.dart';
import 'package:zhihu/page/borrow/repay_doing.dart';
import 'package:zhihu/page/borrow/repay_fail.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'package:zhihu/constant/constant.dart';
import '../../util/separator.dart';
import 'repay_suc.dart';
import 'repay_delay.dart';



class RepayPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _RepayState();
  }
}


class _RepayState extends State<RepayPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;




  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: new AppBar(
        title: new Text("还款",style: TextStyle(color: Colors.black),),
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
                          child:Text("本次賬單包含本金3000元，滯納金22元",style: TextStyle(fontSize: 14,color: Color(0xffdddddd)),),
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
                child: Text("確認還款",style: TextStyle(color: Colors.white),),
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
            Padding(padding: EdgeInsets.only(top: 20),),
            ButtonTheme(
//              buttonColor:Color(0xffedf3ff),
              minWidth: Scwidth-40,
              height: 48 ,
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: FlatButton(
                child:Container(
                  child: Column(
                    children: <Widget>[
                      Text("展期還款",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("延長還款時間，還款青松無壓力",style: TextStyle(fontSize: 11,color: Color(0xffaaaaaa)),),

                    ],
                  ),
                ),
                color: Color(0xffedf3ff),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return RepayDelayPage();
                  })
                  );
                },
              ),
            ),
          ],
        ),

      ),
    );
  }
}