//
import 'package:flutter/material.dart';
import 'package:myapp/page/myconf/bank_schema.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'package:myapp/constant/constant.dart';
import '../../util/separator.dart';

class BankPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _BankState();
  }
}


class _BankState extends State<BankPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;
  _rightArrow() {
    return Icon(
      Icons.chevron_right,
      color: const Color.fromARGB(225, 204, 204, 204),
    );
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: new AppBar(
        title: new Text("认证中心",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: new SafeArea(
        child:ListView(
          children: <Widget>[
            Container(
              width: Scwidth,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
              margin: EdgeInsets.fromLTRB(20,20,20,0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop(BankSchema("icon_mine_service@3x.png","农业银行"));
                },
                child:Container(
                  width: Scwidth-40,
                  height: 58,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          Constant.ASSETS_IMG+'icon_mine_card@3x.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text("农业银行")
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: Scwidth,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
              margin: EdgeInsets.fromLTRB(20,20,20,0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop(BankSchema("icon_mine_help@3x.png","中信银行"));
                },
                child:Container(
                  width: Scwidth-40,
                  height: 58,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          Constant.ASSETS_IMG+'icon_mine_card@3x.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text("中信银行")
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: Scwidth,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
              margin: EdgeInsets.fromLTRB(20,20,20,0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop(BankSchema("icon_card_unselect@3x.png","工商银行"));
                },
                child:Container(
                  width: Scwidth-40,
                  height: 58,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          Constant.ASSETS_IMG+'icon_mine_card@3x.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text("工商银行")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}