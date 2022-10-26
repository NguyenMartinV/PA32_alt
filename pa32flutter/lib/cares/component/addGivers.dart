import 'package:flutter/material.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/SPUtil.dart';

class AddGiverPage extends StatefulWidget {
  @override
  State<AddGiverPage> createState() => _AddGiverPageState();
}

class _AddGiverPageState extends State<AddGiverPage> {
  bool flag = true;
  String customerId = '';
  var phoneController = TextEditingController();
  var nicknameController = TextEditingController();
  _giverAdd(String phone, String customerId, String nickname) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/giverAdd",
      {
        "phone": phone,
        "customerId": customerId,
        "nickname": nickname,
      },
      (success) {
        if (success['code'] == 0) {
          Navigator.pushNamed(context, "/CaresPage");
        }
        CommonToast.showToast(success['msg']);
      },
      (error) {
        // CommonToast.showToast(error);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (flag) {
      /* var args = ModalRoute.of(context)!.settings.arguments;

      if (args != null && args is Map) {
        setState(() {
          customerId = args['customerId'];
        });
        // print("---------:$customerId");
      } */

      flag = false;
    }
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Add Care Giver"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        elevation: 0,
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
              // print("Add Care Givers Done");
              SPUtil.get("customerIdGiver")
                ..then(
                  (value) => {
                    _giverAdd(
                      "${phoneController.text}",
                      "$value",
                      "${nicknameController.text}",
                    )
                  },
                );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50.0,
            margin: EdgeInsets.only(top: 20.0,left:13,right:13),
            padding: EdgeInsets.only(left: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      "Phone Number",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                    )
                ),
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: phoneController,
                    style: TextStyle(),
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Enter your phone",
                      border: InputBorder.none,
                    ),
                  )
                ),
              ],
            ),
          ),
          Container(
            height: 50.0,
            margin: EdgeInsets.only(top: 20.0,left:13,right:13),
            padding: EdgeInsets.only(left: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      "Nick Name",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                    )
                ),
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: nicknameController,
                    style: TextStyle(),
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Enter your Nickname",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      print(value);
                    },
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
