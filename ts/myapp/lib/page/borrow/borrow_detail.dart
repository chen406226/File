//
import 'package:flutter/material.dart';
import 'package:myapp/util/initData.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'package:myapp/constant/constant.dart';
import '../../api/request.dart';
import '../../api/Api.dart';



class BorrowDetailPage extends StatefulWidget {
  final int id;
  BorrowDetailPage(this.id,{Key key})
      : super(key: key);
  @override
  State<StatefulWidget> createState(){
    return _BorrowDetailState(id);
  }
}


class _BorrowDetailState extends State<BorrowDetailPage>{
  final int id;
  _BorrowDetailState(this.id);


  double Scwidth = ScreenUtils.getInstance().screenWidth;
  double Scheight = ScreenUtils.getInstance().screenHeight;
  double statusBarHeight = ScreenUtils.getInstance().statusBarHeight;
  double appBarHeight = ScreenUtils.getInstance().appBarHeight;
//  var helplist = [];

  dynamic borrowDatalist=[];
  dynamic isBorrow;
  dynamic helplist =[];
  dynamic repaylist;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    this.setState((){
//      helplist = [{"name":"提交成功","time":"12:8:29","con":"提交成功"},{"name":"审核中?","time":"12:20:29","con":"正在处理"}];
//    });
    Future.delayed(new Duration(milliseconds: 20),(){
      requestdetail();
    });
  }

//  dealbankstr(m,n){
//    String behind = n.substring(4);
//
//
//  }

  requestdetail()async{
    var data;
    var self = this;
    Map params =new Map();
    params["borrowId"] = id;
//    var params = {"pages":1,"pageSize":10,"total":1,"current":1};
    try{
      data = await Request.post(Api.host+Api.borrowdetail,params: params);
      if(data["code"]==200){
        if(data["data"]["borrow"].length>0){
          self.setState((){
            print("this.setstate");
          borrowDatalist = data["data"]["borrow"];
          isBorrow = data["data"]["isBorrow"];
          helplist = data["data"]["list"];
//          repaylist = data["data"]["repay"][0];
          });

        }
//        this.setState((){datalist = data["data"]["list"];});
      }
    }catch(e){

    }
  }


  listview(){
    var lengths = helplist.length;
    print(helplist);
    if(helplist.length==0){
      return Container(
        width: Scwidth,
        margin: EdgeInsets.only(top: 50),
        child: Align(
          child: Text("暂无记录",style: TextStyle(color: Color(0xffaaaaaa)),),
          alignment: Alignment.topCenter,
        ),
      );
    }
//    return Container();
    return ListView.builder(
        itemCount: lengths,
        itemBuilder: (BuildContext context,int index){
          return Container(
            color: Colors.white,
//            padding: EdgeInsets.fromLTRB(0,5,0,5),
//            height: 50,
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(helplist[index]["createTime"].substring(0,10),style: TextStyle(fontSize: 10),),
                        Text(helplist[index]["createTime"].substring(11),style: TextStyle(fontSize: 10))
                      ],
                    ),
                    width: 70,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset(
                      (index+1)==lengths? Constant.ASSETS_IMG + "icon_success@2x.png":Constant.ASSETS_IMG + "icon_processing@2x.png",
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
                                Text(helplist[index]["state"],
                                    style: TextStyle(fontSize: 14.0,)
                                ),
                              ]
                          ),
                          Container(
                            child: Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(helplist[index]["remark"],
                                      style: TextStyle(fontSize: 12.0, color: Color(0xffaaaaaa))
                                  ),
                                ) ,
                              ),

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

  conview(){
//    Map borrowData = borrowDatalist.first;
    print("conview()");
    if(borrowDatalist.length==0){
      return Container(
        width: Scwidth,
        margin: EdgeInsets.only(top: 50),
        child: Align(
          child: Text("暂无记录",style: TextStyle(color: Color(0xffaaaaaa)),),
          alignment: Alignment.topCenter,
        ),
      );
    }
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    var borrowData = borrowDatalist[0];
    print(borrowData);

//    return Container();
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context,idx){
        return Column(
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
                          Text(borrowData["bank"]+borrowData["cardNo"].substring(borrowData["cardNo"].length-4,borrowData["cardNo"].length)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(borrowData["creditTimeStr"],style: TextStyle(fontSize: 13,color: Color(0xffaaaaaa)),),
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
                                    Text(borrowData["amount"].toString(),style: TextStyle(fontSize: 22,color: Color(0xff3641b7))),Text("元",style: TextStyle(fontSize: 13,color: Color(0xff3641b7)))
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
        );
      },
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
        child:conview(),

      ),
    );
  }
}