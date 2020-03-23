import 'package:flutter/material.dart';
import '../global_config.dart';

class MarketPage extends StatefulWidget {

  @override
  _MarketPageState createState() => new _MarketPageState();

}

class _MarketPageState extends State<MarketPage> {

  List<String> text = <String>["你好发几个"];
  List<int> items = List.generate(10, (i) => i);
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
//          appBar: new AppBar(
//            title: new Text('市场'),
//          ),
          body: new Column(
            children: <Widget>[
              FlatButton(
                  child: const Text("add"),
                  onPressed: (){
//                    text.add("哈哈我ss添加了");
                    setState(() {
                      text.add("哈哈大师傅");
                    });
//                    text.length+=1;
                    print("add");
                  }
              ),
              new SizedBox(
                height:3000.0,
                child: new ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: text.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        child: Center(child: Text('Entry ${text[index]}')),
                      );
                    },
                    controller: _scrollController,
                ),
              )
            ],
          )
          ),
        theme: GlobalConfig.themeData
    );
  }

}

