import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/bean/customer_list_all_entity.dart';
import 'package:pa32/http/bean/my_cares_customer_detail_entity.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/SPUtil.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool flag = true;
  List myCaresData = [];
  List myGivers = [];
  List myEmergency = [];
  List myAlert = [];
  String myToken = '';
  String myIconId = '';
  String myUserId = '';
  String token = '';
  int MyswiperIndex = 0;

  List myCustomerData = [];
  List myAlertsData = [];
  String pageFrom = '';

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

        // print(bean);
        // print(bean.data);

        if(bean.code == 0) {
          setState(() {
            // myCaresData = bean.data as List;
            //
            // if(myCaresData.isNotEmpty) {
            //   myIconId = myCaresData[0].icon;
            //   myGivers = myCaresData[0].giver;
            //   myEmergency = myCaresData[0].emergency;
            //   myAlert = myCaresData[0].alert;
            // }
            myCustomerData = bean.data as List;
            if (myCustomerData.isNotEmpty) {
              myAlertsData = myCustomerData[0].alert as List;
            }
          });
        }
      },
      (error) {},
    );
  }

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
      (success) {
        MyCaresCustomerDetailEntity bean =
            MyCaresCustomerDetailEntity.fromJson(success);
        myEmergency.clear();
        myAlert.clear();

        // print(bean);
        // print(bean.data);

        if (bean.code == 0) {
          setState(() {
            // myGivers = bean.data?.giver as List;
            // print("emergency");
            // print(myEmergency);
            // myEmergency = bean.data?.emergency as List;
            // myAlert = bean.data?.alert as List;
            // myIconId = bean.data?.icon as String;
            myAlertsData = bean.data?.alert as List;
          });
        }
      },
      (error) {},
    );
  }


  @override
  Widget build(BuildContext context) {
    if(flag) {
      _customerList(0, 0, 1, 999, 15, 15, "0:1,3:10");
      var args = ModalRoute.of(context)!.settings.arguments;
      if(args is Map) {
        setState(() {
          pageFrom = args['pageFrom'];
        });
      }
      flag = false;
    }

    return Container();
  }
}
