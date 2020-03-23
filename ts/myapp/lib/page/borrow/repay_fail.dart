//
import 'package:flutter/material.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'package:myapp/constant/constant.dart';
import '../../util/separator.dart';

class RepayFailPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _RepayFailState();
  }
}


class _RepayFailState extends State<RepayFailPage>{
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
              height: 190,
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
                        backgroundImage: new AssetImage(Constant.ASSETS_IMG + "icon_failure@3x.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        child:Text("還款失敗",style: TextStyle(fontSize: 20),),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                        child:Text("處理失敗，請重新選擇",textAlign:TextAlign.center,style: TextStyle(color: Color(0xffaaaaaa),)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ButtonTheme(
//                    buttonColor:Colors.green,
              minWidth: Scwidth-40,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: FlatButton(
                child: Text("繼續還款",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
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
          ],
        ),

      ),
    );
  }
}