import 'package:flutter/material.dart';
import 'package:myapp/home/card.dart' as prefix0;
import 'navigation_icon_view.dart';
import '../global_config.dart';
import '../home/home_page.dart';
import '../home/card.dart';
import '../idea/idea_page.dart';
import '../market/market_page.dart';
import '../notice/notice_page.dart';
import '../my/my_page.dart';
import '../my/my_index.dart';
import '../api/request.dart';
import '../my/login.dart';
import '../util/videos.dart';
//import 'package:amap_location/amap_location.dart';

class Index extends StatefulWidget {

  @override
  State<Index> createState() => new _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin{

  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

//  void doto()async{
//    AMapLocationClient.setApiKey("98be676aa944956d0776e374ba28eadd");
//    await AMapLocationClient.startup(new AMapLocationOption( desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
//    var mt = await AMapLocationClient.getLocation(true);
//    print(mt);
//  }

  @override
  void initState(){
    super.initState();
//    doto();



    _navigationViews = <NavigationIconView>[

      new NavigationIconView(
        icon: new Icon(Icons.payment),
        title: new Text("借款"),
        vsync: this,
      ),
//      new NavigationIconView(
//        icon: new Icon(Icons.share),
//        title: new Text("分享"),
//        vsync: this,
//      ),
//      new NavigationIconView(
//        icon: new Icon(Icons.settings),
//        title: new Text("视频"),
//        vsync: this,
//      ),
      new NavigationIconView(
        icon: new Icon(Icons.perm_identity),
        title: new Text("我的"),
        vsync: this,
      ),
//      new NavigationIconView(
//        icon: new Icon(Icons.assignment),
//        title: new Text("首页"),
//        vsync: this,
//      ),
//      new NavigationIconView(
//        icon: new Icon(Icons.all_inclusive),
//        title: new Text("想法"),
//        vsync: this,
//      ),
//      new NavigationIconView(
//        icon: new Icon(Icons.add_shopping_cart),
//        title: new Text("市场"),
//        vsync: this,
//      ),
//      new NavigationIconView(
//        icon: new Icon(Icons.add_alert),
//        title: new Text("通知"),
//        vsync: this,
//      ),
//      new NavigationIconView(
//        icon: new Icon(Icons.perm_identity),
//        title: new Text("我的"),
//        vsync: this,
//      ),
    ];
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = [
      new CardPage(),
//      new ChewieDemo(),
//      new HomePage(),
//      new IdeaPage(),
//      new MarketPage(),
//      new NoticePage(),
//      new MyPage(),
        new MyiPage()
    ];

    _currentPage = _pageList[_currentIndex];
  }

  void _rebuild() {
    setState((){});
  }

  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: _navigationViews
            .map((NavigationIconView navigationIconView) => navigationIconView.item)
            .toList(),
      currentIndex: _currentIndex,
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
          if(index==1 && Request.token==null){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return LoginPage();
            }));
            return;
          };

        setState((){
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      }
    );

    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.white,
        body: new Center(
            child: _currentPage
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
//      theme: GlobalConfig.themeData
    );
  }

}