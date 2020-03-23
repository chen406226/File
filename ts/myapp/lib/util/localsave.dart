import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:device_info/device_info.dart';


class LocalSave {
  static savelogindata(key,value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.setString(mUserName, _userNameController.value.text.toString());
    var rs = await prefs.setString(key, value);
    return rs;
  }
  static getlogindata(k) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = await prefs.getString(k);
    return data;
  }
  
  static remove(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
  
  static savedevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//    print('Running on ${androidInfo.model}');
//    print('Running on ${androidInfo.androidId}');
//    Map<String, dynamic> obj = json.decode(data);
    Map device = {"model":androidInfo.model,"deviceId":androidInfo.androidId};
    await LocalSave.savelogindata("device", json.encode(device));

//    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//    if (Theme.of(context).platform == TargetPlatform.iOS) {
//      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
//      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
//    } else {
//      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
//      return androidDeviceInfo.androidId; // unique ID on Android
//    }

  }
  static getdevice()async {
    var res = await LocalSave.getlogindata("device");
    return json.decode(res);
  }
}