import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/bean/country_code_entity.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'dart:async';

class RegisterPage extends StatefulWidget {
  RegisterPage({
    Key? key,
  }) : super(key: key);
  bool isRemenber = false;
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late Timer _timer;
  int _timeCount = 60;
  String _codeText = "Send";
  bool sendFlag = true;
  bool isAgreee = false;
  String countryCodeText = "1";
  String countryCode = '';
  List myCountryList = [];
  var registerPhone = TextEditingController();
  bool IconFlag = false;

  //参数传递相关
  String myPhone = '';
  String myYzm = '';
  // var phone = TextEditingController();
  //验证验证码
  _register(String type, String code, String account,
      String platformSecretKey) async {
    DioManager().post(
      BaseConfig.API_HOST + "common/checkVerifyCode",
      {
        "type": type,
        "code": code,
        "account": account,
        "platformSecretKey": platformSecretKey,
      },
      (success) {
        if (success['code'] == 0) {
          Navigator.pushNamed(context, "/SetPassword", arguments: {
            "account": countryCodeText + '-' + account,
            "myYzm": myYzm
          });
        } else {
          CommonToast.showToast(success['msg']);
        }
      },
      (error) {
        CommonToast.showToast(error['msg']);
      },
    );
  }

  //发送验证码
  _verificationCode(
    String opType,
    String sendType,
    String target,
    String platformSecretKey,
  ) async {
    DioManager().post(
      BaseConfig.API_HOST + "common/sendVerifyCode",
      {
        "opType": opType,
        "sendType": sendType,
        "target": target,
        "platformSecretKey": platformSecretKey,
      },
      (success) {
        // print(success);
        if (success['code'] == 0) {
          CommonToast.showToast('Verification code send successfully');
          _startTimer();
          setState(() {
            myPhone = target;
            /* if (_timeCount <= 1) {
              sendFlag = true;
            } else {
              sendFlag = false;
            } */
          });
        }
      },
      (error) {
        print("send失败:" + error);
      },
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => {
        setState(() {
          if (_timeCount <= 1) {
            _codeText = 'Send';
            _timer.cancel();
            _timeCount = 60;
          } else {
            _timeCount -= 1;
            _codeText = "${_timeCount}s";
          }
        })
      },
    );
  }

  @override
  dispose() {
    try {
      if (_timer != null) {
        _timer.cancel();
      }
    } catch (e) {}
    super.dispose();
  }

  //获取区号
  _countryCodeList(String platformSecretKey) async {
    DioManager().post(
      BaseConfig.API_HOST + "general/countryCodeList",
      {
        "platformSecretKey": platformSecretKey,
      },
      (success) {
        CountryCodeEntity bean = CountryCodeEntity.fromJson(success);

        setState(() {
          myCountryList.addAll(bean.data as List);
        });
        // print(myCountryList[0].countryCode);
      },
      (error) {},
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countryCodeList(
      "F0962F2444C856E4255D98195548CC82",
    ); //获取区号
  }

  @override
  Widget build(BuildContext context) {
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    if(bottom > 0){
      bottom = 20;
    }
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(375, 667),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xffF2F2F2),
      appBar: PreferredSize( //外面套一个PreferredSize
          preferredSize: Size.fromHeight(20.0), // 设置高度
          child: AppBar( //这个是原本的AppBar内容
            backgroundColor: Colors.white,
            leading: Text(""),
            elevation: 0,
          )
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // height: MediaQuery.of(context).size.height - 260,
              margin: EdgeInsets.only(top: 40.h - bottom,left: 25.w,right:25.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 36.h-bottom, bottom: 35.h-bottom),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 45.h,
                        margin: EdgeInsets.only(left:37.w,right: 37.w),
                        padding: EdgeInsets.only(left: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1.0, color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/user.png",
                              width: 18.5.r,
                              height: 18.5.r,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            GestureDetector(
                              child: Container(
                                width: 62.w,
                                // color: Colors.red,
                                child: Row(
                                  children: [
                                    Text(
                                      "+$countryCodeText",
                                      style: TextStyle(
                                        color:Color(0xff222222),
                                        fontSize: 16.sp
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      size: 25,
                                      color:Color(0xff222222),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                // print("object");
                                setState(() {
                                  IconFlag = !IconFlag;
                                });
                              },
                            ),
                            Expanded(
                              child: TextField(
                                controller: registerPhone,
                                decoration: InputDecoration(
                                    hintText: "Phone",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontSize: 16.sp,
                                    )
                                ),
                              )
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 45.h,
                        margin: EdgeInsets.only(top:15.h,left:37.w,right: 37.w),
                        padding: EdgeInsets.only(left: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xffA0A0A0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/verification.png",
                              fit: BoxFit.cover,
                              width: 18.5.r,
                              height: 18.5.r,
                            ),
                            SizedBox(
                              width: 13.w,
                            ),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    myYzm = value;
                                  });
                                  // print(myYzm);
                                },
                                decoration: InputDecoration(
                                  hintText: "Verification",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                  )
                                ),
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                "${_codeText}",
                                style: TextStyle(
                                  color: Color(0xff1891FE),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                              ),
                              onTap: () {
                                if (registerPhone.text.isEmpty) {
                                  CommonToast.showToast(
                                    "Please enter phone number",
                                  );
                                  return;
                                } else {
                                  if (_timeCount != 60) {
                                    return;
                                  }
                                  _verificationCode(
                                    "5",
                                    "1",
                                    "${countryCodeText.replaceAll(" ", "") + '-' + registerPhone.text.replaceAll(" ", "")}",
                                    "F0962F2444C856E4255D98195548CC82",
                                  );
                                }
                              },
                            ),
                            SizedBox(
                              width: 16.sp,
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                            _register(
                              "1",
                              "$myYzm",
                              "${registerPhone.text}",
                              "F0962F2444C856E4255D98195548CC82",
                            );
                        },
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h),
                          margin: EdgeInsets.only(top: 50.h-bottom,left: 37.5.w,right: 37.5.w),
                          decoration: BoxDecoration(
                            color: Color(0xff028AFE),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                            ),
                          )
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(top: 71.5.h-bottom*3,left: 37.5.w,right: 37.5.w),
                        padding: EdgeInsets.only(bottom: 28.5.h-bottom),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Text(
                            "Sign In >",
                            style: TextStyle(
                              color:Color(0xff494949),
                              fontSize: 14.sp,
                            ),
                          ),
                          onTap: () {
                            // print("Sign Up -> Sign In");
                            Navigator.pushNamed(context, "/LoginPage");
                          },
                        ),
                      )
                    ],
                  ),
                  if (IconFlag)
                    Positioned(
                      top: 138.h,
                      left: 74.w,
                      child: Container(
                        width: 60.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Color.fromARGB(255, 230, 227, 227),
                          ),
                        ),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView(
                            shrinkWrap: true,
                            children: List.generate(
                              myCountryList.length,
                              (index) => GestureDetector(
                                child: Column(
                                  children: [
                                    Text(
                                      "+${myCountryList[index].countryCode}",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    countryCodeText =
                                        "${myCountryList[index].countryCode}";
                                    IconFlag = false;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left:40.w,right:40.w),
                height: 56,
                child: RichText(
                  text: TextSpan(
                    text: "By continuing，you agree to the",
                    style: TextStyle(color: Color(0xFF494949), fontSize: 10.sp),
                    children: [
                      TextSpan(
                        text: ' Customer Agreement ',
                        style: TextStyle(color: Color(0xFF1166BB), fontSize: 10.sp),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // print('Customer Agreement');
                            Navigator.pushNamed(context, "/AgreementPage");
                          },
                      ),
                      TextSpan(
                        text: 'or other agreement for Pa32 services,and the ',
                        style: TextStyle(fontSize: 10.sp, color: Color(0xFF494949),
                        ),
                      ),
                      TextSpan(text: "  "),
                      TextSpan(
                          text: "Privacy Notice.",
                          style: TextStyle(color: Color(0xFF1166BB), fontSize: 10.sp),
                          recognizer: TapGestureRecognizer()..onTap = (){
                            Navigator.pushNamed(context, "/PrivacyPage");
                          }),
                    ],
                  ),
                ),
              )
            )
          ],
        ),
    );
  }
}
