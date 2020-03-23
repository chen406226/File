//
import 'package:flutter/material.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'package:zhihu/constant/constant.dart';
import 'borrow_detail.dart';


class ConfirmInfoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _ConfirmInfoState();
  }
}


class _ConfirmInfoState extends State<ConfirmInfoPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;




  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: new AppBar(
        title: new Text("确认借款信息",style: TextStyle(color: Colors.white),),
        backgroundColor: GlobalConfig.TabbarColor,
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
                        child:Text("交易申请提交成功",style: TextStyle(fontSize: 20),),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                        child:Text("平台正则审核您的资料，请保证信息填写无误，审核成功之后会短信告知放款成功。",textAlign:TextAlign.center,style: TextStyle(color: Color(0xffaaaaaa),)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ButtonTheme(
//                    buttonColor:Colors.green,
              minWidth: Scwidth-40,
              height: 48 ,
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: FlatButton(
                child: Text("查看审核进度",style: TextStyle(color: Colors.white),),
                color: Color(0xff3641b7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){return BorrowDetailPage();}));
                },

//                    padding: ,
              ),
            ),
          ],
        ),

      ),
    );
  }
}