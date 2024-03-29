import 'dart:async';

import '../leancloud_functions.dart';
import 'leancloud_object.dart';

class AVUser extends AVObject {
  AVUser() : super("_User");

  /// This function used for AVQuery. It's convert from string to AVUser.
  AVUser.fromQueryBackString(String queriedString)
      : super.fromQueryBackString(queriedString);

  ///
  static Future<AVUser> signUpOrLoginByMobilePhone(
      String mobileNumber, String smsCode) async {
    var leancloudFlutterPlugin = LeancloudFlutterPlugin.getInstance();
    String queriedString = await leancloudFlutterPlugin
        .signUpOrLoginByMobilePhone(mobileNumber, smsCode);
    return AVUser.fromQueryBackString(queriedString);
  }

  /// email verify
  static Future<bool> requestEmailVerify(String email) async {
    var leancloudFlutterPlugin = LeancloudFlutterPlugin.getInstance();
    bool isSuccess = await leancloudFlutterPlugin.requestEmailVerify(email);
    return isSuccess;
  }

  /// Add or Update field value with [value] into this Object by [key]
  void put(String key, Object value) {
    super.put(key, value);
  }

  /// set user name
  void setUsername(String userName) {
    this.put("username", userName);
  }

  /// set password
  void setPassword(String password) {
    this.put("password", password);
  }

  /// set email
  void setEmail(String email) {
    this.put("email", email);
  }

  String getUsername() {
    return super.get("username");
  }

  String getEmail() {
    return super.get("email");
  }

  String getSessionToken() {
    return super.get("sessionToken");
  }

  Future<AVUser> save() async {
    super.save();
    return this;
  }

  Future<AVUser> signUp() async {
    var leancloudFlutterPlugin = LeancloudFlutterPlugin.getInstance();
    String queriedString = await leancloudFlutterPlugin.signUp(this);
    return AVUser.fromQueryBackString(queriedString);
  }

  Future<AVUser> login() async {
    var leancloudFlutterPlugin = LeancloudFlutterPlugin.getInstance();
    String queriedString = await leancloudFlutterPlugin.login(this);
    return AVUser.fromQueryBackString(queriedString);
  }

  Future<String> currentUser() async {
    var leancloudFlutterPlugin = LeancloudFlutterPlugin.getInstance();
    //String jsonString = await leancloudFlutterPlugin.currentUser();
    return await leancloudFlutterPlugin.currentUser();
  }
}
