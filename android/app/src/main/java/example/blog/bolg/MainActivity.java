package example.blog.bolg;

import android.os.Build;
import android.widget.Toast;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        ///안드로이드와 플러터 간의 메서드 호출을 처리합니다. 메서드 호출이 발생하면 handler에서 해당 메서드를 처리하고 결과를 반환합니다.
        final MethodChannel channel = new MethodChannel (flutterEngine.getDartExecutor (), "example.blog.bolg/methodChannel");
        channel.setMethodCallHandler (handler);
    }
    private MethodChannel.MethodCallHandler handler = (methodCall, result) -> {

        if (methodCall.method.equals ("getPlatformVersion")) {
            result.success ("Android Version: " + Build.VERSION.RELEASE);
        } else if (methodCall.method.equals ("showMyToast")) {
            String msg = "안드로이드기능";
            if (methodCall.argument ("msg") != null) {
                msg = methodCall.argument ("msg").toString ();
            }
            Toast myToast = Toast.makeText (this.getApplicationContext (), msg, Toast.LENGTH_SHORT);
            myToast.show ();
            result.success ("show!토스트!: ");
        } else {
            /// 이슈 노트 :
            /// Unhandled Exception: MissingPluginException(No implementation found for method showMyToast on channel com.xten.offlinepaking)
            /// result.notImplemented (); 메소드 실행 후 다른 동작을 하게 되면 발생함
            result.notImplemented ();
        }
    };

}



