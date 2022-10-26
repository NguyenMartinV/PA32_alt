import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/DataUtils.dart';
import 'package:pa32/utils/SPUtil.dart';

// import 'package:pa32/http/bean/login_entity.dart';

//自定义拦截器
class TokenInterceptor extends Interceptor {
  Dio _dio;
  TokenInterceptor(this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await SPUtil.getToken();
    if (!Utils.isBlank(token)) {
      options.headers["Authorization"] = "Bearer " + token!;
      // print("======$token");
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    try {
      Map<String, dynamic> dataMap = response.data;
      if (dataMap["code"] == 2) {
        //token过期自动调用登录接口
        SPUtil.clearToken();
        String token = await _loginGetToken();
        RequestOptions request = response.requestOptions;
        request.headers["Authorization"] = "Bearer " + token;
        try {
          Dio _dio = Dio();
          _dio.options.baseUrl = BaseConfig.API_HOST;
          Response response = await _dio.request(request.path,
              data: request.data,
              options: Options(
                  method: request.method,
                  headers: request.headers,
                  contentType: 'application/x-www-form-urlencoded'),
              queryParameters: request.queryParameters,
              cancelToken: request.cancelToken,
              onReceiveProgress: request.onReceiveProgress);
          handler.resolve(response);
        } on DioError catch (e) {
          handler.next(response);
          super.onResponse(response, handler);
        }
      } else {
        super.onResponse(response, handler);
      }
    } catch (e) {
      super.onResponse(response, handler);
    }
  }

  Future<String> _loginGetToken() async {
    String token = "";
    try {
      String? phone = await SPUtil.get(SPUtil.usernameKey);
      String? pwd = await SPUtil.get(SPUtil.pwdKey);
      Dio tokenDio = Dio();
      /* var response =
          await tokenDio.post(BaseConfig.API_HOST + "sys/login", data: {
        "userName": userName,
        "pwd": Utils.md5Encode(pwd!),
        "timeZoneOffset": Utils.getTimeOffset(),
        "verifyType": 1,
        "appToken": "d1-RUjhRTsuE",
        "loginType": 2,
        "loginSource": 2
      }); */
      var response =
          await tokenDio.post(BaseConfig.API_HOST + "pa32/login", data: {
        "phone": phone,
        "password": pwd,
        "timeZoneOffset": Utils.getTimeOffset(),
        "appToken": "d1-RUjhRTsuE",
        "loginType": 2,
        "platformSecretKey": BaseConfig.newPlatformKey,
      });
      Map<String, dynamic> dataMap = json.decode(response.data);
      /* if (dataMap["code"] == 0) {
        LoginEntity bean = LoginEntity.fromJson(dataMap);
        SPUtil.save(SPUtil.tokenKey, bean.data!.token!);
        token = bean.data!.token!;
      } */
    } catch (e) {
      print("back to login page");
      BaseConfig.navigatorKey.currentState
          ?.pushNamedAndRemoveUntil("/", (route) => route == null);
    }
    return token;
  }
}
