import 'package:flutter/material.dart';
import 'index/index.dart';
import 'home/card.dart';
import 'home/home_page.dart';

//void main() => runApp(new ZhiHu());
void main() => runApp(NameRouters.initApp());


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
      '/':(context) => ZhiHu(),
      '/cardpage':(context)=>CardPage(),
      '/home':(context) => HomePage(),
    };
    return routes;
  }
}


class ZhiHu extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "来花呗",
      home: new Index(),
    );
  }
}
