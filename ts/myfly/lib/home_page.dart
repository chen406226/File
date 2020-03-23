import 'air_asia_bar.dart';
import 'content_card.dart';
import 'rounded_button.dart';
import 'package:flutter/material.dart';
import 'video.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AirAsiaBar(height: 210.0),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 40.0),
              child: new Column(
                children: <Widget>[
                  _buildButtonsRow(context),
                  Expanded(child: ContentCard()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsRow(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
//          new RoundedButton(text: "ONE WAY"),
          new FlatButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){ return new ChewieDemo();}));
          }, child: Text("ONE WAY")),
          new RoundedButton(text: "ROUND"),
          new RoundedButton(text: "MULTICITY", selected: true),
        ],
      ),
    );
  }
}
