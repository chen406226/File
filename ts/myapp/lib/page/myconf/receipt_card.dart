//
import 'package:flutter/material.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import '../../my/login.dart';
class ReceiptCardPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _ReceiptCardState();
  }
}


class _ReceiptCardState extends State<ReceiptCardPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;

  var context;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    context =context;
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: new AppBar(
        title: new Text("收款银行卡",style: TextStyle(color: Colors.white),),
        backgroundColor: GlobalConfig.TabbarColor,
      ),
      body: new SafeArea(
          child: ListView(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.all(20),
                width: Scwidth-40,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
//                border: Border(bottom: BorderSide(width: 1,color: Color(0xFFFF7F7F7F))),
                    image: DecorationImage(
                        image: NetworkImage("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg"),
                        fit: BoxFit.fill
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Row(
//                    mainAxisAlignment: MainAxisAlignment.center ,
                        verticalDirection: VerticalDirection.down ,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding:EdgeInsets.only(right: 15),
                            child: CircleAvatar(
                                backgroundImage: NetworkImage("https://pic3.zhimg.com/fc4c1cb34c2901a1a8c05488bbd76fa2_xs.jpg")
                            ),
                          )
                          ,
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("中国工商银行")
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("存储卡",style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text("****  ****  ****  0112",style: TextStyle(fontSize: 18.0),),
                                    )
                                  ],
                                )

                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}