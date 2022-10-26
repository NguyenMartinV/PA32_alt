import 'package:flutter/material.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/SPUtil.dart';

import '../../component/common_appbar.dart';
import '../../component/common_toast.dart';
import '../../utils/DataUtils.dart';

class SearchAddress extends StatefulWidget {
  @override
  State<SearchAddress> createState() => _SearchAddressPgae();
}

class _SearchAddressPgae extends State<SearchAddress> {
  String state = "Connecticut (CT)";
  var addressController = TextEditingController();
  var zipCodeController = TextEditingController();
  String from = "";
  bool flag = true;

  _customerMod(String id, int fieldId,String state,String detailAddress,String zipCode) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/customerMod",
      {
        "id": id,
        "fieldId": fieldId,
        "fieldValue": "address",
        "state":state,
        "detailAddress":detailAddress,
        "zipCode":zipCode
      },
      (success) {
        if (success['code'] == 0) {
          CommonToast.showToast("Modify successfully");
          Map map = {};
          map["state"] = state;
          map["address"] = detailAddress;
          map["zipCode"] = zipCode;
          Navigator.pop(context, map);
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
      if (args is Map) {
          // print("页面传递------:$args");
          setState(() {
            from = args["from"];
            state = args["state"];
            addressController.text = args["address"];
            zipCodeController.text = args["zipCode"];
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
      title: "Address",
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
            if(Utils.isBlank(state)){
              CommonToast.showToast("State can not be empty.");
              return;
            }
            if(Utils.isBlank(addressController.text)){
              CommonToast.showToast("Address can not be empty.");
              return;
            }
            if(Utils.isBlank(zipCodeController.text)){
              CommonToast.showToast("Zip code can not be empty.");
              return;
            }
            if(from == "service"){
              Map map = {};
              map["state"] = state;
              map["address"] = addressController.text;
              map["zipCode"] = zipCodeController.text;
              Navigator.pop(context, map);
            }
            else{
              SPUtil.get("onlyCustomerId").then(
                    (value) => {
                  _customerMod("$value",6, state,addressController.text,zipCodeController.text)
                },
              );
            }
          },
        )
      ],
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Pickers.showSinglePicker(context,
                data: ['Alabama(AL)','Alaska(AK)','Arizona(AZ)','Arkansas(AR)','California(CA)','Colorado(CO)','Connecticut(CT)','Delaware(DE)',
                  'Florida(FL)','Georgia(GA)','Hawaii(HI)','Idaho(ID)','Illinois(IL)','Indiana(IN)','Iowa(IA)','Kansas(KS)','Kentucky(KY)','Louisiana(LA)',
                  'Maine(ME)','Maryland(MD)','Massachusetts(MA)','Michigan(MI)','Minnesota(MN)','Mississippi(MS)','Missouri(MO)','Montana(MT)','Nebraska(NE)',
                  'Nevada(NV)','New Hampshire(NH)','New Jersey(NJ)','New Mexico(NM)','New York(NY)','North Carolina(NC)','North Dakota(ND)','Ohio(OH)',
                  'Oklahoma(OK)','Oregon(OR)','Pennsylvania(PA)','Rhode Island(RI)','South Carolina(SC)','Tennessee(TN)','Texas(TX)','Utah(UT)','Vermont(VT)',
                  'Virginia(VA)','Washington(WA)','West Virginia(WV)','Wisconsin(WI)','Wyoming(WY)'
                ],
                selectData: state,
                pickerStyle: Utils.pickerStyle("State"),
                onConfirm: (p, position) {
                  setState(() {
                    state = p;
                  });
                },
              );
            },
            child: Container(
              height: 45.h,
              margin: EdgeInsets.only(top: 12.h,left:11.5.w,right:11.5.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 24.w,
                  ),
                  Text(
                    "State",
                    style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 15.sp,
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 4.w),
                      padding: EdgeInsets.only(left:4.w),
                      child: Text(
                        state,
                        style: TextStyle(
                            fontSize:15.sp,
                            color: Color(0x99222222)
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/down_arr.png",
                    width: 12.w,
                    height: 6.5.h,
                  ),
                  SizedBox(
                    width: 14.5.w,
                  )
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 14.5.h,left:11.5.w,right:11.5.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24.w,top: 16.5.h),
                  child: Text(
                    "Detail address",
                    style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24.w,right: 24.w),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.3,
                      color: Color(0x99222222),
                    ),
                    controller: addressController,
                    autofocus: false,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Enter your address",
                      border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 15.sp,
                          height: 1.3,
                          color: Color(0x99222222),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 45.h,
            margin: EdgeInsets.only(top: 12.h,left:11.5.w,right:11.5.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 24.w,
                ),
                Text(
                  "Zip code",
                  style: TextStyle(
                    color: Color(0xff222222),
                    fontSize: 15.sp,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 14.w),
                    child: TextField(
                      textAlign:TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        height: 1.3,
                        color: Color(0x99222222),
                      ),
                      controller: zipCodeController,
                      autofocus: false,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: "Enter your zip code",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 15.sp,
                          height: 1.3,
                          color: Color(0x99222222),
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
