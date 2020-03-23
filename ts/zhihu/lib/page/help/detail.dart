import 'package:flutter/material.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'schema.dart';


class DetailPage extends StatelessWidget{

  double Scwidth = ScreenUtils.getInstance().screenWidth;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Detail _detail = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: new AppBar(
        title: new Text("帮助中心",style: TextStyle(color: Colors.white),),
        backgroundColor: GlobalConfig.TabbarColor,
      ),
      body: new SafeArea(
          child: new Container(
            margin: EdgeInsets.all(20),
            width: Scwidth-40,
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(2.0),
                border:Border.all(width: 1,color: Color(0xffaaaaaa))
            ),
            child:Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: Scwidth-40,
                    decoration: BoxDecoration(
                      border:new BorderDirectional(bottom: new BorderSide(color:Color(0xffaaaaaa),width: 1)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(_detail.name,style: TextStyle(fontSize: 25),),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(_detail.con),
                    ) ,
                  ),
                ],
              ),
            )
          )
      ),
    );
  }
}

