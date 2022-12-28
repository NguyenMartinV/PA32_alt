
//change email

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import '../../http/bean/country_code_entity.dart';
import '../../http/bean/login_entity.dart';
import '../component/common_appbar.dart';
import '../component/common_toast.dart';
import '../utils/DataUtils.dart';
import '../utils/SPUtil.dart';
import '../utils/VerifyUtil.dart';


class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({Key? key}) : super(key: key);

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  String userId = "";
  bool inited = false;
  var emailController = TextEditingController();
  var vCodeController = TextEditingController();
  late Timer _timer;
  String _codeText = "Send";
  int _timeCount = 60;
  String countryCode = "1";
  bool showPhoneList = false;
  List countryCodeList = [];
  String email = "";
  bool isSend = false;  //是否发送了邮件

  _getLoginUser() async {
    LoginData user = await SPUtil.getLoginUserData();
    setState(() {
      //email = user.email;
    });
  }

  _changeUserInfo(String newEmail) async {
    LoginData user = await SPUtil.getLoginUserData();
    //user.email = newEmail;
    SPUtil.saveLoginUserData(user);
  }

  _getVerifyCode() {
    var phone = emailController.text;
    // API.postSendVerifyCodeCommonApi(phone, userId, 2, 1, (value) {
    //   CommonToast.showToast(MyLocalizations.of(context).sendCodeSucMsg);
    //   _startTimer();
    // });
  }

  void _startTimer() {
    _timer = Timer.periodic(
        Duration(seconds: 1),
            (Timer timer) => {
          setState(() {
            if (_timeCount <= 1) {
              //_codeText = MyLocalizations.of(context).resent;
              _timer.cancel();
              _timeCount = 60;
            } else {
              _timeCount -= 1;
              _codeText = "${_timeCount}s";
            }
          })
        });
  }

  @override
  void initState() {
    _getLoginUser();
    super.initState();

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
  Widget build(BuildContext context) {
    // ScreenUtil.init(
    //     BoxConstraints(
    //         maxWidth: MediaQuery.of(context).size.width,
    //         maxHeight: MediaQuery.of(context).size.height),
    //     designSize: Size(375, 667),
    //     context: context,
    //     minTextAdapt: true,
    //     orientation: Orientation.portrait);
    var bgColor = Colors.blue;
    return CommonAppBar(
        body: Container(
          padding: EdgeInsets.all(20.r),
          margin: EdgeInsets.only(left:20.w,right: 20.w),
          decoration: BoxDecoration(
              color: Colors.blue
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //MyLocalizations.of(context).originalEmail,
                    "Email",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:20.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            //MyLocalizations.of(context).newEmail,
                            "New Email",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                            width: 120.w,
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                var email = emailController.text;
                                if (Utils.isBlank(email)) {
                                  CommonToast.showToast(
                                    "Please Enter");
                                      //MyLocalizations.of(context).pleaseEnterMsg(MyLocalizations.of(context).emailAddress));
                                  return;
                                }
                                if (!VerifyUtil.isEmail(email)) {
                                  CommonToast.showToast(
                                  //MyLocalizations.of(context).formatErrMsg(MyLocalizations.of(context).email)
                                  "Format Error"
                                );
                                  return;
                                }
                                if (_timeCount != 60) {
                                  return;
                                }
                                _getVerifyCode();
                                isSend = true;
                              },
                              child: Text(
                                _codeText,
                                style: TextStyle(
                                  color: Color(0xff44B2FF),
                                  fontSize: 14,
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin:EdgeInsets.only(top:12.h),
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color:Colors.white,
                        width: 1.r,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left:4.w),
                      child: TextField(
                        controller: emailController,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  if(isSend)
                    Container(
                      margin: EdgeInsets.only(top:30.h),
                      child: Text(
                        //MyLocalizations.of(context).verification,
                        "Verification",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  if(isSend)
                    Container(
                      margin:EdgeInsets.only(top:12.h),
                      padding: EdgeInsets.only(left:4.w),
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:Colors.red,
                          width: 1.r,
                        ),
                      ),
                      child: TextField(
                        controller: vCodeController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                    ),
                  if(isSend)
                    Container(
                      margin: EdgeInsets.only(top:32.h),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: (){
                          var email = emailController.text;
                          var vCode = vCodeController.text;
                          if (Utils.isBlank(email)) {
                            // CommonToast.showToast(MyLocalizations.of(context).pleaseEnterMsg(MyLocalizations.of(context).phoneNumber));
                            // return;
                          }
                          if (!VerifyUtil.isEmail(email)) {
                            // CommonToast.showToast(MyLocalizations.of(context).formatErrMsg(MyLocalizations.of(context).email));
                            // return;
                          }
                          if (Utils.isBlank(vCode)) {
                            // CommonToast.showToast(
                            //     MyLocalizations.of(context).pleaseEnterMsg(MyLocalizations.of(context).verification));
                            // return;
                          }
                          if (!VerifyUtil.isVcode(vCode)) {
                            //CommonToast.showToast(MyLocalizations.of(context).vCodeErrMsg);
                            return;
                          }
                          // API.postChangeEmailApi(email, vCode, (value) {
                          //   CommonToast.showToast(
                          //       MyLocalizations.of(context).modSuccess(MyLocalizations.of(context).email));
                          //   _changeUserInfo(email);
                          //   Navigator.pop(context, email);
                          // });
                        },
                        child: Icon(
                          Icons.check_circle,
                          size: 60.0.r,
                          color: Color(0xff42b4ff),
                        ),
                      ),
                    ),
                ],
              ),
              if (showPhoneList)
                Positioned(
                  top: 129.h,
                  left: 0.w,
                  child: Container(
                    width: 56.w,
                    height: 160.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffaaaaaa), width: 1),
                        borderRadius: BorderRadius.circular(6)),
                    child: ListView(
                      children: List.generate(countryCodeList.length, (index) {
                        CountryCodeData countryCodeItem =
                        countryCodeList[index];
                        String codeStr = countryCodeItem.countryCode.toString();
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              showPhoneList = false;
                              countryCode = codeStr;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 3, right: 3, top: 5, bottom: 5),
                            child: Center(
                              child: Text(
                                "+$codeStr",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
            ],
          ),
        ),
        title: "Email");
  }
}

