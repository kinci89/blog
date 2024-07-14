import 'package:flutter/services.dart';

class MethodChannelUtil {
  static MethodChannel _methodChannel = MethodChannel('example.blog.bolg/methodChannel');


  /// 예제 소스1 )
  /// 해당 기기의 android 버전가져 오는 기능
  static void getPlatformVersion() async {
    var result = await _methodChannel.invokeMethod('getPlatformVersion');
    print(result);
  }

  /// 예제 소스2 )
  /// 안드로이드 토스트 메세지 전달하여 표출
    static void showMyToast({required String msg}) async{
      var result = await _methodChannel.invokeMethod('showMyToast', <String, dynamic>{'msg': msg});
      print(result);

    }
  /// 예제 소스2 )
  /// 실제하지 않는 메소드를 호출 할경우
  static void wrongMethod() async{
    var result = await _methodChannel.invokeMethod('sdfsdfkjh');
    print(result);
  }

}