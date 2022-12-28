import 'package:flutter/material.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/DataUtils.dart';

import '../http/bean/customer_list_all_entity.dart';
import '../http/bean/my_cares_customer_detail_entity.dart';
import '../utils/SPUtil.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
  String callOutTime = '';
  String callComeTime = '';
  int MyswiperIndex = 0;
  List myCaresData = [];
  List myGivers = [];
  List myEmergency = [];
  List myAlert = [];
  String myToken = '';
  String myIconId = '';
  String myUserId = "";
  String userImgSrc = '';
  String token = '';
  int giverInt = 0;
  _customerList(
      int sortType,
      int sort,
      int pageNo,
      int pageSize,
      int mask,
      int arrayMask,
      String count,
      ) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/customerList",
      {
        "sortType": sortType,
        "sort": sort,
        "pageNo": pageNo,
        "pageSize": pageSize,
        "mask": mask,
        "arrayMask": arrayMask,
        "count": count,
      },
          (success) {
        CustomerListAllEntity bean = CustomerListAllEntity.fromJson(success);

        if (bean.code == 0) {
          setState(() {
            myCaresData = bean.data as List;
            if (myCaresData.isNotEmpty) {
              myIconId = myCaresData[0].icon;
              myGivers = myCaresData[0].giver;
              myEmergency = myCaresData[0].emergency;
              myAlert = myCaresData[0].alert;
            }
          });
        } else {
          CommonToast.showToast("${bean.msg}");
        }
      },
          (error) {},
    );
  }

  @override
  void initState() {
    //_customerList(0, 0, 1, 999, 15, 15, "0:1,3:10");
    // TODO: implement initState
    super.initState();
    SPUtil.get("myPhoneText").then(
          (value) => {
        setState(() {
          myPhone = value.toString();
        })
      },
    );
    SPUtil.get("userId").then(
          (value) => {
        setState(() {
          myUserId = value.toString();
        })
      },
    );
  }

  _giverMod(String id, String nickname, int mask) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/giverMod",
      {
        "id": id,
        "nickname": nickname,
        "mask": mask,
      },
          (success) {
        if (success['code'] == 0) {
          CommonToast.showToast(success['msg']);
        } else {
          CommonToast.showToast(success['msg']);
        }
      },
          (error) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    for(int i=0;i<myGivers.length;i++){
      if(myGivers[i].phone==myPhone){
        giverInt = i;
      }
    }
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
        leading: GestureDetector(
            onTap: () {
              //Navigator.popUntil(context, ModalRoute.withName("/MyHomeMap"));
              Navigator.pop(context);
              // Navigator.pushNamed(context, "/MyHomeMap");
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.blue,
              size: 18,
            )
        ),
        title: const Text(
          "Personal Info",
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

            Container(
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              margin: EdgeInsets.only(top: 40.0),
              child: Column(
                // children: List.generate(
                //   myCaresData.length,
                //   // 2,
                //       (index) => Container(
                //     width: 10,
                //     height: 10,
                //     margin: EdgeInsets.only(left: 5, right: 5),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(5),
                //       color: MyswiperIndex == index
                //           ? Color(0xff028AFE)
                //           : Color(0xffC2C2C2),
                //     ),
                //   ),
                // ),
                children:
                [

                  ListTile(
                      leading: const Icon(Icons.supervised_user_circle),
                      title: AutoSizeText("NickName: " + myGivers[giverInt].nickname.toString(), style: TextStyle(fontSize: 30), maxLines: 2,),
                      onTap: () {
                        //_giverMod(myGivers[giverInt].id, "nibu921", 0);
                        /* react to the tile being tapped */ }
                  ),
                  ListTile(
                      leading: const Icon(Icons.phone),
                      title: AutoSizeText("Phone Number: " + myGivers[giverInt].phone.toString(), style: TextStyle(fontSize: 30), maxLines: 2,),
                      onTap: () { /* react to the tile being tapped */ }
                  ),
                  ListTile(
                    leading: const Icon(Icons.mail),
                    title: AutoSizeText("Email: " + myGivers[giverInt].email.toString(), style: TextStyle(fontSize: 30), maxLines: 2,),
                    onTap: () { /* react to the tile being tapped */ }
                ),
                  ListTile(
                    leading: const Icon(Icons.verified_user),
                    title: AutoSizeText("User ID: " + myGivers[giverInt].id.toString(), style: TextStyle(fontSize: 30), maxLines: 2,),
                    onTap: () { /* react to the tile being tapped */ }
                ),

                  // ListTile(
                  //     leading: const Icon(Icons.flight_land),
                  //     title: Text(myGivers[1]),
                  //     onTap: () { /* react to the tile being tapped */ }
                  // ),

                  // FutureBuilder(
                  //   future: message,
                  //   builder: (context, snapshot) {
                  //     if(!snapshot.hasData){
                  //       return CircularProgressIndicator();
                  //     }
                  //     else{
                  //       return Text(snapshot.data.toString());
                  //     }
                  //   }
                  // )
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