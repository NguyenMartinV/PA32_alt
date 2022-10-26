import 'package:flutter/cupertino.dart';

class BaseConfig {
  // static const String API_HOST = "http://192.168.2.136:9000/dc/service/"; //阳涵测试地址
  // static const String API_HOST = "http://192.168.2.141:8080/dc/service/"; //本机测试地址
  // static const String API_HOST = "http://192.168.2.132:8080/dc/service/"; //东东地址
  // static const String API_HOST = "http://192.168.2.152:8080/dc/service/"; //魏博昭测试地址
       static const String API_HOST = "https://iot.matracker.com.cn/dc/service/";  //测试服务器
//        static const String API_HOST = "http://131.153.143.226/dc/service/";  //美国正式 打包发双数版本，测试单数版本
//           static const String API_HOST = "https://www.live4iot.com/dc/service/";
//   static const String API_HOST = "http://192.168.2.138:8080/dc/service/"; //陈斌地址
  static bool isDebug = true; //是否是调试模式
  static String platformKey = "AB698318695CA8146189E88B1F26EFE5"; //平台key
  static String newPlatformKey = "66159C88637FAD4014EE2E0547B7FD22A"; //平台key-v2
  static int clientType = 2; //终端类型 0-web 1-ios 2-android
  static String appVersion = "1.0.0"; //app版本号
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey(); //全局跳转key
  // 设备图标偏移信息
  static List iconOffsetMatrix = [
    {'x': 0, 'y': 0},
    {'x': -256, 'y': 0},
    {'x': -512, 'y': 0},
    {'x': -768, 'y': 0},
    {'x': -1024, 'y': 0},
    {'x': -1280, 'y': 0},
    {'x': 0, 'y': -64},
    {'x': -256, 'y': -64},
    {'x': -512, 'y': -64},
    {'x': -768, 'y': -64},
    {'x': -1024, 'y': -64},
    {'x': -1280, 'y': -64},
    {'x': 0, 'y': -128},
    {'x': -256, 'y': -128},
    {'x': -512, 'y': -128},
    {'x': -768, 'y': -128},
    {'x': -1024, 'y': -128},
    {'x': -1280, 'y': -128},
    {'x': 0, 'y': -192},
    {'x': -256, 'y': -192},
    {'x': -512, 'y': -192},
    {'x': -768, 'y': -192},
    {'x': -1024, 'y': -192},
    {'x': -1280, 'y': -192},
    {'x': 0, 'y': -256},
    {'x': -256, 'y': -256},
    {'x': -512, 'y': -256},
    {'x': -768, 'y': -256},
    {'x': -1024, 'y': -256},
    {'x': -1280, 'y': -256},
    {'x': 0, 'y': -320},
    {'x': -256, 'y': -320},
    {'x': -512, 'y': -320},
    {'x': -768, 'y': -320},
    {'x': -1024, 'y': -320},
    {'x': -1280, 'y': -320},
    {'x': 0, 'y': -384},
    {'x': -256, 'y': -384},
    {'x': -512, 'y': -384},
    {'x': -768, 'y': -384},
    {'x': -1024, 'y': -384},
    {'x': -1280, 'y': -384},
    {'x': 0, 'y': -448},
    {'x': -256, 'y': -448},
    {'x': -512, 'y': -448}
  ];
}
