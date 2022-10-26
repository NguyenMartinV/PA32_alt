import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa32/component/common_appbar.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/bean/country_code_entity.dart';
import 'package:pa32/http/config/BaseConfig.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPassword> {
  var phoneController = TextEditingController();
  var yzmController = TextEditingController();
  List myCountryList = [];
  bool codeFlag = false;
  String countryCodeText = '86';
  late Timer _timer;
  int _timeCount = 60;
  String _codeText = "Send";
  bool sendFlag = true;

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
        }
      },
      (error) {
        print("send失败:" + error);
      },
    );
  }

//检查验证码
  _checkYzm(String type, String code, String account,
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
          Navigator.pushNamed(
            context,
            "/ForgotPasswordReset",
            arguments: {
              "account": countryCodeText.replaceAll(" ", "") + '-' + account,
              "myYzm": code,
            },
          );
        } else {
          CommonToast.showToast(success['msg']);
        }
      },
      (error) {
        CommonToast.showToast(error['msg']);
      },
    );
  }

  //get countryCode
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
    return CommonAppBar(
        elevation: 0.5,
        bgColor:  Colors.white,
        title: "Forgot Password",
        body: Stack(
          children: [
            Container(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width - 80.0,
              padding: EdgeInsets.only(top: 20.0),
              margin: EdgeInsets.only(left: 40.0),
              // color: Colors.red,
              child: Column(
                children: [
                  Text(
                    "Enter the mobile phone number associated with your account.",
                    style: TextStyle(
                      height: 1.3,
                      color: Color(0xffA9A9A9),
                      fontSize: 15.0,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.red,
                    margin: EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Phone",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              width: 1,
                              color: Color(0xffEAEAEA),
                            ),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: 80,
                                  height: 48,

                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  // color: Colors.blue,
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        " +$countryCodeText",
                                        style: TextStyle(
                                          color:Color(0xff222222),
                                          fontSize: 16.sp
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    codeFlag = !codeFlag;
                                  });
                                },
                              ),
                              Container(
                                width: 220,
                                height: 48,
                                // color: Colors.red,
                                child: TextField(
                                  controller: phoneController,
                                  onChanged: (value) {
                                    print(value);
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Enter your mobile",
                                    border: InputBorder.none,
                                    // isCollapsed: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Verification",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (phoneController.text.isEmpty) {
                                  CommonToast.showToast(
                                    "Please enter phone number",
                                  );
                                  return;
                                } else {
                                  if (_timeCount != 60) {
                                    return;
                                  }
                                  _verificationCode(
                                    "6",
                                    "1",
                                    "${countryCodeText.replaceAll(" ", "") + '-' + phoneController.text.replaceAll(" ", "")}",
                                    "F0962F2444C856E4255D98195548CC82",
                                  );
                                }
                              },
                              behavior: HitTestBehavior.translucent,
                              child: Text(
                                "${_codeText}",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff028AFE),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          padding: EdgeInsets.only(left:5,right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              width: 1,
                              color: Color(0xffEAEAEA),
                            ),
                          ),
                          child: TextField(
                            controller: yzmController,
                            onChanged: (value) {
                              print(value);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // isCollapsed: true,
                            ),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                            margin: EdgeInsets.only(top: 50.0),
                            decoration: BoxDecoration(
                              color: Color(0xff028AFE),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            // print("点击Next");

                            _checkYzm(
                              "1",
                              "${yzmController.text.replaceAll(" ", "")}",
                              "${phoneController.text}",
                              "F0962F2444C856E4255D98195548CC82",
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (codeFlag)
              Positioned(
                top: 170,
                left: 40,
                child: Container(
                  width: 60,
                  height: 112,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: Color.fromARGB(255, 230, 227, 227),
                    ),
                  ),
                  child: MediaQuery.removeViewPadding(
                    context: context,
                    removeTop: true,
                    child: ListView(
                      shrinkWrap: true,
                      children: List.generate(
                        myCountryList.length,
                        (index) => GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(top: 4, bottom: 4),
                            alignment: Alignment.center,
                            child: Text(
                              "+${myCountryList[index].countryCode}",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              countryCodeText =
                                  "${myCountryList[index].countryCode}";
                              codeFlag = false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ));
  }
}
