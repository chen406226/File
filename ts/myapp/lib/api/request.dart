import 'dart:async';
import 'package:http/http.dart' as http;
import 'Stringuntil.dart';
import 'dart:convert';
import '../util/localsave.dart';
import '../constant/constant.dart';
class Request {
  // get请求的封装，传入的两个参数分别是请求URL和请求参数，请求参数以map的形式传入，会在方法体中自动拼接到URL后面
  static String token=null;
  static int userId=null;

  static Future<Map<String,Object>> get(String url, {Map<dynamic, dynamic> params}) async {
//    if (params != null && params.isNotEmpty) {

    if (params != null) {
      if(token!=null){
        params["token"] = token;
      }
      if(userId!=null){
        params["userId"] = userId;
      }
      params["versionNumber"] = Constant.VERSION;
      // 如果参数不为空，则将参数拼接到URL后面
      StringBuffer sb = StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }

    var x = StringUt.generateMd5(StringUt.getsignMsg(params,token));
//    print(params);
    print(x);
    print(url);
//    print(StringUt.getsignMsg(params,token));
    print(params.toString());
    http.Response res = await http.get(url, headers: getCommonHeader(x,token));
    print(res);
    String body = utf8.decode(res.bodyBytes);
    Map<String, dynamic> obj = json.decode(body);
//    new Repose.fromJson(json.decode(body));
    print(body);
    return obj;
  }

  // post请求
  static Future<Map<String,Object>> post(String url, {Map<dynamic, dynamic> params}) async {
    if(token!=null){
      params["token"] = token;
    }
    if(userId!=null){
      params["userId"] = userId;
    }
    params["versionNumber"] = Constant.VERSION;

    Map sortParams = StringUt.sortMap(params);

    var x = StringUt.generateMd5(StringUt.getsignMsg(sortParams,token));

    print(sortParams.toString());
    print(x);
    http.Response res;
    try{
      res = await http.post(url, body: sortParams, headers: getCommonHeader(x,token));
    }catch(e){
      print(e.toString());
    }
    String body = utf8.decode(res.bodyBytes);
    Map<String, dynamic> obj = json.decode(body);
    print(obj);

    return obj;
  }

  static Map<String, String> getCommonHeader( signMsg,token) {
    Map<String, String> header = Map();
//    header['is_flutter_osc'] = "1";
    header["signMsg"] = signMsg;
    if(token!=null){
      header["token"] = token;
    }
    header["charset"] = "utf-8";
    header["Accept-Charset"] = "utf-8";
//    header["Content-Type"] = "text/html";

    return header;
  }
}