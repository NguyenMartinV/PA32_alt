import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pa32/http/ResultCode.dart';
import 'package:pa32/http/TokenInterceptor.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/common_loading.dart';

class DioManager {
  // 单例模式
  static final DioManager _instance = DioManager._internal();
  factory DioManager() => _instance;
  DioManager._internal() {
    init();
  }

  Dio dio = Dio();

  // 初始化请求配置
  init() {
    dio.options.baseUrl = BaseConfig.API_HOST;
    dio.options.headers = {
      "content-type": 'application/x-www-form-urlencoded',
    };
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 20000;

    dio.interceptors.add(LogInterceptor(
        responseBody: !BaseConfig.isDebug,
        requestBody: BaseConfig.isDebug)); //是否开启请求日志
    dio.interceptors.add(TokenInterceptor(dio));
  }

  //get请求
  get(String url, Map params, Function successCallBack,
      Function errorCallBack) async {
    _requstHttp(url, successCallBack, 'get', params, errorCallBack);
  }

  //post请求
  post(String url, params, Function successCallBack,
      Function errorCallBack) async {
    _requstHttp(url, successCallBack, "post", params, errorCallBack);
  }

  //upload请求
  upload(String url, params, Function successCallBack,
      Function errorCallBack) async {
    _requstHttp(url, successCallBack, "upload", params, errorCallBack);
  }

  _requstHttp(String url, Function successCallBack,
      [String? method, params, Function? errorCallBack]) async {
    Response? response;
    bool withLoading;
    if (method == 'upload') {
      withLoading = false;
      dio.options.headers = {
        "content-type": 'multipart/form-data',
      };
    } else {
      withLoading = params["withLoading"] ?? true;
      dio.options.headers = {
        "content-type": 'application/x-www-form-urlencoded',
      };
    }
    // bool withLoading = params["withLoading"] ?? true;
    if (withLoading) {
      CommonLoading.show();
    }
    try {
      if (method == 'get') {
        if (params != null && params.length > 0) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
        if (withLoading) {
          CommonLoading.dismiss();
        }
      } else if (method == 'post' || method == 'upload') {
        if (params != null && params.length > 0) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
        if (withLoading) {
          CommonLoading.dismiss();
        }
      }
    } on DioError catch (error) {
      if (withLoading) {
        CommonLoading.dismiss();
      }
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response!;
      } else {
        errorResponse =
            Response(statusCode: 666, requestOptions: error.requestOptions);
      }
      // 请求超时
      if (error.type == DioErrorType.connectTimeout) {
        print("请求超时");
        errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType) {
        errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
      }

      // debug模式才打印
      if (BaseConfig.isDebug) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + dio.options.headers.toString());
        print('method: ' + dio.options.method);
      }
      _error(errorCallBack!, error.message);
      return '';
    }
    // debug模式打印相关数据
    if (BaseConfig.isDebug) {
      print('请求url: ' + url);
      print('请求头: ' + dio.options.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }
    Map<String, dynamic>? dataMap;
    if (response!.data is String) {
      dataMap = json.decode(response.data);
    } else if (response.data != null) {
      dataMap = response.data;
    }
    if (dataMap == null || dataMap['state'] == 0) {
      _error(
          errorCallBack!,
          '错误码：' +
              dataMap!['errorCode'].toString() +
              '，' +
              response.data.toString());
    } else if (successCallBack != null) {
      successCallBack(dataMap);
    }
  }

  _error(Function errorCallBack, String error) {
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }
}
