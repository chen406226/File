import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import '../constant/constant.dart';

class StringUt {

  static generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  static generateMd5toUpper(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes).toUpperCase();
  }

  static getsignMsg(params,token) {
    String url = Constant.APP_KEY;
    if(token!=null){url+=token;};
    if (params != null && params.isNotEmpty) {
      // 如果参数不为空，则将参数拼接到URL后面
      StringBuffer sb = StringBuffer("");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "|");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    return url;
  }

  static sortMap(Map obj){
    Map map  = new Map();
    List keys = obj.keys.toList();
    keys.sort((a,b){
      List<int> al = a.codeUnits;
      List<int> bl = b.codeUnits;
      for (int i = 0; i < al.length; i++) {
        if (bl.length <= i) return 1;
        if (al[i] > bl[i]) {
          return 1;
        } else if (al[i] < bl[i]) return -1;
      }
      return 0;
    });
    keys.forEach((key){
      map[key] = obj[key].toString();
    });
    return map;
  }

}





