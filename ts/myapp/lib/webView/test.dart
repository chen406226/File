import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import '../global_config.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  final dynamic params;
  static final String TITLE = 'title';

  WebViewPage(this.url, {Key key, this.params}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: WebView(
//        initialUrl: "https://flutter.dev/",
      initialUrl: "https://www.51rz.com",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}
