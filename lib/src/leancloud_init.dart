import 'dart:async';

import 'package:flutter/services.dart';
import 'leancloud_file.dart';
import 'leancloud_object.dart';
import 'leancloud_query.dart';
import 'leancloud_user.dart';
import 'leancloud_enum.dart';

/// Leancloud flutter Plugin
class LeancloudFlutterPlugin {

  /// method channel
  static const MethodChannel _channel =
  const MethodChannel('leancloud_functions');

  /// Singleton property
  static LeancloudFlutterPlugin _instancePlugin = new LeancloudFlutterPlugin();

  /// Get plugin instance
  static LeancloudFlutterPlugin getInstance() {
    return _instancePlugin;
  }

  var _logLevel = 0;

  /// Initialize the Native SDK
  void initialize(String appId, String appKey) {
    var args = <String, dynamic>{
      'appId': appId,
      'appKey': appKey,
    };
    _channel.invokeMethod('initialize', args);
  }

  /// Setup log level must be before called initialize function
  /// The call must be include args:
  ///  [level]  --> OFF(0), ERROR(1), WARNING(2), INFO(3), DEBUG(4), VERBOSE(5), ALL(6);
  void setLogLevel(LeancloudLoggerLevel level) {
    switch (level) {
      case LeancloudLoggerLevel.OFF:
        this._logLevel = 0;
        break;
      case LeancloudLoggerLevel.ERROR:
        this._logLevel = 1;
        break;
      case LeancloudLoggerLevel.WARNING:
        this._logLevel = 2;
        break;
      case LeancloudLoggerLevel.INFO:
        this._logLevel = 3;
        break;
      case LeancloudLoggerLevel.DEBUG:
        this._logLevel = 4;
        break;
      case LeancloudLoggerLevel.VERBOSE:
        this._logLevel = 5;
        break;
      case LeancloudLoggerLevel.ALL:
        this._logLevel = 6;
        break;
    }
    var args = <String, dynamic>{
      'level': this._logLevel,
    };
    _channel.invokeMethod('setLogLevel', args);
  }

  /// Setup region must be before called initialize function
  /// The call must be include args:
  ///  [region]  --> NorthChina(0), EastChina(1), NorthAmerica(2)
  ///      REGION.NorthChina - this is default value
  ///      REGION.EastChina
  ///      REGION.NorthAmerica
  void setRegion(LeancloudCloudRegion region) {
    int regionValue;
    switch (region) {
      case LeancloudCloudRegion.NorthChina:
        regionValue = 0;
        break;
      case LeancloudCloudRegion.EastChina:
        regionValue = 1;
        break;
      case LeancloudCloudRegion.NorthAmerica:
        regionValue = 2;
        break;
    }
    var args = <String, dynamic>{
      'region': regionValue,
    };
    _channel.invokeMethod('setRegion', args);
  }

  /// send SMS code by mobile number
  void requestSMSCode(String mobileNumber) {
    var args = <String, dynamic>{
      'mobileNumber': mobileNumber,
    };
    _channel.invokeMethod('requestSMSCode', args);
  }

  /// sign up
  /// Usually suggest using AVUser.signUp() function instead of this.
  Future<dynamic> signUp(AVUser user) async {
    var args = <String, dynamic>{'avUser': user.toString()};
    var objectString = await _channel.invokeMethod('signUp', args);
    if (this._logLevel != 0) {
      print("[signUp function] -> " + objectString);
    }
    return objectString;
  }

  /// login
  /// Usually suggest using AVUser.login() function instead of this.
  Future<dynamic> login(AVUser user) async {
    var args = <String, dynamic>{'avUser': user.toString()};
    var objectString = await _channel.invokeMethod('login', args);
    if (this._logLevel != 0) {
      print("[login function] -> " + objectString);
    }
    return objectString;
  }

  /// request Email verify
  /// Usually suggest using AVUser.requestEmailVerify() function instead of this.
  Future<bool> requestEmailVerify(String email) async {
    var args = <String, dynamic>{
      'email': email,
    };
    return await _channel.invokeMethod('requestEmailVerify', args);
  }

  /// sign up or login by mobile phone and sms code
  /// Usually suggest using AVUser.signUpOrLoginByMobilePhone() function instead of this.
  Future<dynamic> signUpOrLoginByMobilePhone(String mobileNumber, String smsCode) async {
    var args = <String, dynamic>{
      'mobileNumber': mobileNumber,
      'smsCode': smsCode,
    };
    return await _channel.invokeMethod('signUpOrLoginByMobilePhone', args);
  }

  /// Save AVObject.
  /// Usually suggest using AVObject.save() function instead of this.
  Future<String> saveOrCreate(AVObject object) async {
    var args = <String, dynamic>{'avObject': object.toString()};
    var objectString = await _channel.invokeMethod('saveOrCreate', args);
    if (this._logLevel != 0) {
      print("[saveOrCreate function] -> " + objectString);
    }
    return objectString;
  }

  /// Delete object
  /// Usually suggest using AVObject.delete() function instead of this.
  Future<bool> delete(AVObject object) async {
    var args = <String, dynamic>{'avObject': object.toString()};
    return await _channel.invokeMethod('delete', args);
  }

  /// Query object(s)
  /// Usually suggest using AVQuery instead of this.
  Future<dynamic> query(AVQuery query) async {
    var args = <String, dynamic>{'avQuery': query.toString()};
    return await _channel.invokeMethod('query', args);
  }

  /// Using CQL Query object(s)
  /// Usually suggest using AVQuery instead of this.
  Future<dynamic> doCloudQuery(String cql) async {
    var args = <String, String>{'cql': cql};
    return await _channel.invokeMethod('doCloudQuery', args);
  }

  /// Get current User
  Future<String> currentUser() async {
    var currentUserJson = await _channel.invokeMethod('currentUser');
    return currentUserJson;
  }

  /// sign up
  /// Usually suggest using AVUser.signUp() function instead of this.
  Future<dynamic> saveWithAbsoluteLocalPath(AVFile avFile) async {
    var args = <String, dynamic>{'avFile': avFile.toString()};
    var objectString = await _channel.invokeMethod('saveWithAbsoluteLocalPath', args);
    if (this._logLevel != 0) {
      print("[saveWithAbsoluteLocalPath function] -> " + objectString);
    }
    return objectString;
  }

}