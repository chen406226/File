//借款记录
import 'package:flutter/material.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';


class BorrowLogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _BorrowLogState();
  }
}



class _BorrowLogState extends State<BorrowLogPage> {
  double Scwidth = ScreenUtils.getInstance().screenWidth;




  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: new AppBar(
        title: new Text("借款记录",style: TextStyle(color: Colors.white),),
        backgroundColor: GlobalConfig.TabbarColor,
      ),
      body: new SafeArea(
          child: new Container(
            margin: EdgeInsets.all(20),
            width: Scwidth-40,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(20.0),
              boxShadow: [BoxShadow(color: Color(0xee000000),blurRadius: 10),BoxShadow(color: Color(0xffFFFFff),blurRadius: 1)]
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: (Scwidth-80)*0.7,
                        child: Text("借款时间：2017-04-13 12:30"),
                      ),
                      FlatButton(
                        child: Text("查看详情 >"),
                      )
//                      Expanded(
//                        child: Align(
//                          child: FlatButton(
//                            child: Text("查看详情 >"),
//                          ),
//                          alignment: Alignment.centerRight,
//                        ),
//                      ),
//                      Icon(
//                        Icons.chevron_right,
//                        color: false?Colors.red:Colors.grey,
//                        size: 20.0,
//                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: (Scwidth-80)*0.35,
                        child: Text("借款金额"),
                      ),
                      Container(
                        width: (Scwidth-80)*0.35,
                        child: Text("还款时间"),
                      ),
                      Text("状态")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: (Scwidth-80)*0.35,
                        child: Text("3000元"),
                      ),
                      Container(
                        width: (Scwidth-80)*0.35,
                        child: Text("2019.12.10"),
                      ),
                      Text("放款成功")
                    ],
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}