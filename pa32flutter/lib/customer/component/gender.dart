import 'package:flutter/material.dart';
import 'package:pa32/component/common_appbar.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/SPUtil.dart';

class CustomerGender extends StatefulWidget {
  @override
  State<CustomerGender> createState() => _CustomerGenderPage();
}

class _CustomerGenderPage extends State<CustomerGender> {
  int Gender = 0;
  bool flag = true;
  String customerId = '';
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
          Navigator.pop(context,Gender);
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
        print(args['gender']);
        setState(() {
          // customerId = args['customerId'];
          Gender = args['gender'];
        });
      }
      flag = false;
    }
    return CommonAppBar(
        bgColor:  const Color(0xffF2F2F2),
        title: "Gender",
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
              // print("Done");
              SPUtil.get("onlyCustomerId")
                  .then((value) => {_customerMod("$value", 4, "$Gender")});
            },
          )
        ],
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("male"),
            Radio(
              value: 1,
              groupValue: Gender,
              activeColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  Gender = 1;
                });
                // print(Gender);
              },
            ),
            SizedBox(
              width: 30,
            ),
            Text("female"),
            Radio(
              value: 2,
              groupValue: Gender,
              activeColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  Gender = 2;
                });
                // print(Gender);
              },
            ),
          ],
        ),
      ),
    );
  }
}
