import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pa32/component/common_appbar.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/DataUtils.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordPage();
}

class _ResetPasswordPage extends State<ResetPassword> {
  var oldPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confrmPassword = TextEditingController();
  _passwordMod(
    String oldPassword,
    String password,
  ) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/passwordMod",
      {
        "oldPassword": oldPassword,
        "password": password,
      },
      (success) {
        if (success['code'] == 0) {
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
    return CommonAppBar(
      bgColor:  const Color(0xffF2F2F2),
      title: "Password",
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 21.6, right: 12.0),
              child: Text(
                "Done",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff43A1FE),
                    fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              // print("点击Done");

              if (oldPassword.text.isEmpty) {
                CommonToast.showToast(
                  "Please enter your old password",
                );
                return;
              } else if (newPassword.text.isEmpty ||
                  confrmPassword.text.isEmpty) {
                CommonToast.showToast(
                  "Please enter a new password",
                );
                return;
              } else if (newPassword.text != confrmPassword.text) {
                CommonToast.showToast(
                  "The new password and confirmation password are incorrect",
                );
                return;
              } else if (confrmPassword.text.length > 32 ||
                  confrmPassword.text.length < 6) {
                CommonToast.showToast(
                  "Please enter a 6-32-bit password",
                );
                return;
              }
              _passwordMod("${Utils.md5Encode(oldPassword.text)}",
                  "${Utils.md5Encode(confrmPassword.text)}");
            },
          )
        ],
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 15.0,
              left: 30.0,
              right: 30.0,
            ),
            child: Text(
              "Please set a new password that include 6-32 charactersand no spaces.",
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0XFF999999),
              ),
            ),
          ),
          Container(
            height: 50.0,
            margin: EdgeInsets.only(top: 15.0,left:13,right:13),
            padding: EdgeInsets.only(left: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      "Original Password",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                    )
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: oldPassword,
                    style: TextStyle(fontSize: 15),
                    onChanged: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Original Password",

                      // isCollapsed: true,
                    ),
                  )
                ),
              ],
            ),
          ),

          Container(
            height: 50.0,
            margin: EdgeInsets.only(top: 15.0,left:13,right:13),
            padding: EdgeInsets.only(left: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      "New Password",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                    )
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: newPassword,
                    onChanged: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "New Password",
                      // isCollapsed: true,
                    ),
                  )
                ),
              ],
            ),
          ),

          Container(
            height: 50.0,
            margin: EdgeInsets.only(top: 15.0,left:13,right:13),
            padding: EdgeInsets.only(left: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      "Confrm Password",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                    )
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: confrmPassword,
                    onChanged: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Confrm Password",
                      // isCollapsed: true,
                    ),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
