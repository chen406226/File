import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
}