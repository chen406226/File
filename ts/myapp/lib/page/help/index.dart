//
import 'package:flutter/material.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'detail.dart';
import 'schema.dart';

class HelpPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _HelpState();
  }
}


class _HelpState extends State<HelpPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;

  var helplist = [{"name":"can i see you?","index":1,"con":"下面是一个将大写字母A-Z沿垂直方向显示的例子由于垂直方向空间会超过屏幕视口高度"},{"name":"如何还款?","index":2,"con":"到银行取是一个将大写字母A-Z沿垂直方向显示的例子由于垂直方向空间会超过屏幕视口高度"}];
  BuildContext context = null;
  getcontext(){
    return this.context;
  }

  setcontext(con){
    this.context = con;
  }


  showrow(){
    return helplist.map((c){
    print(helplist.length);
//      return Text(c["name"]);
//      return
      return Padding(
        padding: EdgeInsets.only(left: 5),
          child: new Container(
              child: new FlatButton(
                  onPressed: (){
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) {
                          return new DetailPage();
                        },
                        settings:RouteSettings(
                          arguments:Detail(c["con"],c["name"])
                        )
                    ));
                  },
                  child: new Row(
                    children: <Widget>[

                      new Container(
                        child: new Text(c["name"]),
                      ),
//                      new Expanded(
//                          child: new Container(
//                            child:Text(c["name"]),
//                          )
//                      ),
                    ],
                  )
              ),
              decoration: new BoxDecoration(
                  border: new BorderDirectional(bottom: new BorderSide(color:Color(0xffaaaaaa),width: helplist.length==c["index"]?0:1)),
                  color: GlobalConfig.searchBackgroundColor
              )
          )
      ); FlatButton(
        child: Text(c["name"]),

        onPressed: (){},
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context){
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    setcontext(context);

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
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left:5.0),
              child: Center(
                child: Column(
                  //动态创建一个List<Widget>
                  children: showrow(),
                ),
              ),
            ),
          )
      ),
    );
  }
}