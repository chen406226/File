import 'dart:convert';
import 'dart:async';
import 'localsave.dart';
import '../api/request.dart';

class initData {
  static doinit() async{
    var res = await LocalSave.getlogindata("logindata");
    print(res);
    if(res!=null){
      var jsondata = json.decode(res);
      if(jsondata["token"]!=null){
        Request.token = jsondata["token"];
        Request.userId = jsondata["userId"];
      }

    }

  }
}