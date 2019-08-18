package com.touchafflatus.leancloud_functions;

import com.alibaba.fastjson.JSONObject;

import cn.leancloud.AVException;

class Util {
    public static JSONObject getErrorInfo(Throwable throwable) {
        AVException avException = new AVException(throwable);
        int code = avException.getCode();
        JSONObject errorCode = new JSONObject();
        errorCode.put("code", code);
        errorCode.put("message", throwable.getMessage());
        return errorCode;
    }
}
