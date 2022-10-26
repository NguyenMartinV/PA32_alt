import 'package:flutter/material.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/DataUtils.dart';

class ForgotPasswordReset extends StatefulWidget {
  @override
  State<ForgotPasswordReset> createState() => _ForgotPasswordResetPage();
}

class _ForgotPasswordResetPage extends State<ForgotPasswordReset> {
  var myPassword = TextEditingController();
  var confemPassword = TextEditingController();
  bool falg = true;
  String myPhone = '';
  String myYzm = '';
  _passwordReset(
    String phone,
    String verificationCode,
    String password,
  ) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/passwordReset",
      {
        "phone": phone,
        "verificationCode": verificationCode,
        "password": password,
      },
      (success) {
        if (success['code'] == 0) {
          CommonToast.showToast("${success['msg']}");
          Navigator.pushNamed(context, "/LoginPage");
        } else {
          CommonToast.showToast("${success['msg']}");
        }
      },
      (error) {
        CommonToast.showToast("$error");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (falg) {
      var args = ModalRoute.of(context)!.settings.arguments;
      if (args is Map) {
        print("+++47+++:$args");
        setState(() {
          myPhone = args['account'];
          myYzm = args['myYzm'];
        });
        // print("++++++:${myPhone + '---' + myYzm}");
      }
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Forgot Password",
          textAlign: TextAlign.center,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        elevation: 1,
      ),
      body: Container(
        // color: Colors.red,
        width: MediaQuery.of(context).size.width - 80.0,
        padding: EdgeInsets.only(top: 20.0),
        margin: EdgeInsets.only(left: 40.0),
        child: Column(
          children: [
            Text(
              "Please set a new password that include 6-32 characters and no spaces.",
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
                        "New Password",
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
                    child: TextField(
                      controller: myPassword,
                      onChanged: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // isCollapsed: true,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Confrm Password",
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
                    child: TextField(
                      controller: confemPassword,
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
                            "Confrm",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      // print("点击Confrm");
                      if (confemPassword.text.isEmpty ||
                          myPassword.text.isEmpty) {
                        CommonToast.showToast("0");
                        return;
                      } else if (confemPassword.text != myPassword.text) {
                        CommonToast.showToast("2");
                        return;
                      } else if (confemPassword.text.length > 32 ||
                          confemPassword.text.length < 6) {
                        CommonToast.showToast("3");
                        return;
                      }
                      _passwordReset(
                        "$myPhone",
                        "$myYzm",
                        Utils.md5Encode(confemPassword.text),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
