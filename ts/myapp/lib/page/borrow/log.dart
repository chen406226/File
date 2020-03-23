//借款记录
import 'package:flutter/material.dart';
import 'package:myapp/page/borrow/borrow_schema.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'borrow_detail.dart';
import '../../api/request.dart';
import '../../api/Api.dart';

class BorrowLogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _BorrowLogState();
  }
}



class _BorrowLogState extends State<BorrowLogPage> {
  double Scwidth = ScreenUtils.getInstance().screenWidth;
  int pages = 1;
  int pageSize = 10;
  int total = 1;
  int current = 1;
  List datalist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestborrowlog();
  }

  requestborrowlog()async{
    var data;
    print("借款");
    Map params =new Map();
    params["current"] = 1;
    params["pageSize"] = 10;
    params["pages"] = 1;
    params["total"] = 1;
//    var params = {"pages":1,"pageSize":10,"total":1,"current":1};
    try{
      data = await Request.post(Api.host+Api.borrowlog,params: params);
      if(data["code"]==200){
        this.setState((){datalist = data["data"]["list"];});
      }
    }catch(e){

    }
  }

  statecolor(state){
    if(state.toString() == "50"||state.toString() == "90"||state.toString() == "27"){
      return Color(0xffff93a0);
    }else if(state.toString() == "30"){
      return Color(0xff8fdeaa);
    }else if(state.toString() == "10"||state.toString() == "20"||state.toString() == "21"||state.toString() == "22"||state.toString() == "26"){
      return Color(0xfffabb3c);
    }else{
      return Color(0xff666666);
    }
  }


  listview(){
    if(datalist.length==0){
      return Container(
        width: Scwidth,
        margin: EdgeInsets.only(top: 50),
        child: Align(
          child: Text("暂无记录",style: TextStyle(color: Color(0xffaaaaaa)),),
          alignment: Alignment.topCenter,
        ),
      );
    }

    return ListView.builder(
      itemCount: datalist.length,
      itemBuilder: (context,idx){
        var data = datalist[idx];
        return new Container(
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
                    Expanded(
                      child: Container(
                        width: (Scwidth-80)*0.7,
                        child: Text("借款时间："+data["createTime"],),
                      ),
                    ),
                    FlatButton(
                      child: Text("查看详情 >"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                          return BorrowDetailPage(data["id"]);
                        },settings:RouteSettings(
                            arguments:borrowSchema(data["id"])
                        )
                        ));
                      },
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
                      child: Text("借款本金",style: TextStyle(color: Color(0xff3641b7)),),
                    ),
                    Container(
                      width: (Scwidth-80)*0.35,
                      child: Text("借款周期",style: TextStyle()),
                    ),
                    Text("状态")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: (Scwidth-80)*0.35,
                      child: Text(data["amount"].toString()),
                    ),
                    Container(
                      width: (Scwidth-80)*0.35,
                      child: Text("30天"),
                    ),
                    Text(data["stateStr"],style: TextStyle(color: statecolor(data["state"])),)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: new AppBar(
        title: new Text("借款记录",style: TextStyle(color: Colors.white),),
        backgroundColor: GlobalConfig.TabbarColor,
      ),
      body: new SafeArea(
          child: listview()
      ),
    );
  }
}