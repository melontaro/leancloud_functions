package com.touchafflatus.leancloud_functions;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import cn.leancloud.AVUser;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;

class LeancloudUser {
    void getCurrentUser(MethodCall call, final MethodChannel.Result result) {
        AVUser currentUser = AVUser.getCurrentUser();
        result.success(currentUser.toJSONString());
    }

    void signUp(MethodCall call, final MethodChannel.Result result) {
        JSONObject avQueryJson = LeancloudArgsConverter.getAVUserJsonObject(call, result);
        assert avQueryJson != null;
        String fieldsString = avQueryJson.getString("fields");
        JSONObject fieldsJson = JSON.parseObject(fieldsString);
        AVUser user = new AVUser();
        user.setUsername(fieldsJson.getString("username"));
        user.setPassword(fieldsJson.getString("password"));
        if (fieldsJson.containsKey("email")) {
            user.setEmail(fieldsJson.getString("email"));
        }
        user.signUpInBackground().subscribe(new Observer<AVUser>() {

            @Override
            public void onSubscribe(Disposable disposable) {
            }

            @Override
            public void onNext(AVUser avUser) {
                result.success(avUser.toJSONObject().toJSONString());
            }

            @Override
            public void onError(Throwable throwable) {
                result.error("leancloud-error", Util.getErrorInfo(throwable).toJSONString(), null);
            }

            @Override
            public void onComplete() {
            }
        });
    }

    void login(MethodCall call, final MethodChannel.Result result) {
        JSONObject avQueryJson = LeancloudArgsConverter.getAVUserJsonObject(call, result);
        assert avQueryJson != null;
        String fieldsString = avQueryJson.getString("fields");
        JSONObject fieldsJson = JSON.parseObject(fieldsString);
        AVUser.logIn(fieldsJson.getString("username"), fieldsJson.getString("password")).subscribe(new Observer<AVUser>() {
            @Override
            public void onSubscribe(Disposable disposable) {
            }

            @Override
            public void onNext(AVUser avUser) {
                result.success(avUser.toJSONObject().toJSONString());
            }

            @Override
            public void onError(Throwable throwable) {

                result.error("leancloud-error", Util.getErrorInfo(throwable).toJSONString(), null);
            }

            @Override
            public void onComplete() {
            }

        });
    }

}
