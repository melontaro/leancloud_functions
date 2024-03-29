package com.touchafflatus.leancloud_functions;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

class LeancloudArgsConverter {
    static JSONObject getAVQueryJsonObject(MethodCall call, MethodChannel.Result result) {
        String key = "avQuery";
        Object arg = call.argument(key);
        if (arg == null) {
            result.error("missing-arg", "Arg '" + key + "' can't be null, set empty value. PLEASE FIX IT!", null);
            return null;
        } else {
            return JSON.parseObject(arg.toString());
        }
    }

    static JSONObject getAVUserJsonObject(MethodCall call, MethodChannel.Result result) {
        String key = "avUser";
        Object arg = call.argument(key);
        if (arg == null) {
            result.error("missing-arg", "Arg '" + key + "' can't be null, set empty value. PLEASE FIX IT!", null);
            return null;
        } else {
            return JSON.parseObject(arg.toString());
        }
    }

    static JSONObject getAVFileJsonObject(MethodCall call, MethodChannel.Result result) {
        String key = "avFile";
        Object arg = call.argument(key);
        if (arg == null) {
            result.error("missing-arg", "Arg '" + key + "' can't be null, set empty value. PLEASE FIX IT!", null);
            return null;
        } else {
            return JSON.parseObject(arg.toString());
        }
    }

    static String getStringValue(MethodCall call, MethodChannel.Result result, String key) {
        Object arg = call.argument(key);
        if (arg == null) {
            result.error("missing-arg", "Arg '" + key + "' can't be null, set empty value. PLEASE FIX IT!", null);
            return "";
        } else {
            return arg.toString();
        }
    }

    static int getIntValue(MethodCall call, MethodChannel.Result result, String key) {
        Object arg = call.argument(key);
        if (arg == null) {
            result.error("missing-arg", "Arg '" + key + "' can't be null, set 0 value. PLEASE FIX IT!", null);
            return 0;
        } else {
            return (int) arg;
        }
    }
}

