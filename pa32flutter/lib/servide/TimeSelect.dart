import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:flutter_pickers/time_picker/model/suffix.dart';
import 'package:pa32/component/common_appbar.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/DataUtils.dart';
import 'package:pa32/utils/SPUtil.dart';

class DatePickerPubDemo extends StatefulWidget {
  // DatePickerPubDemo({Key? key}) : super(key: key);

  _DatePickerPubDemoState createState() => _DatePickerPubDemoState();
}

class _DatePickerPubDemoState extends State<DatePickerPubDemo> {
  DateTime _dateTime = DateTime.now();
  String customerId = '';
  bool flag = true;
  int year = 0;
  int month = 0;

  void _showDatePicker() {
    Pickers.showDatePicker(
      context,
      // 模式，详见下方
      mode: DateMode.YM,
      // 后缀 默认Suffix.normal()，为空的话Suffix()
      suffix: Suffix(),
      // 样式
      pickerStyle: Utils.pickerStyle("Birthday"),
      // 默认选中
      selectDate: PDuration.parse(_dateTime),
      onConfirm: (pd) {
        setState(() {
          _dateTime = DateTime(
            pd.year!,
            pd.month!,);
        });
      },
      // onChanged: (p) => print(p),
    );
  }

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
          Navigator.pop(context,fieldValue);
        }else{
          CommonToast.showToast(success["msg"]);
        }
      },
      (error) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    if (flag) {
      var args = ModalRoute.of(context)!.settings.arguments;

      if (args != null && args is String) {
        if(!Utils.isBlank(args)){
          List<String> list = args.split("-");
          _dateTime = DateTime(
            int.parse(list[0]),
            int.parse(list[1]));
        }

        // print("-------------:${args}");
        /* setState(() {
          customerId = args['customerId'];
        }); */
      }
      // print("最新保存：$customerId");
      flag = false;
    }
    return CommonAppBar(
      bgColor:  const Color(0xffF2F2F2),
      title: "Birthday",
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 19.0, right: 12.0),
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
              SPUtil.get("onlyCustomerId").then(
                (value) => {
                  _customerMod(
                    "$value",
                    5,
                    "${_dateTime.toString().substring(0, 7)}",
                  )
                },
              );
            },
          )
        ],
      body: Container(
        height: 50,
        margin: EdgeInsets.only(top: 20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: Row(
                    children: <Widget>[
                      Text("${formatDate(_dateTime, [
                            yyyy,
                            '-',
                            mm,
                          ])}"),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: _showDatePicker,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
