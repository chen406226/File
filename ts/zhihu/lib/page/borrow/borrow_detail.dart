//
import 'package:flutter/material.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'package:zhihu/constant/constant.dart';



class BorrowDetailPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _BorrowDetailState();
  }
}


class _BorrowDetailState extends State<BorrowDetailPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;
  double Scheight = ScreenUtils.getInstance().screenHeight;
  double statusBarHeight = ScreenUtils.getInstance().statusBarHeight;
  double appBarHeight = ScreenUtils.getInstance().appBarHeight;
  var helplist = [];
  initState(){
    new Duration(seconds: 1000);
    print("didood");
    this.setState((){
      helplist = [{"name":"提交成功","time":"12:8:29","con":"提交成功"},{"name":"审核中?","time":"12:20:29","con":"正在处理"}];
    });
  }

  listview(){
    var lengths = helplist.length;
    return ListView.builder(
        itemCount: lengths,
        itemBuilder: (BuildContext context,int index){
          return Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(0,5,0,5),
//            height: 50,
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(helplist[index]["time"]),
                        Text("上午")
                      ],
                    ),
                    width: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset(
                      (index+1)==lengths? Constant.ASSETS_IMG + "icon_processing@2x.png":Constant.ASSETS_IMG + "icon_success@2x.png",
                      width: 16.0,
                      height: 16.0,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Row(
                              children: <Widget>[
                                Text(helplist[index]["con"],
                                    style: TextStyle(fontSize: 15.0,)
                                ),
                              ]
                          ),
                          Row(
                            children: <Widget>[
                              Text(helplist[index]["name"],
                                  style: TextStyle(fontSize: 13.0, color: Color(0xffaaaaaa))
                              ),
                            ],
                          )
                        ],
                      )
                  )
                ],
              ),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: new AppBar(
        title: new Text("借款详情",style: TextStyle(color: GlobalConfig.TabbarColor),),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: GlobalConfig.TabbarColor
        ),
      ),
      body: new SafeArea(
        child:Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              width: Scwidth-30,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.white
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
//                      width:3,
                      padding:EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.5,color: Color(0xFFeeeeee))),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text("到账卡：",style: TextStyle(fontSize: 14,color: Color(0xffaaaaaa)),),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Image.asset(Constant.ASSETS_IMG+"icon_mine_card@3x.png",width: 15,height: 15,),
                          ),
                          Text("中信银行0909"),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("2018.2.23",style: TextStyle(fontSize: 13,color: Color(0xffaaaaaa)),),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width:160,
//                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[Text("借款本金",style: TextStyle(fontSize: 13,color: Color(0xff3641b7)),)],
                                ),
                                Padding(padding: EdgeInsets.only(top: 5),),
                                Row(
                                  children: <Widget>[
                                    Text("3000",style: TextStyle(fontSize: 22,color: Color(0xff3641b7))),Text("元",style: TextStyle(fontSize: 13,color: Color(0xff3641b7)))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Row(children: <Widget>[Text("借款周期",style: TextStyle(fontSize: 13))],),
                                Padding(padding: EdgeInsets.only(top: 5),),
                                Row(
                                  children: <Widget>[
                                    Text("30",style: TextStyle(fontSize: 22)),Text("天")
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
//              width: Scwidth,
              color: Colors.white,
              height: Scheight-170-statusBarHeight-appBarHeight,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: listview(),
              ),
            ),
          ],
        ),

      ),
    );
  }
}