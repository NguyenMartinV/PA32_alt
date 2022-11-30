import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/bean/customer_list_all_entity.dart';
import 'package:pa32/http/bean/my_cares_customer_detail_entity.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/SPUtil.dart';

class UserHome extends StatefulWidget {
  UserHome({
    Key? key,
  }) : super(key: key);
  bool isRemenber = false;
  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  String callOutTime = '';
  String callComeTime = '';
  bool flag = true;
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

  //customer详情
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
        if (bean.code == 0) {
          setState(() {
            myGivers = bean.data?.giver as List;
            print("emergency");
            print(myEmergency);
            myEmergency = bean.data?.emergency as List;
            myAlert = bean.data?.alert as List;
            myIconId = bean.data?.icon as String;
          });
        }
      },
          (error) {},
    );
  }

  String _durationTransform(int seconds) {
    var d = Duration(seconds: seconds);
    List<String> parts = d.toString().split(':');
    return '${parts[0]}:${parts[1]}:${parts[2].substring(0, 2)}';
  }

  @override
  void initState() {
    super.initState();
    SPUtil.getToken().then(
          (value) => {
        setState(() {
          myToken = value.toString();
        })
      },
    );

    if (flag) {
      _customerList(0, 0, 1, 999, 15, 15, "0:1,3:10");
      flag = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    /* if (myEmergency.isNotEmpty) {
      print("++++++++++116:${myEmergency[0].callTime}");
    } */
    // print("+++++:$myAlert");
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(375, 667),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff73BEFE),
              Color(0xff038BFE),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              //Navigator.popUntil(context, ModalRoute.withName("/MyHomeMap"));
              Navigator.pop(context);
              // Navigator.pushNamed(context, "/MyHomeMap");
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 18,
            )
        ),
        centerTitle: true,
        title: const Text(
          "Cares",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 15.0),
              child: Container(
                width: 18,
                height: 18,
                child: Image.asset("assets/images/cares_add.png"),
              ),
            ),
            onTap: () {
              // print("add Care");
              Navigator.pushNamed(
                context,
                "/ServicePage",
                arguments: {"page": "UserHome"},
              );
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 80,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: 20.0),
        color: Color(0xffF2F2F2),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 140.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffffffff),
                  Color(0xff73BEFE),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
            ),


            if (myCaresData.isNotEmpty)
              Positioned(
                top: 192,
                left: 15,
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 480,
                  padding: EdgeInsets.only(top: 20, bottom: 15),
                  // color: Colors.red,
                  child: ListView(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        // color: Colors.red,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Care Givers / ${myGivers.length}",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Image.asset(
                                      "assets/images/add.png",
                                      fit: BoxFit.cover,
                                      width: 18.r,
                                      height: 18.r,
                                    ),
                                    onTap: () {
                                      /*  print(
                                        "++++++396:${myCaresData[MyswiperIndex].id}",
                                      ); */
                                      SPUtil.save(
                                        "customerIdGiver",
                                        myCaresData[MyswiperIndex].id,
                                      );
                                      Navigator.pushNamed(
                                        context,
                                        "/CareGivers",
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 30.0,
                              height: 70.h,
                              margin: EdgeInsets.only(top: 10.0),
                              padding: EdgeInsets.only(left:21.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                children: List.generate(
                                  myGivers.length,
                                      (index) => Container(
                                    width: (MediaQuery.of(context).size.width -
                                        50.0) /
                                        2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 35.r,
                                          height: 35.r,
                                          margin: EdgeInsets.only(
                                            right: 8.0,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                          child: ClipOval(
                                            child: myGivers[index].icon == "0"
                                                ? Image.asset(
                                              "assets/images/avatar.png",
                                              fit: BoxFit.cover,
                                            )
                                                : Image.network(
                                              '${BaseConfig.API_HOST}file/view?code=userIcon&id=${myGivers[index].icon}&token=Bearer $myToken',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                "${myGivers[index].phone}",
                                                // "00000",
                                                style: TextStyle(fontSize: 14.sp),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                "${myGivers[index].nickname}",
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Color(0xff999999)
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // if (myEmergency.isNotEmpty)
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        margin: EdgeInsets.only(top: 20),
                        // color: Colors.red,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 20, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      // if (myAlert.isNotEmpty)
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
