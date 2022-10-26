import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa32/component/common_appbar.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/SPUtil.dart';

import '../../utils/DataUtils.dart';

class PhysicalPage extends StatefulWidget {
  @override
  State<PhysicalPage> createState() => _PhysicalPageState();
}

class _PhysicalPageState extends State<PhysicalPage> {
  bool flag = true;
  String customerId = '';
  String physicalCondition = '';
  var physicalControll = TextEditingController();
  String from = "";
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
          CommonToast.showToast("Modify successfully");
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
        // print("-------------:${args}");
        setState(() {
          // customerId = args['customerId'];
          from = args["from"];
          physicalControll.text = args['physicalCondition'];
        });
      }
      flag = false;
    }
    // ScreenUtil.init(
    //     BoxConstraints(
    //         maxWidth: MediaQuery.of(context).size.width,
    //         maxHeight: MediaQuery.of(context).size.height),
    //     designSize: Size(375, 667),
    //     context: context,
    //     minTextAdapt: true,
    //     orientation: Orientation.portrait);
    return CommonAppBar(
        bgColor:  const Color(0xffF2F2F2),
        title: "Physical Condition",
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
              if(Utils.isBlank(physicalControll.text)){
                CommonToast.showToast("Physical Condition can not be empty.");
                return;
              }
              if(from == "service"){
                Navigator.pop(context,physicalControll.text);
              }
              else{
                SPUtil.get("onlyCustomerId").then(
                      (value) =>
                  {_customerMod("$value", 8, "${physicalControll.text}")},
                );
              }
            },
          )
        ],
      body:
      Column(
          children: [
      Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20,left:13,right:13),
          padding: EdgeInsets.only(
            left: 21.5.w,
            right: 11.w,
            top: 17.h,
            bottom: 10.h
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Physical Condition :",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color:Color(0xff222222),
                  ),
                ),
              SizedBox(
                  child: TextField(
                    controller: physicalControll,
                    style: TextStyle(
                      fontSize: 15.sp,
                      height: 1.8,
                      color: Color(0x99222222),
                    ),
                    autofocus: false,
                    maxLines: null,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        hintText: "Enter your physical health status, such as allergic drugs, heart disease, skin disease, fever, infectious disease, disability or hearing, visual impairment, and other medical treatment",
                        border: InputBorder.none,
                        hintMaxLines: 5,
                        hintStyle: TextStyle(
                          fontSize: 15.sp,
                          height: 1.8,
                          color: Color(0x99222222),
                        )
                    ),
                  )
                ),
            ],
          ),
        ),
    ))])
    );
  }
}
