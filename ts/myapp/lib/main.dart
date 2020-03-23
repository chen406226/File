import 'package:flutter/material.dart';
import 'index/index.dart';
import 'home/card.dart';
import 'home/home_page.dart';
import 'util/ServiceLocator.dart';
import 'util/initData.dart';
//import 'package:amap_location/amap_location.dart';
//void main() => runApp(new ZhiHu());
void main()async {
//  AMapLocationClient.setApiKey("98be676aa944956d0776e374ba28eadd");
  setupLocator(); //拨号
  await initData.doinit();
//  await AMapLocationClient.startup(new AMapLocationOption( desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters));


  return runApp(NameRouters.initApp());
}


class NameRouters {
  static Map<String,WidgetBuilder> routes;
  static Widget initApp(){
    return MaterialApp(
      initialRoute: "/",
      routes: NameRouters.initRoutes(),
    );
  }
  //初始化路由
  static initRoutes(){
    routes = {
      '/':(context) => MyApp(),
      '/cardpage':(context)=>CardPage(),
      '/home':(context) => HomePage(),
    };
    return routes;
  }
}


class MyApp extends StatelessWidget {

//  @override
//  void dispose() {
//    //注意这里关闭
//    AMapLocationClient.shutdown();
//  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "来花呗",
      home: new Index(),
    );
  }
}
