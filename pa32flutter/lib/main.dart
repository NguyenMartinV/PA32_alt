// ignore_for_file: unnecessary_import

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: implementation_imports
import 'package:flutter/src/painting/border_radius.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pa32/CareTakerHomePage.dart';
import 'package:pa32/Sign/login.dart'; //LoginPage
import 'package:pa32/Sign/Register.dart'; //RegisterPage
import 'package:pa32/customer/component/addressAlert.dart';
import 'package:pa32/personal/personal.dart';
import 'package:pa32/routes.dart';

import 'package:pa32/cares/cares.dart';
import 'package:pa32/cares/component/careGivers.dart';
import 'package:pa32/cares/component/addGivers.dart';

import 'package:pa32/device/addDevice.dart';
import 'package:pa32/customer/component/nickName.dart';
import 'package:pa32/customer/component/name.dart';
import 'package:pa32/customer/component/address.dart'; //SearchAddress

import 'package:pa32/customer/component/physical.dart';
// import 'package:pa32/servide/TimeSelect.dart';
import 'package:pa32/white/addWhiteList.dart';
import 'package:pa32/white/whiteList.dart';

import 'package:pa32/servide/service.dart'; //ServicePage


import 'package:pa32/about/component/agreement.dart';

import 'package:pa32/about/component/contact.dart';

import 'package:pa32/alerts/alerts.dart';

//password相关
import 'package:pa32/Password/SetPassword.dart';
import 'package:pa32/Password/ForgotPassword.dart';
import 'package:pa32/Password/ForgotPasswordReset.dart';
import 'package:pa32/Password/ResetPassword.dart';

import 'package:pa32/call/emergencyPhone.dart';

import 'package:pa32/customer/customer.dart';

import 'package:pa32/home/myHomeMap.dart';

void main() {
  // runApp(const MyApp());

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    final router = FluroRouter();
    Routes.configureRoutes(router);
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去除debug标签
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: //LoginPage(),
      CareTakerHomePage(),
      // home: EmergencyPhone(),CustomerPage
      // initialRoute: "/EmergencyPhone",
      onGenerateRoute: router.generator,
      builder: EasyLoading.init(),
    );
  }
}
