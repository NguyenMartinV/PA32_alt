import 'package:flutter/material.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/DataUtils.dart';

import '../http/bean/my_cares_customer_detail_entity.dart';

class Personal extends StatefulWidget {
  @override
  State<Personal> createState() => _PersonalPage();
}

class _PersonalPage extends State<Personal> {
  bool flag = true;
  String myVerificationCode = '';
  String myPhone = '';
  var newPassword = TextEditingController();
  var confrmPassword = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var phoneNumber= TextEditingController();
  Future<Object> ? message;

  _customerDetail(
      String customerId, int mask, int arrayMask, String count) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/customerDetail",
      {
        "customerId": customerId,
        "mask": mask,
        "arrayMask": arrayMask,
        "count": count,
      },
          (success) async {
        setState(() {

        });
        MyCaresCustomerDetailEntity bean =
        MyCaresCustomerDetailEntity.fromJson(success);

        // if (bean.code == 0 && bean.data != null){
        //   myHomeList.clear();
        //   myHomeList.addAll(bean.data!);
        // }
        // else{
        //
        // }

        //print(bean);

        //message = bean.data?.nickname.toString();
        final data = bean.data;
        if(data!=null){
          message = data as Future<Object>?;
          //message = data.firstName.toString() + " "  + data.middleName.toString()  + "\n" + data.address.toString() + " " + data.lastName.toString() + "\n" + data.birth.toString() + "\n" + data.gender.toString() + "\n" + data.physicalCondition.toString() + "\n" + data.deviceNo.toString() + "\n" + data.lastUpdateTime.toString();
        }
        return message;
      },
          (error) {
        CommonToast.showToast(error);
      },
    );
  }

  _customerMod(String id, int fieldId, String fieldValue) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/customerMod",
      {
        "id": id,
        "fieldId": fieldId,
        "fieldValue": fieldValue,
      },
          (success) {
        if (success['code'] == 0) {
          Navigator.pop(context, fieldValue);
        } else {
          CommonToast.showToast(success['msg']);
        }
      },
          (error) {},
    );
  }

  _giverRegister(String phone, String verificationCode, String pwd) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/giverReg",
      {
        "phone": phone,
        "verificationCode": verificationCode,
        "pwd": pwd,
      },
          (success) {
        if (success['code'] == 0) {
          Navigator.pushNamed(context, "/LoginPage");
        } else {
          CommonToast.showToast(success['msg']);
        }
      },
          (error) {
        CommonToast.showToast(error);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (flag) {
      var args = ModalRoute.of(context)!.settings.arguments;

      if (args is Map) {
        setState(() {
          myVerificationCode = args['myYzm'];
          myPhone = args['account'];
          flag = false;
        });
      }
      // print("++++++52+++:${myPhone}");
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Set Password",
          textAlign: TextAlign.center,
        ),
        elevation: 0.5,
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
                  //_customerDetail("1591099483739385856", 15, 15, "{0:1,3:10}"),
                  FutureBuilder(
                    future: message,
                    builder: (context, snapshot) {
                      if(!snapshot.hasData){
                        return CircularProgressIndicator();
                      }
                      else{
                        return Text(snapshot.data.toString());
                      }
                    }
                  )
                  // Row(
                  //   children: [
                  //     Text(
                  //       "New Password",
                  //       style: TextStyle(
                  //         fontSize: 16.0,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //     border: Border.all(
                  //       width: 1,
                  //       color: Color(0xffEAEAEA),
                  //     ),
                  //   ),
                  //   child: TextField(
                  //     /* onChanged: (value) {
                  //       print(value);
                  //     }, */
                  //     controller: newPassword,
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       // isCollapsed: true,
                  //     ),
                  //   ),
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Confirm Password",
                  //       style: TextStyle(
                  //         fontSize: 16.0,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //     border: Border.all(
                  //       width: 1,
                  //       color: Color(0xffEAEAEA),
                  //     ),
                  //   ),
                  //   child: TextField(
                  //     /* onChanged: (value) {
                  //       print(value);
                  //     }, */
                  //     controller: confrmPassword,
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       // isCollapsed: true,
                  //     ),
                  //   ),
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "First Name",
                  //       style: TextStyle(
                  //         fontSize: 16.0,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //     border: Border.all(
                  //       width: 1,
                  //       color: Color(0xffEAEAEA),
                  //     ),
                  //   ),
                  //   child: TextField(
                  //     /* onChanged: (value) {
                  //       print(value);
                  //     }, */
                  //     controller: firstName,
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       // isCollapsed: true,
                  //     ),
                  //   ),
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Last Name",
                  //       style: TextStyle(
                  //         fontSize: 16.0,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //     border: Border.all(
                  //       width: 1,
                  //       color: Color(0xffEAEAEA),
                  //     ),
                  //   ),
                  //   child: TextField(
                  //     /* onChanged: (value) {
                  //       print(value);
                  //     }, */
                  //     controller: lastName,
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       // isCollapsed: true,
                  //     ),
                  //   ),
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Email",
                  //       style: TextStyle(
                  //         fontSize: 16.0,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //     border: Border.all(
                  //       width: 1,
                  //       color: Color(0xffEAEAEA),
                  //     ),
                  //   ),
                  //   child: TextField(
                  //     /* onChanged: (value) {
                  //       print(value);
                  //     }, */
                  //     controller: email,
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       // isCollapsed: true,
                  //     ),
                  //   ),
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Phone Number",
                  //       style: TextStyle(
                  //         fontSize: 16.0,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //     border: Border.all(
                  //       width: 1,
                  //       color: Color(0xffEAEAEA),
                  //     ),
                  //   ),
                  //   child: TextField(
                  //     /* onChanged: (value) {
                  //       print(value);
                  //     }, */
                  //     controller: phoneNumber,
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       // isCollapsed: true,
                  //     ),
                  //   ),
                  // ),
                  // GestureDetector(
                  //   behavior: HitTestBehavior.translucent,
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  //     margin: EdgeInsets.only(top: 50.0),
                  //     decoration: BoxDecoration(
                  //       color: Color(0xff028AFE),
                  //       borderRadius: BorderRadius.circular(8.0),
                  //     ),
                  //     child: Column(
                  //       children: [
                  //         Text(
                  //           "Confrm",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 16.0,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     // print(Utils.md5Encode(newPassword.text));
                  //     if (newPassword.text == confrmPassword.text) {
                  //       // print();
                  //       if (newPassword.text.length >= 6 &&
                  //           newPassword.text.length <= 32) {
                  //         _giverRegister(
                  //           myPhone,
                  //           myVerificationCode,
                  //           Utils.md5Encode(newPassword.text),
                  //           // "9CBF8A4DCB8E30682B927F352D6559A0",
                  //         );
                  //       } else {
                  //         CommonToast.showToast(
                  //           "The password length should be 6-32 bits",
                  //         );
                  //         return;
                  //       }
                  //     } else {
                  //       CommonToast.showToast(
                  //         "The two passwords are inconsistent",
                  //       );
                  //     }
                  //   },
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}