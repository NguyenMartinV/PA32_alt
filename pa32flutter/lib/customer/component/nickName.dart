import 'package:flutter/material.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/SPUtil.dart';

class nickName extends StatefulWidget {
  @override
  State<nickName> createState() => _nickNamePage();
}

class _nickNamePage extends State<nickName> {
  bool flag = true;
  String customerId = '';
  String nickname = '';
  String from = "";
  var myNickname = TextEditingController();
  //修改customer信息 customerMod
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

  @override
  Widget build(BuildContext context) {
    if (flag) {
      var args = ModalRoute.of(context)!.settings.arguments;

      if (args != null && args is Map) {
        setState(() {
          from = args["from"];
          myNickname.text = args['nickname'];
        });
      }
      flag = false;
    }
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Nickname",
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // print("NickName 返回");
            // Navigator.pushNamed(context, "/CustomerPage");
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
              margin: EdgeInsets.only(top: 20.6, right: 12.0),
              child: Text(
                "Done",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff43A1FE),
                    fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              // print("Done");
              if(myNickname.text == ""){
                CommonToast.showToast("Please enter nickname first");
                return;
              }
              if(from == "service"){
                Navigator.pop(context,myNickname.text);
              }
              else{
                SPUtil.get("onlyCustomerId").then(
                      (value) => {_customerMod("$value", 1, "${myNickname.text}")},
                );
              }
            },
          ),
        ],
      ),
      body: Container(
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
                "Nickname",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
              )
            ),
            Expanded(
              flex: 3,
              child: TextField(
                controller: myNickname,
                style: TextStyle(fontSize: 15),
                autofocus: false,
                decoration: InputDecoration(
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
    );
  }
}
