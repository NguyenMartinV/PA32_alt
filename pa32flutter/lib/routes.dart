import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:pa32/Sign/Register.dart'; //RegisterPage
import 'package:pa32/Sign/login.dart'; //LoginPage
import 'package:pa32/bluetooth/bluetoothDevice.dart';
import 'package:pa32/cares/cares.dart';
import 'package:pa32/customer/component/addressAlert.dart';
import 'package:pa32/customer/component/customerAddress.dart';
import 'package:pa32/customer/component/gender.dart';

//home相关路由
import 'package:pa32/home/myHomeMap.dart';

//密码相关路由入口
import 'package:pa32/Password/SetPassword.dart';
import 'package:pa32/Password/ForgotPassword.dart';
import 'package:pa32/Password/ForgotPasswordReset.dart';
import 'package:pa32/Password/ResetPassword.dart'; //ResetPassword

import 'package:pa32/personal/personal.dart'; //PersonalPage
import 'package:pa32/alerts/alerts.dart';
import 'package:pa32/servide/TimeSelect.dart';
import 'package:pa32/servide/service.dart';
import 'package:pa32/call/emergencyPhone.dart';

//About相关路由入口
import 'package:pa32/about/component/privacy.dart';
import 'package:pa32/about/component/agreement.dart';
import 'package:pa32/about/component/contact.dart';

//device相关入口
import 'package:pa32/device/addDevice.dart';
import 'package:pa32/white/whiteList.dart';
import 'package:pa32/white/addWhiteList.dart';
import 'package:pa32/cares/component/careGivers.dart';
import 'package:pa32/cares/component/addGivers.dart';
import 'package:pa32/device/scan.dart';
//customer相关入口
import 'package:pa32/customer/customer.dart';
import 'package:pa32/customer/component/nickName.dart';
import 'package:pa32/customer/component/name.dart';
import 'package:pa32/customer/component/email.dart';
import 'package:pa32/customer/component/physical.dart';
import 'package:pa32/customer/component/address.dart';

import 'about/about_page.dart';
import 'home/bottom_nav.dart';

class Routes {
  //home页面
  static const String home = "/MyHomeMap";
  static const String bottomNav = "/BottomNavi";
  //注册
  static const String register = "/RegisterPage";
  //登录
  static const String login = "/LoginPage";
  //cares页面
  static const String cares = "/CaresPage";

  //第一次注册设置密码页面
  static const String setPassword = "/SetPassword";
  //忘记密码 forgot password
  static const String forgotPassword = "/ForgotPassword";
  //忘记密码 forgot password
  static const String forgotPasswordReset = "/ForgotPasswordReset";
  //EmergencyPhone
  static const String emergencyCall = "/EmergencyPhone";

  //个人中心Personal
  static const String personalPage = "/PersonalPage";
  //alertsPage
  static const String alertsPage = "/AlertsPage";
  //resetPassword
  static const String resetPassword = "/ResetPassword";
  //ServicePage
  static const String service = "/ServicePage";
  static const String devicesPage = "/DevicesPage";

  //About相关路由入口
  static const String about = "/AboutPage";
  static const String privacy = "/PrivacyPage";
  static const String agreement = "/AgreementPage";
  static const String contactUs = "/ContactUsPage";

  //device相关路由入口
  static const String device = "/addDevicePage";
  static const String whiteList = "/WhiteList";
  static const String addWhiteList = "/AddWhiteList";
  static const String careGivers = "/CareGivers";
  static const String addGivers = "/AddGiverPage";
  //customer相关路由入口
  static const String customer = "/CustomerPage";
  static const String changeName = "/nickName";
  static const String name = "/SetName";
  static const String email = "/CustomerEmail";
  static const String physical = "/PhysicalPage";
  static const String address = "/SearchAddress"; //SearchAddress
  static const String cusAddress = "/customerAddress"; //customerAddress
  static const String Gender = "/CustomerGender"; //CustomerGender

  //时间选择相关路由入口
  static const String DatePicke = "/DatePickerPubDemo"; //DatePickerPubDemo
  //定位信息展示路由入口
  static const String addressAlert = "/addressAlertPage";

  //扫描添加设备
  static const String scanQrcode = "/scanQrcode";
  // 扫描添加设备    页
  static final Handler _scanQrcodeHandler = Handler(
      // 设备添加
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const ScanPage();
  });


  static final Handler _devicesPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return DevicesPage();
  });



// 时间选择页
  static final Handler _DatePickeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return DatePickerPubDemo();
  });

  // home页
  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MyHomeMap();
  });
  static final Handler _botHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return BottomNavi();
      });
  // 注册页
  static final Handler _registerHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return RegisterPage();
  });

  // 登录页
  static final Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return LoginPage();
  });

  static final Handler _addressAlertHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return addressAlertPage();
  });

  //cares页面
  static final Handler _caresHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return CaresPage();
  });
  // 第一次注册设置密码页面
  static final Handler _setPasswordHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return SetPassword();
  });
  //忘记密码 forgot password
  static final Handler _forgotPasswordHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ForgotPassword();
  });
  //忘记密码重新设置 forgot password reset
  static final Handler _forgotPasswordResetHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ForgotPasswordReset();
  });
  //忘记密码重新设置 forgot password reset
  static final Handler _personalPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return Personal();
  });
  //修改密码 ResetPassword
  static final Handler _resetPasswordHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ResetPassword();
  });
  //Activate Wecare Service
  static final Handler _serviceHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ServicePage();
  });

  //AlertsPage
  static final Handler _alertsPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return AlertsPage();
  });
  //AlertsPage
  static final Handler _emergencyCallHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return EmergencyPhone();
  });

  //about
  static final Handler _AboutPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return AboutPage();
  });
  //about - privacy
  static final Handler _privacyHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return PrivacyPage();
  });
  //about - agreement
  static final Handler _agreementHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return AgreementPage();
  });
  //about - contact
  static final Handler _contactUsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ContactUsPage();
  });

  //device
  static final Handler _deciveHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return addDevicePage();
  });
  //whiteList
  static final Handler _whiteListHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return WhiteList();
  });
  //addWhiteList
  static final Handler _addWhiteListHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return AddWhiteList();
  });
  //CareGivers
  static final Handler _careGiversHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return CareGivers();
  });
  //addGivers
  static final Handler _addGiversHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return AddGiverPage();
  });

  //customer
  static final Handler _customerHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return CustomerPage();
  });
  //customer - nickName
  static final Handler _changeNameHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return nickName();
  });
  //customer - name
  static final Handler _nameHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return SetName();
  });
  //customer - email
  static final Handler _emailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return CustomerEmail();
  });
  //customer - physical
  static final Handler _physicalHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return PhysicalPage();
  });
  //customer - address
  static final Handler _addressHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return SearchAddress();
  });
  //customer - customerAddress
  static final Handler _cusAddressHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return customerAddress();
  });
  //customer - gender
  static final Handler _genderHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return CustomerGender();
  });

  // 编写路由处理函数
  static void configureRoutes(FluroRouter router) {
    // 时间选择页
    router.define(DatePicke, handler: _DatePickeHandler);
    router.define(bottomNav, handler: _botHandler);

    router.define(devicesPage, handler: _devicesPageHandler);
    // 首页
    router.define(home, handler: _homeHandler);
    // 注册
    router.define(register, handler: _registerHandler);
    //登录
    router.define(login, handler: _loginHandler);
    router.define(addressAlert, handler: _addressAlertHandler);
    //cares页面
    router.define(cares, handler: _caresHandler);
    //设置密码
    router.define(setPassword, handler: _setPasswordHandler);
    //忘记密码
    router.define(forgotPassword, handler: _forgotPasswordHandler);
    //忘记密码-reset
    router.define(forgotPasswordReset, handler: _forgotPasswordResetHandler);
    //修改密码
    router.define(resetPassword, handler: _resetPasswordHandler);
    //personal页面
    router.define(personalPage, handler: _personalPageHandler);
    //AlertsPage页面
    router.define(alertsPage, handler: _alertsPageHandler);
    //EmergencyPhone页面
    router.define(emergencyCall, handler: _emergencyCallHandler);
    //about页面
    router.define(about, handler: _AboutPageHandler);
    //about - privacy页面
    router.define(privacy, handler: _privacyHandler);
    //about - agreement页面
    router.define(agreement, handler: _agreementHandler);
    //about - contact页面
    router.define(contactUs, handler: _contactUsHandler);
    //device页面
    router.define(device, handler: _deciveHandler);
    //device - whiteList页面
    router.define(whiteList, handler: _whiteListHandler);
    //device - addWhiteList页面
    router.define(addWhiteList, handler: _addWhiteListHandler);
    //device - careGivers页面
    router.define(careGivers, handler: _careGiversHandler);
    //device - careGivers页面
    router.define(addGivers, handler: _addGiversHandler);
    //customer页面
    router.define(customer, handler: _customerHandler);
    //customer - changeName页面
    router.define(changeName, handler: _changeNameHandler);
    //customer - name页面
    router.define(name, handler: _nameHandler);
    //customer - email页面
    router.define(email, handler: _emailHandler);
    //customer - physical页面
    router.define(physical, handler: _physicalHandler);
    //customer - address页面
    router.define(address, handler: _addressHandler);
    //customer - customerAddress页面
    router.define(cusAddress, handler: _cusAddressHandler);
    //customer - address页面
    router.define(Gender, handler: _genderHandler);
    //home - service页面
    router.define(service, handler: _serviceHandler);
    //扫描添加设备
    router.define(scanQrcode, handler: _scanQrcodeHandler);
  }
}
