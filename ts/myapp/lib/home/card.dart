import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'dart:async';
import '../global_config.dart';
import '../util/screen_utils.dart';
import 'package:myapp/constant/constant.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../page/borrow/check_borrow.dart';
import '../page/borrow/moneySchema.dart';
import '../page/borrow/repay.dart';
import '../api/request.dart';
import '../api/Api.dart';
import '../util/ServiceLocator.dart';
import '../util/TelAndSmsService.dart';
import '../page/notice/index.dart';
//import 'package:video_player/video_player.dart';


class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}


class CardPage extends StatefulWidget {
  CardPage({Key key})
      : super(key: key);
  @override
  _CardPageState createState() => new _CardPageState();

}

class _CardPageState extends State<CardPage> {

  double Scwidth = ScreenUtils.getInstance().screenWidth;
  final TelAndSmsService _service = locator<TelAndSmsService>();


  int amount = 0;
  var show = true;
  var buttontype = 4;// 0为 1 未认证 2已认证 3已借款 4 已借款可以还款的
  String buttontxt = "马上借钱";
  List bannerlist = [{"path":"https://static.segmentfault.com/sponsor/20191122.png"}];
  List noticelist = [{"value":"撒的发生大发"}];
  var noticelength = 1;
//  var noticelist = ["暗室逢灯","撒的发是否暗室士大夫逢灯","方大化工暗室暗室逢逢灯","计划暗室士大夫逢灯","阿士大夫撒阿撒地方暗室逢灯",];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dobuttontxt();
    requestbanner();
    requestindex();

  }

  void dobuttontxt(){
    if(buttontype==4){
      buttontxt = "立即还款";
    }else{
      buttontxt = "马上借钱";
    }
  }

  requestbanner()async{
    var data;
    try{
      data = await Request.get(Api.host+Api.banner,params: {});
      if(data["code"]==200){
        this.setState((){bannerlist = data["data"]["list"];});
      }
    }catch(e){

    }
  }

  requestindex()async{
    var data;
    try{
      data = await Request.get(Api.host+Api.index,params: {});
      if(data["code"]==200){
//        this.setState((){bannerlist = data["data"]["list"];});
      }
    }catch(e){

    }
    requestnoticelist();
  }
  requestnoticelist()async{
    var data;
    var self = this;
    try{
      data = await Request.get(Api.host+Api.noticelist,params: {});
      if(data["code"]==200){
        self.setState((){noticelist = data["data"]["list"];noticelength=data["data"]["list"].length;});
      }
    }catch(e){

    }
  }



  _rightArrow() {
    return Icon(
      Icons.chevron_right,
      color: const Color.fromARGB(225, 204, 204, 204),
    );
  }

  void showAmountDialog(BuildContext context){
//    var show = true;

    showDialog<void>(
        context: context,
        builder: (context){
          return StatefulBuilder(
            builder: (context,state){
              return prefix0.Dialog(child: Container(
                padding: EdgeInsets.all(24),
                width: 311,
                height: 250,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 2, 0, 10),
                      child: Text("选择借款金额"),
                    ),
                    Wrap(
//                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      runSpacing: 4,
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: 70,
                          padding: EdgeInsets.all(0.0),
                          child: FlatButton(
//                            padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text("500元",style: TextStyle(fontSize: 12,color: amount == 500 ?Colors.white:Color(0xff3641b7)),),
                            color: (amount == 500) ? Color(0xff3641b7):Color(0xffd9e2f5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(6))
                            ),
//                            elevation: 5.0,
//                            highlightElevation: 8.0,
                            onPressed: (){state((){amount=500;});},
                          ),

                        ),
                        ButtonTheme(
                          minWidth: 70,
                          padding: EdgeInsets.all(0.0),
                          child: FlatButton(
//                            padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text("1000元",style: TextStyle(fontSize: 12,color: amount == 1000 ?Colors.white:Color(0xff3641b7)),),
                            color: amount == 1000 ? Color(0xff3641b7):Color(0xffd9e2f5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(6))
                            ),
//                            elevation: 5.0,
//                            highlightElevation: 8.0,
                            onPressed: (){state((){amount=1000;});},
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 70,
                          padding: EdgeInsets.all(0.0),
                          child: FlatButton(
//                            padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text("1500元",style: TextStyle(fontSize: 12,color: amount == 1500 ?Colors.white:Color(0xff3641b7)),),
                            color: amount == 1500 ? Color(0xff3641b7):Color(0xffd9e2f5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(6))
                            ),
//                            elevation: 5.0,
//                            highlightElevation: 8.0,
                            onPressed: (){state((){amount=1500;});},
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 70,
                          padding: EdgeInsets.all(0.0),
                          child: FlatButton(
//                            padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text("2000元",style: TextStyle(fontSize: 12,color: amount == 2000 ?Colors.white:Color(0xff3641b7)),),
                            color: amount == 2000 ? Color(0xff3641b7):Color(0xffd9e2f5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(6))
                            ),
//                            elevation: 5.0,
//                            highlightElevation: 8.0,
                            onPressed: (){state((){amount=2000;});},
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 70,
                          padding: EdgeInsets.all(0.0),
                          child: FlatButton(
//                            padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text("3000元",style: TextStyle(fontSize: 12,color: amount == 3000 ?Colors.white:Color(0xff3641b7)),),
                            color: amount == 3000 ? Color(0xff3641b7):Color(0xffd9e2f5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(6))
                            ),
//                            elevation: 5.0,
//                            highlightElevation: 8.0,
                            onPressed: (){state((){amount=3000;});},
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    ButtonTheme(
                      minWidth: 270,
                      child: FlatButton(
//                            padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text("确定",style: TextStyle(fontSize: 12,color: amount > 0 ?Colors.white:Color(0xff3641b7)),),
                        color: amount >0 ? Color(0xff3641b7):Color(0xffd9e2f5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
//                            elevation: 5.0,
//                            highlightElevation: 8.0,
                        onPressed: (){

                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (context) {
                                return new CheckBorrowPage();
                              },
                              settings:RouteSettings(
                                  arguments:MoneySchema(amount)
                              )
                          ));
                        },
                      ),
                    ),
                  ],
                ),
              ),);
            },
          );
        }
    );
  }

  shownotice(){
    if(noticelength==0){
      return Container();
    }else{
      return Builder(builder: (BuildContext context){
        return Container(
          child: new ConstrainedBox(
              child: new Swiper(
                outer:false,
                autoplay: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (c, n) {
                  return Text(noticelist[n]["value"],maxLines: 1,overflow: TextOverflow.fade,style: TextStyle(color: Colors.black),textAlign:TextAlign.left,);
                },
                itemCount: noticelength,
//                          onTap: (index){print("click$index");},
              ),
              constraints:new BoxConstraints.loose(new Size(Scwidth-60, 20.0))
          ),
        );
      },);
    }
  }

  showbanner(){
    if(buttontype == 1){
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("凭身份证最高可申请（元）",style: TextStyle(fontSize: 14),),
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(children: <Widget>[Text("2000.00",style: TextStyle(fontSize: 32))],),
          ),
          Row(
            children: <Widget>[
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[Text("到账快",style: TextStyle(fontSize: 14,color: Color(0xffeeeeee)),)],),
                    Row(children: <Widget>[Text("最快3分钟",style: TextStyle(fontSize: 12,color: Color(0xffbbbbbb)),)],)
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[Text("利率低",style: TextStyle(fontSize: 14,color: Color(0xffeeeeee)),)],),
                    Row(children: <Widget>[Text("日利率低至万3",style: TextStyle(fontSize: 12,color: Color(0xffbbbbbb)),)],)
                  ],
                ),
              )
            ],
          )
        ],
      );
    }else if(buttontype == 2){
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("凭身份证最高可申请（元）",style: TextStyle(fontSize: 14),),
              _rightArrow()
            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(children: <Widget>[Text("2000.00",style: TextStyle(fontSize: 32))],),
          ),
          Row(
            children: <Widget>[
              Text("借款期限",style: TextStyle(fontSize: 12),),
              Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Text("30",style: TextStyle(fontSize: 16),),),
              Text("天",style: TextStyle(fontSize: 12),),
              _rightArrow()
            ],
          )
        ],
      );
    }else if(buttontype == 3){
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("已借金额（元）",style: TextStyle(fontSize: 14),),
            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(children: <Widget>[Text("2000.00",style: TextStyle(fontSize: 32))],),
          ),
          Row(
            children: <Widget>[
              Text("借款期限",style: TextStyle(fontSize: 12),),
              Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Text("30",style: TextStyle(fontSize: 16),),),
              Text("天",style: TextStyle(fontSize: 12),),
            ],
          )
        ],
      );
    }else if(buttontype == 4){
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("当前应还金额（元）",style: TextStyle(fontSize: 14),),
            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(children: <Widget>[Text("2000.00",style: TextStyle(fontSize: 32))],),
          ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text("请与11月23号之前还款，以免产生额外费用",style: TextStyle(fontSize: 14,color: Color(0xffe6e13f)),),
              ),
            ],
          )
        ],
      );
    }



//    return Column(
//      children: <Widget>[
//        Row(
//          children: <Widget>[
//            Column(
//              children: <Widget>[
//                Text("来花呗铂金卡",style: TextStyle(fontSize: 18),),
//                Text("PLATINUM CARO")
//              ],
//            ),
//            Expanded(
//              child: Align(
//                child: Text("极速审批 | 安全保障"),
//                alignment: Alignment.centerRight,
//              ),
//            )
//          ],
//        ),
//        Container(height: 10),
//        MySeparator(color: Colors.white),
//        Container(height: 10),
//        Column(
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                Expanded(
//                    child: Align(
//                      child: Column(
//                        children: <Widget>[
//                          Text("最高可借额度（元）"),
//                        ],
//                      ),
//                      alignment: Alignment.centerLeft,
//                    )
//                ),
//              ],
//            ),
//            Row(
//              children: <Widget>[
//                Expanded(
//                    child: Align(
//                      child: Column(
//                        children: <Widget>[
//                          Text("10000",style: TextStyle(fontSize: 30,),),
//                        ],
//                      ),
//                      alignment: Alignment.centerLeft,
//                    )
//                ),
//              ],
//            ),
//          ],
//        )
//      ],
//    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          backgroundColor: Colors.white,
//          appBar: new AppBar(
//            title: new Text('中国银行'),
//            leading:new Container(
//              child:Image.asset("image/favicon.png"),
//            ),
//          ),
          body: new SafeArea(
              child: Builder(
                builder: (BuildContext context){
                  return ListView(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 10, 20),
                        child: new Row(
                          children: <Widget>[
                            new Text("来花呗",style: TextStyle(color: Colors.black,fontSize: 20),),
                            Expanded(
                              child: Align(
                                child: IconButton(
                                  icon:Icon(true?Icons.notifications_active:Icons.notifications_none),
                                  color: true?Colors.red:Colors.grey,
                                  iconSize: 20.0,
                                  alignment: Alignment.centerRight,
//                                  size: 20.0,
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){return NoticePage();}));
                                  },
                                ),
                                alignment: Alignment.centerRight,

                              ),
                            )
                          ],
                        ),
                      ),
                      new Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        fit: StackFit.loose,
                        overflow: Overflow.clip,
                        children: <Widget>[
                          ClipRRect(
                            child: Container(
                              color: Color(0xff3843bd),
                              width: Scwidth-40,
                              height: 200.0,
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                                  child: showbanner()
                              ),

                            ),
                            borderRadius:BorderRadius.circular(20.0),
                          ),
                          Positioned(
                            top: 150,
                            child: Image(
                              width: Scwidth,
                              image: AssetImage(Constant.ASSETS_IMG+'aomian.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              top: 150,
                              child: ButtonTheme(
                                minWidth:150,
                                child:RaisedButton(
                                  padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  color: Colors.white,
                                  elevation: 5.0,
                                  highlightElevation: 8.0,
                                  child: Text(buttontxt,style: TextStyle(fontSize: 20,color: Colors.black87),),
                                  onPressed: ()async{
                                    if(buttontype==4){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RepayPage())); //还款
                                    }else if(buttontype==0){
                                      showAmountDialog(context);  //马上借钱
                                    }
                                  },
                                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                ),
                              )
                          )
                        ],
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        height: 33,
                        decoration: new BoxDecoration(
                          borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                          color: Color(0xfff1f5ff),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Icon(Icons.volume_up,size: 20.0,color: Colors.blueGrey,),
                            ),
                            Expanded(
                              child: ClipRRect(
                                borderRadius:new BorderRadius.all(const Radius.circular(3.0)),
                                child: shownotice(),
                              ),
//                      child: Text(" 尾号7878成功借款3000元，申请至放撒的发生大发撒的发生大发款耗时3分钟",maxLines: 1,overflow: TextOverflow.fade,style: TextStyle(color: Colors.black),textAlign:TextAlign.left,),
                            )
                          ],
                        ),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child:ButtonTheme(
                              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                              child: FlatButton.icon(
                                icon: Icon(Icons.call,size: 20.0,color: Color(0xfffab832),),
                                label: Text("客服中心",style: TextStyle(color: Color(0xfffab832)),),
                                onPressed: (){_service.call(Constant.SERVICE_PHONE);},
                              ),
                            ),
                            decoration: new BoxDecoration(
                                borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
                                border: new Border.all(color: Color(0xfffab832),width:1),
                                color: Color(0xfffff7e5)
                            ),
                          ),
                          Container(
                            child:ButtonTheme(
                              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),

                              child: FlatButton.icon(
                                icon: Icon(Icons.help,size: 20.0,color: Color(0xffff6174),),
                                label: Text("帮助中心",style: TextStyle(color: Color(0xffff6174)),),
                                onPressed: (){print(23);},
                              ),
                            ),
                            decoration: new BoxDecoration(
                                borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
                                border: new Border.all(color: Color(0xffff6174),width:1),
                                color: Color.fromARGB(40, 255, 97, 116)
                            ),
                          ),

                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("最新活动",style: TextStyle(color: Colors.grey),),
                        ),
                      ),
                      bannerlist.length>0?Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: ClipRRect(
                          borderRadius:new BorderRadius.all(const Radius.circular(20.0)),
                          child: Container(
                            decoration: new BoxDecoration(
//                        borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
//                      border: new Border.all(color: Color(0xFFBBBBBB),width:1),
//                        color: GlobalConfig.searchBackgroundColor
                            ),
                            child: new ConstrainedBox(
                                child: new Swiper(
                                  outer:false,
                                  autoplay: true,
                                  itemBuilder: (c, n) {
//                            return new Wrap(
//                              runSpacing:  6.0,
//                              children: [0].map((i){
                                    return new Container(
//                                decoration: new BoxDecoration(
//                                    borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
//                                    border: new Border.all(color: Color(0xFFBBBBBB),width:1),
//                                    color: GlobalConfig.searchBackgroundColor
//                                ),
                                      width: Scwidth-40,
                                      child: new Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new SizedBox(
                                            child:  new Container(
                                              width:Scwidth-40,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
//                                                image: secondImageList[index],
                                                      image: NetworkImage(bannerlist[n]["path"]),
                                                      fit: BoxFit.fill
                                                  ),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10)
                                                  )
                                              ),
                                            ),
                                          ),
//                                    new Padding(padding: new EdgeInsets.only(top:6.0),child: new Text("0980980"),)
                                        ],
                                      ),
                                    );
//                              }).toList(),
//                            );
                                  },
                                  pagination: new SwiperPagination(
                                      margin: new EdgeInsets.all(5.0),
                                      alignment: Alignment.bottomRight,
                                      builder: DotSwiperPaginationBuilder(
                                          color: Colors.black54,
                                          activeColor: Colors.blue,
                                          activeSize: 12
                                      )
                                  ),
                                  itemCount: bannerlist.length,
                                  onTap: (index){print("click$index");},
                                ),
                                constraints:new BoxConstraints.loose(new Size(Scwidth-40, 110.0))
                            ),
                          ),
                        ),

                      ):Container(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:30,horizontal: 20),
                        child: Container(
                          width: 300,
                          height: 200,
//                          child: VideoApp(),
                        ),
                      )
                    ],
                  );
                },
              )
          ),
        ),
        theme: GlobalConfig.themeData
    );
  }

}

//height: MediaQuery.of(context).size.width * 0.12,
//width: MediaQuery.of(context).size.width * 0.12,
