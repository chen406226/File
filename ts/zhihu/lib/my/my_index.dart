import 'package:flutter/material.dart';
import 'package:zhihu/constant/constant.dart';
import 'package:zhihu/home/home_page.dart';
import '../util/screen_utils.dart';
import '../page/borrow/log.dart';
import '../page/myconf/receipt_card.dart';
import '../page/help/index.dart';
import '../page/notice/index.dart';
import 'login.dart';
import '../page/myconf/approve_info.dart';




//我的首页

class Navurl {
  final String title;
  final String img;
  final String url;

  Navurl(this.title,this.img,this.url);
}

//class myiPage extends StatefulWidget {
//
//  @override
//  _myiPage createState() => new _myiPage();
//
//}
class MyiPage extends StatefulWidget {

  @override
  _myiPage createState() => new _myiPage();
}

class _myiPage extends State<MyiPage> {

//class _myiPage extends StatefulWidget {
  // 间隔
  double Scwidth = ScreenUtils.getInstance().screenWidth;


  SliverToBoxAdapter divider(){
    return SliverToBoxAdapter(
      child: Container(
        height: 10.0,
        color: const Color.fromARGB(255, 247, 247, 247),
      ),
    );
  }

  BuildContext context = null;

  String avaimg = "sdfsdf";

  String version = 'V 1.0';

  @override
  initState(){
    print("initstate");
  }

  getcontext(){
    return this.context;
  }

  setcontext(con){
    this.context = con;
  }


  static final Navurl l1 = Navurl("我的借款","ic_me_wallet.png","card");
  static final Navurl l2 = Navurl("我的申请","ic_me_journal.png","card");


  _rightArrow() {
    return Icon(
      Icons.chevron_right,
      color: const Color.fromARGB(225, 204, 204, 204),
    );
  }

  showlistnav() {
    List _listnav = [l1,l2];
    List <SliverToBoxAdapter> dol = [];
    _listnav.forEach((item){
      dol.add(new SliverToBoxAdapter(
        child: GestureDetector(
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset(
                  Constant.ASSETS_IMG + item.img,
                  width: 25.0,
                  height: 25.0,
                ),
              ),
              Expanded(
                flex: 1,
                child:new Text(item.title,
                    style: TextStyle(fontSize: 15.0,backgroundColor: Colors.red)),
              ),
              _rightArrow()
            ],
          ),
          onTap: (){
            Navigator.push(getcontext(), MaterialPageRoute(builder: (context){return HomePage();}));
          },
        ),
      ));
    });
    return dol;
  }


  @override
  Widget build(BuildContext contex) {
    // TODO: implement build
    setcontext(contex);
    return  Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: SafeArea(
        child: new Column(
          children: <Widget>[
            Container(
              color: Colors.black45,
                  child: new Column(
                    children: <Widget>[
                      new Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: new Row(
                        children: <Widget>[
                          new Text("我的",style: TextStyle(color: Colors.black,fontSize: 20),),
                            Expanded(
                             child: Align(
                                child: IconButton(
                                  icon:Icon(true?Icons.notifications_active:Icons.notifications_none),
                                  color: true?Colors.red:Colors.grey,
                                  iconSize: 20.0,
//                                  size: 20.0,
                                  onPressed: (){
                                    Navigator.push(getcontext(), MaterialPageRoute(builder: (context){return NoticePage();}));
                                  },
                                ),
                               alignment: Alignment.centerRight,
                              ),
                            )
                         ],
                        ),
                      ),
                      new Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child:new Row(
                        children: <Widget>[
                          Container(
                            child: CircleAvatar(
                                backgroundImage: NetworkImage("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg")
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  child: Text("用户2343",style: TextStyle(fontSize: 13),textAlign: TextAlign.left,),
                                ),
                                Container(
                                  width: 200,
                                  child: Text("197****2343",style: TextStyle(fontSize: 15),),
                                )
                              ],
                            ),
                          )

                        ],
                      )

                      ),
                    ],
                  )

            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          Constant.ASSETS_IMG+'icon_mine_certification@2x.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(getcontext(), MaterialPageRoute(builder: (context){
//                            return HomePage();
                            return ApproveInfoPage();

                          }));},
                        child: Container(
                          width: Scwidth-45,
                          height: 44.7,
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1/3,color: Color(0xFFcccccc)))
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '认证中心',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              _rightArrow()
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          Constant.ASSETS_IMG+'ic_me_wallet.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){return LoginPage();}));

                            //Navigator.push(context, MaterialPageRoute(builder: (context){return BorrowLogPage();}));
                          },
                        child: Container(
                          width: Scwidth-45,
                          height: 44.2,
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1/3,color: Color(0xFFcccccc)))
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '借款记录',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              _rightArrow()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          Constant.ASSETS_IMG+'ic_me_photo_album.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){return ReceiptCardPage();}));},
                        child: Container(
                          width: Scwidth-45,
                          height: 45,
//                        decoration: const BoxDecoration(
//                            border: Border(bottom: BorderSide(width: 1,color: Color(0xFFFF7F7F7F)))
//                        ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '收款银行卡',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              _rightArrow()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          Constant.ASSETS_IMG+'ic_me_follows.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){return HelpPage();}));},
                        child: Container(
                          width: Scwidth-45,
                          height: 46,
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1/3,color: Color(0xFFcccccc)))
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '帮助中心',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              _rightArrow()
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          Constant.ASSETS_IMG+'ic_me_follows.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                      Container(
                        width: Scwidth-45,
                        height: 45,
//                        decoration: const BoxDecoration(
//                            border: Border(bottom: BorderSide(width: 1,color: Color(0xFFFF7F7F7F)))
//                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child:Row(
                                children: <Widget>[
                                  Text('客服电话',style: TextStyle(fontSize: 15)),
                                  Expanded(
                                    child: Align(
                                      child: Text(
                                        "400-123456",style: TextStyle(color: Color(0xffaaaaaa)),
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            _rightArrow()
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          Constant.ASSETS_IMG+'ic_me_doulist.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                      Container(
                        width: Scwidth-45,
                        height: 45,
//                        decoration: const BoxDecoration(
//                            border: Border(bottom: BorderSide(width: 1,color: Color(0xFFFF7F7F7F)))
//                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child:Row(
                                children: <Widget>[
                                  Text('version',style: TextStyle(fontSize: 15)),
                                  Expanded(
                                    child: Align(
                                      child: Text(
                                          version,style: TextStyle(color: Color(0xffaaaaaa)),
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            _rightArrow()
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
