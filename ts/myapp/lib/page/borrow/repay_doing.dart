//
import 'package:flutter/material.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'package:myapp/constant/constant.dart';

class RepayDoingPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _RepayDoingState();
  }
}


class _RepayDoingState extends State<RepayDoingPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;




  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: new AppBar(
        title: new Text("还款結果",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: Builder(builder: (context){return Container();},),
        actions: <Widget>[
          FlatButton(child: Text("完成",style: TextStyle(color: Colors.blue),),onPressed: (){Navigator.pop(context);},)
        ],
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
              height: 210,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.white
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Container(
//                    padding:EdgeInsets.only(right: 15),
                      width: 64,
                      height: 64,
                      child: CircleAvatar(
                        backgroundImage: new AssetImage(Constant.ASSETS_IMG + "icon_processing@3x.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        child:Text("還款處理中",style: TextStyle(fontSize: 20),),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                        child:Text("已提交申請，等待還款處理",textAlign:TextAlign.center,style: TextStyle(color: Color(0xffaaaaaa),)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}