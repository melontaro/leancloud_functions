package com.touchafflatus.leancloud_functions;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import java.io.FileNotFoundException;

import cn.leancloud.AVFile;
import cn.leancloud.callback.ProgressCallback;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;

class LeancloudFile {

    void saveWithAbsoluteLocalPath(MethodCall call, final MethodChannel.Result result) {
        JSONObject avQueryJson = LeancloudArgsConverter.getAVFileJsonObject(call, result);
        assert avQueryJson != null;
        String fieldsString = avQueryJson.getString("fields");
        JSONObject fieldsJson = JSON.parseObject(fieldsString);


        String fileName = fieldsJson.getString("filename");//"avatar.jpg"
        String filePath = fieldsJson.getString("filepath");//"/tmp/avatar.jpg"
        final AVFile avFile;
        try {
            avFile = AVFile.withAbsoluteLocalPath(fileName, filePath);

            avFile.saveInBackground(new ProgressCallback() {
                @Override
                public void done(Integer percentDone) {

                }
            });


            avFile.saveInBackground().subscribe((new Observer<AVFile>() {

                @Override
                public void onSubscribe(Disposable d) {

                }

                @Override
                public void onNext(AVFile file) {

                    result.success(file.getObjectId());
                    // System.out.println("文件保存完成。objectId：" + file.getObjectId());
                }

                @Override
                public void onError(Throwable throwable) {
                    result.error("leancloud-error", Util.getErrorInfo(throwable).toJSONString(), null);
                    // 保存失败，可能是文件无法被读取，或者上传过程中出现问题
                }

                @Override
                public void onComplete() {
                }
            }));
        } catch (FileNotFoundException e) {
            result.error("leancloud-error", e.toString(), null);
        }


    }
}
