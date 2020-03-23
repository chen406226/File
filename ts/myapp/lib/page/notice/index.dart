import 'package:flutter/material.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import '../../constant/constant.dart';
import 'detail.dart';
import 'schema.dart';

class NoticePage extends StatefulWidget{
  @override
  _NoticeState createState() => new _NoticeState();
}

class _NoticeState extends State<NoticePage>{

  var helplist = [{"name":"can i see you?","time":"2017-01-02 12:80:29","index":1,"con":"下面是一个将大写字母A-Z沿垂直方向显示的例子由于垂直方向空间会超过屏幕视口高度"},{"name":"如何还款?","time":"2019-07-02 12:80:29","index":2,"con":"到银行取"}];

  listview(){
    var lengths = helplist.length;
    return ListView.builder(
      itemCount: lengths,
        itemBuilder: (BuildContext context,int index){
          print(index);
          print(lengths);
          return Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(0,5,0,5),
//            height: 50,
            margin: EdgeInsets.only(bottom: 10),
            child:FlatButton(
              onPressed: (){
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) {
                      return new DetailPage();
                    },
                    settings:RouteSettings(
                        arguments:Detail(helplist[index]["con"],helplist[index]["name"],helplist[index]["time"])
                    )
                ));
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset(
                      Constant.ASSETS_IMG + "ic_me_wallet.png",
                      width: 25.0,
                      height: 25.0,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Row(
                              children: <Widget>[
                                Text("系统公告",
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
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: new AppBar(
        title: new Text("消息",style: TextStyle(color: Colors.white),),
        backgroundColor: GlobalConfig.TabbarColor,
      ),
      body: new SafeArea(
          child: new Container(
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(2.0),
                  border:Border.all(width: 1,color: Color(0xffaaaaaa))
              ),
              child:listview()
          )
      ),
    );
  }
}