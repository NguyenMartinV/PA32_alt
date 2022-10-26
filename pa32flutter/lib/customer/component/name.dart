import 'package:flutter/material.dart';
import 'package:pa32/component/common_appbar.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/SPUtil.dart';

class SetName extends StatefulWidget {
  @override
  State<SetName> createState() => _SetNamePage();
}

class _SetNamePage extends State<SetName> {
  bool flag = true;
  String from = "";
  String customerId = '';
  String firstName = '';
  String middleName = '';
  String lastName = '';
  var myFirst = TextEditingController();
  var myMiddle = TextEditingController();
  var myLast = TextEditingController();
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
          Map map = Map();
          map["firstName"] = myFirst.text;
          map["middleName"] = myMiddle.text;
          map["lastName"] = myLast.text;
          Navigator.pop(context,map);
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
        // print("-------------:${args}");
        setState(() {
          from = args['from'];
          // customerId = args['customerId'];
          myFirst.text = args['firstName'];
          myMiddle.text = args['middleName'];
          myLast.text = args['lastName'];
        });
      }
      // print("最新保存：$customerId");
      flag = false;
    }
    return CommonAppBar(
      bgColor:  const Color(0xffF2F2F2),
      title: "Name",
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
              if(myFirst.text==""){
                CommonToast.showToast("Please enter first name");
                return;
              }
              if(myLast.text==""){
                CommonToast.showToast("Please enter last name");
                return;
              }
              if(from == "service"){
                Map<String,String> map = {};
                map["firstName"] = myFirst.text;
                map["middleName"] = myMiddle.text;
                map["lastName"] = myLast.text;
                Navigator.pop(context,map);
              }
              else{
                SPUtil.get("onlyCustomerId").then(
                      (value) => {
                    _customerMod("$value", 2,
                        "${myFirst.text + '_' + myMiddle.text + '_' + myLast.text}")
                  },
                );
              }

              /* _customerMod(
                customerId,
                2,
                "${myFirst.text + '_' + myMiddle.text + '_' + myLast.text}",
              ); */
            },
          )
        ],
      body:Column(
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
                      "First Name",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                    )
                ),
                Expanded(
                    flex: 3,
                    child: TextField(
                      controller: myFirst,
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
                      "Middle Name",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                    )
                ),
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: myMiddle,
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
                      "Last Name",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                    )
                ),
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: myLast,
                    autofocus: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      print(myLast.text);
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

/* class SetNameContent extends StatefulWidget {
  @override
  State<SetNameContent> createState() => _SetNameContentPage();
}

class _SetNameContentPage extends State<SetNameContent> {
  @override
  Widget build(BuildContext context) {
    return ;
  }
} */
