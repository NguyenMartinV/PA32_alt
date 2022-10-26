import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:date_format/date_format.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:PrimeGPS/config/BaseConfig.dart';
// import 'package:PrimeGPS/utils/SPUtil.dart';

class Utils {
  static List<String> dateFormats = [
    yyyy,
    '-',
    mm,
    '-',
    dd,
    " ",
    HH,
    ':',
    nn,
    ':',
    ss
  ];

  static List<String> dateNoTimeFormats = [yyyy, '-', mm, '-', dd];

  static List<String> dateFormats2 = [yyyy, '-', mm, '-', dd];

  // 计算两个时间之间差了多少天（取ceil值）
  static int daysBetween(DateTime from, DateTime to,
      [bool onlyDiffDays = false]) {
    if (onlyDiffDays) {
      // from = DateTime(from.year, from.month, from.day);
      // to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inSeconds / (24 * 3600)).ceil();
    } else {
      if (from.isAfter(to)) {
        return -999;
      }
      return 999;
    }
  }

  //MD5加密
  static String md5Encode(String str) {
    var content = Utf8Encoder().convert(str);
    var digest = md5.convert(content);
    return digest.toString().toUpperCase();
  }

  //判定是否为数字
  static bool isNumeric(String s) {
    if (isBlank(s)) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  //获取时区偏移量
  static int getTimeOffset() {
    return DateTime.now().timeZoneOffset.inHours;
  }

  //字符串判空
  static bool isBlank(String? str) {
    if (null == str) {
      return true;
    }
    if (str.isEmpty) {
      return true;
    }
    return false;
  }

  //字符串转掩码
  static int strToMask(String src) {
    int result = 0;
    for (int i = 0; i < src.length; i++) {
      if (src.substring(i, i + 1) == "1") {
        result = result | (1 << i);
      }
    }
    return result;
  }

  //获取status的各位置范围的值
  static int getBitValue(int src, int begin, int end) {
    int result = 0;
    for (int i = begin; i <= end; i++) {
      result += 1 << i;
    }
    return (src & result) >> begin;
  }

  //转成2进制添加到16位
  static int getAlertEvent(int src, int begin, int end) {
    String str = "";
    String result = src.toRadixString(2);
    if (result.length < 32) {
      for (int i = result.length; i <= 32; i++) {
        result = "0" + result;
      }
    }
    for (int i = result.length - 1; i > -1; i--) {
      str += result[i] + ""; //将字符转化成为字符串
    }
    return int.parse(str.substring(begin, end));
  }

  //设置2进制某位值为1/0
  static int setAlertEvent(int mask, int pos, bool isChecked) {
    if (isChecked) {
      return bit2One(mask, pos);
    } else {
      return bit2Zero(mask, pos);
    }
  }

  static int bit2One(int a, int i) {
    return a | 1 << i;
  }

  static int bit2Zero(int a, int i) {
    i = 1 << i ^ 0xFFFFFFFF;
    return a & i;
  }

//资源文件转成字节流
  static Future<Uint8List> getBytesFromAsset(
      String path, int width, int height) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  //根据经纬度获取地址信息
  static Future<String> getAddressFromLatLng(lat, lng) async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(lat, lng);
      Placemark place = p[0];
      var _currentAddress =
          "${place.street} ${place.locality}, ${place.administrativeArea},${place.postalCode},${place.isoCountryCode}";
      return _currentAddress;
    } catch (e) {
      return "";
    }
  }

  static double degToRad(num deg) => deg * (math.pi / 180.0);

  static double radToDeg(num rad) => rad * (180.0 / math.pi);

  //计算两个点之间的距离
  static double distance(double latA, double lngA, double latB, double lngB) {
    double earthRadius = 3958.75;
    double latDiff = degToRad((latB - latA).toDouble());
    double lngDiff = degToRad((lngB - lngA).toDouble());
    var a = math.sin(latDiff / 2) * math.sin(latDiff / 2) +
        math.cos(degToRad(latA.toDouble())) *
            math.cos(degToRad(latB.toDouble())) *
            math.sin(lngDiff / 2) *
            math.sin(lngDiff / 2);
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    double distance = earthRadius * c;
    double meterConversion = 1609;
    return distance * meterConversion;
  }

  //比较版本号是否有更新
  static bool isUpdate(String oldVersionStr, String newVersion) {
    int newVersionNum = int.parse(newVersion);
    List oldVersionArr = oldVersionStr.split(".");
    int oldVersionNum = int.parse(oldVersionArr[0] +
        (oldVersionArr[1].padLeft(0)) +
        (oldVersionArr[2].padLeft(0)));
    return newVersionNum > oldVersionNum;
  }

  //获取asset图片的UI.Image对象
  static Future<ui.Image> getImageFromPath(String imagePath) async {
    // Directory tempDir = await getApplicationSupportDirectory();
    // File imageFile = File('${(await getTemporaryDirectory()).path}/$imagePath');
    ByteData bytes = await rootBundle.load(imagePath);
    Uint8List imageBytes = bytes.buffer.asUint8List();

    final Completer<ui.Image> completer = Completer();

    ui.decodeImageFromList(imageBytes, (ui.Image img) {
      return completer.complete(img);
    });

    return completer.future;
  }

  //marker获取
  static Future<BitmapDescriptor> getMarkerIcon(String offset, int num) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    offset = offset == "" ? "0,0" : offset;
    List<String> offsetList = offset.split(",");
    double x = (int.parse(offsetList[0]) / 64).abs();
    double y = (int.parse(offsetList[1]) / 64).abs();
    // Add image
    ui.Image image = await getImageFromPath("assets/images/main_marker.png");
    // Oval for the image
    double width = image.width / 24;
    double height = image.height / 8;
    Rect oval =
        Rect.fromLTWH(width * x + width * num, height * y, width, height);
    canvas.drawImageRect(
        image,
        oval,
        Rect.fromLTWH(0, 0, 64, 64),
        Paint()
          ..imageFilter =
              ui.ImageFilter.matrix(Matrix4.diagonal3Values(2, 2, 0).storage));

    final ui.Image markerAsImage =
        await pictureRecorder.endRecording().toImage(128, 128);

    // Convert image to bytes
    final ByteData? byteData =
        await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }

  static Future<ImageProvider> getMarkerIcon2(String offset, int num) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    offset = offset == "" ? "0,0" : offset;
    List<String> offsetList = offset.split(",");
    double x = (int.parse(offsetList[0]) / 64).abs();
    double y = (int.parse(offsetList[1]) / 64).abs();
    // Add image
    ui.Image image = await getImageFromPath("assets/images/main_marker.png");
    // Image image2 = Image.asset("assets/images/main_marker.png");
    // Oval for the image
    double width = image.width / 24;
    double height = image.height / 8;
    Rect oval = Rect.fromLTWH(
        width * x + width * num + 5, height * y + 5, width - 10, height - 10);
    canvas.drawImageRect(image, oval, Rect.fromLTWH(0, 0, 54, 54), Paint());

    final ui.Image markerAsImage =
        await pictureRecorder.endRecording().toImage(54, 54);
    // Convert image to bytes
    LoadImage li = LoadImage(markerAsImage);
    // final ByteData? byteData = await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    // final Uint8List uint8List = byteData!.buffer.asUint8List();
    return li;
  }

  //获取方位角图片
  static Widget locationAzm(int amz) {
    Widget amzImg = Container(width: 0, height: 0);
    if (amz == 0 || amz == 360) {
      amzImg = Image.asset("assets/images/north.png");
    } else if (amz == 90) {
      amzImg = Image.asset("assets/images/east.png");
    } else if (amz == 180) {
      amzImg = Image.asset("assets/images/south.png");
    } else if (amz == 270) {
      amzImg = Image.asset("assets/images/west.png");
    } else if (amz > 0 && amz < 90) {
      amzImg = Image.asset("assets/images/north_east.png");
    } else if (amz > 90 && amz < 180) {
      amzImg = Image.asset("assets/images/south_east.png");
    } else if (amz > 180 && amz < 270) {
      amzImg = Image.asset("assets/images/south_west.png");
    } else if (amz > 270 && amz < 360) {
      amzImg = Image.asset("assets/images/north_west.png");
    }
    return amzImg;
  }

  //获取告警类型图片图片
  static String alarmTypePathStr(int typeId) {
    String pathStr = "";
    switch (typeId) {
      case 0:
        pathStr = "assets/images/overspeed";
        break;
      case 3:
        pathStr = "assets/images/break";
        break;
      case 6:
        pathStr = "assets/images/leave_fence";
        break;
      case 7:
        pathStr = "assets/images/enter_fence";
        break;
      case 10:
        pathStr = "assets/images/lowbat";
        break;
      case 4: // remove device
        pathStr = "assets/images/remove";
        break;
      case 11:
        pathStr = "assets/images/sos";
        break;
      case 12:
        pathStr = "assets/images/start";
        break;
      case 13:
        pathStr = "assets/images/end";
        break;
      case 14: // on charge
        pathStr = "assets/images/charging";
        break;
      case 15: // off charge
        pathStr = "assets/images/charged";
        break;
      case 16:
        pathStr = "assets/images/power_on";
        break;
      case 17:
        pathStr = "assets/images/power_off";
        break;
      case 18:
        pathStr = "assets/images/ignite";
        break;
      case 19: // inigition off
        pathStr = "assets/images/ignite_off";
        break;
      case 20: // low trmputure
        pathStr = "assets/images/low_temp";
        break;
      case 2:
        pathStr = "assets/images/high_temp";
        break;
      case 21: // High Humidity
        pathStr = "assets/images/high_hmd";
        break;
      case 22: // Low Humidity
        pathStr = "assets/images/low_hmd";
        break;
      default:
    }
    return pathStr;
  }

  //获取定位信息
  static Future<LatLng> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    var lastKnownPosition = await Geolocator.getCurrentPosition();
    return LatLng(lastKnownPosition.latitude, lastKnownPosition.longitude);
  }

  //隐藏信用卡号并且每四位增加空格
  static String hideCardNumberWithBlank(String cardNumber) {
    if (cardNumber.length <= 4) {
      return cardNumber;
    }
    String newStr = "";
    for (int i = 0; i < cardNumber.length; i++) {
      if (i < cardNumber.length - 4) {
        newStr += "*";
      } else {
        newStr += cardNumber[i];
      }
      if ((i + 1) % 4 == 0) {
        newStr += " ";
      }
    }
    return newStr;
  }

  static PickerStyle pickerStyle(String title) {
    return PickerStyle(
        textSize: 18,
        // textColor: ThemeColors.textColor,
        title: Center(
            child:Text(
              title,
              style: TextStyle(
                fontSize: 17
              ),
            )
        ),
        commitButton: Container(
          margin: EdgeInsets.only(right: 20),
          child: Center(
            child: Text("Confirm", style: TextStyle(fontSize:17,color: Colors.blue)),
          ),
        ),
        cancelButton: Container(
          margin: EdgeInsets.only(left: 20),
          child: Center(
            child: Text("Cancel", style: TextStyle(fontSize:17,color: Color(0xff222222))),
          ),
        )
    );
  }
}

class LoadImage extends ImageProvider<LoadImage> {
  const LoadImage(this.image, {this.scale = 1.0})
      : assert(image != null),
        assert(scale != null);

  final ui.Image image;
  final double scale;

  @override
  ImageStreamCompleter load(LoadImage key, decode) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key),
      scale: key.scale,
    );
  }

  Future<ui.Codec> _loadAsync(LoadImage key) async {
    assert(key == this);
    //image转ByteData
    final a = await image.toByteData(format: ui.ImageByteFormat.png);
    var codec = await PaintingBinding.instance!
        .instantiateImageCodec(a!.buffer.asUint8List());
    return codec;
  }

  @override
  Future<LoadImage> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<LoadImage>(this);
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final LoadImage typedOther = other;
    return image == typedOther.image && scale == typedOther.scale;
  }

  @override
  int get hashCode => hashValues(image.hashCode, scale);

  @override
  String toString() =>
      '$runtimeType(${describeIdentity(image)}, scale: $scale)';
}
