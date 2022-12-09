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
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // List myCaresData = [];
  // List myGivers = [];
  // List myEmergency = [];
  // List myAlert = [];
  // String myToken = '';
  // String myIconId = '';
  // String myUserId = '';
  // String token = '';
  // int MyswiperIndex = 0;

  bool flag = true;
  int swiperIndex = 0;
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
        // myEmergency.clear();
        // myAlert.clear();

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

    return Center(
      child: Column(
        children: [
          if(myCustomerData.isNotEmpty)
            Container(
              width: 260,
              height: 80,
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Swiper(
                loop: false,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 10),
                    child: Container(
                      width: 100,
                      child: Row(
                        children: [
                          Container(
                            width: 19, height: 40,
                            margin: EdgeInsets.only(right: 5),
                            child: Image(
                              image: AssetImage("assets/images/pa32.png"),
                              fit: BoxFit.cover,
                            ),
                          ),

                          Column(
                            children: [
                              Container(
                                width: 190,
                                margin: EdgeInsets.only(top: 5, bottom: 5, left: 5),
                                child: Text(
                                  "${myCustomerData[swiperIndex].nickname}",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),

                              Container(
                                width: 190,
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Device No. ${myCustomerData[swiperIndex].deviceNo}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff999999),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: myCustomerData.length,
                onIndexChanged: (Value) {
                  setState(() {
                    swiperIndex = Value;
                  });

                  _customerDetail(myCustomerData[swiperIndex].id, 15, 15, "0:1,3:10");
                },
              ),
            ),

          if(myCustomerData.isNotEmpty)
            Container(
              width: myCustomerData.length * 15,
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                children: List.generate(myCustomerData.length, (index) => Container(
                  width: 9, height: 9,
                  margin: EdgeInsets.only(left: 3, right: 3),
                  decoration: BoxDecoration(
                    color: swiperIndex == index
                        ? Color(0xff028AFE)
                        : Color(0xffC2C2C2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                )),
              ),
            ),

          myAlertsData.isNotEmpty
            ? Container(
            width: 350, height: 500,
            child: ListView(
              children: List.generate(myAlertsData.length, (index) => Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 18, height: 18,
                                margin: EdgeInsets.only(right: 10),
                                child: Image(
                                  image: AssetImage("assets/images/alarm.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Text("${myAlertsData[index].alarmTime.substring(5, 16)}"),
                              SizedBox(width: 10,),
                              Text("${myAlertsData[index].alarmTypeName}"),
                            ],
                          ),

                          if(myAlertsData[index].lng != null)
                            GestureDetector(
                              child: Container(
                                width: 15, height: 16,
                                margin: EdgeInsets.only(right: 5),
                                child: Image(
                                  image: AssetImage("assets/images/map.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  "addressAlertPage",
                                  arguments: {
                                    "currentData": myAlertsData[index],
                                    "pageWhere": "AlertPage"
                                  },
                                );
                              },
                            )
                        ],
                      ),
                    ),

                    Container(
                      width: 265,
                      child: Text(
                        "${myAlertsData[index].alarmContent}",
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff999999),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ),
          )
              : Text("No Alert Information"),

        ],
      ),
    );
  }
}
