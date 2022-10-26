import 'package:flutter/material.dart';
import 'package:pa32/component/common_appbar.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/bean/care_givers_detail_entity.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/SPUtil.dart';

class CareGivers extends StatefulWidget {
  @override
  State<CareGivers> createState() => _CareGiversState();
}

class _CareGiversState extends State<CareGivers> {
  bool flag = true;
  String customerId = '';
  List myGiver = [];
  String userId = '';

  //获取customer Detail列表
  _customerDetail(
    String customerId,
    int mask,
    int arrayMask,
    String count,
  ) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/customerDetail",
      {
        "customerId": customerId,
        "mask": mask,
        "arrayMask": arrayMask,
        "count": count,
      },
      (success) {
        CareGiversDetailEntity bean = CareGiversDetailEntity.fromJson(success);

        if (bean.code == 0) {
          setState(() {
            myGiver = bean.data?.giver as List;
          });
          // print("---38--------:$myGiver");
        }
      },
      (error) {},
    );
  }

  _giverDel(String id) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/giverDel",
      {"id": id},
      (success) {
        if (success['code'] == 0) {
          Navigator.pushNamed(context, "/CareGivers");
        }
        CommonToast.showToast(success['msg']);
      },
      (error) {
        CommonToast.showToast(error);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (flag) {
      SPUtil.get("customerIdGiver").then(
        (value) => {
          // print(value)
          _customerDetail("$value", 15, 15, "0:1,3:10"),
        },
      );
      SPUtil.get("userId").then(
        (value) => {
          setState(() {
            userId = value.toString();
          })
        },
      );
      flag = false;
    }
    return CommonAppBar(
      bgColor:  const Color(0xffF2F2F2),
      title: "Care Givers",
      actions: [
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.add_circle_outline,
              size: 25.0,
            ),
          ),
          onTap: () {
            // print("Care Givers");
            Navigator.pushNamed(context, "/AddGiverPage");
          },
        )
      ],
      body: Column(
        children: List.generate(
          myGiver.length,
          (index) => Container(
            // padding: EdgeInsets.only(top: 10, bottom: 10),
            width: MediaQuery.of(context).size.width - 30,
            margin: EdgeInsets.only(left: 15, top: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage("assets/images/avatar.png"),
                      width: 35,
                      height: 35,
                      fit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 220,
                          padding: EdgeInsets.only(left: 8),
                          // color: Colors.red,
                          child: Text(
                            "${myGiver[index].phone}",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          width: 220,
                          padding: EdgeInsets.only(left: 8),
                          // color: Colors.red,
                          child: Text(
                            myGiver[index].nickname,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0x99222222)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  child: Container(
                    width: 40,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color(0xffFACECE),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/delete.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    print("${myGiver[index].id}");
                    if (userId == myGiver[index].id) {
                      CommonToast.showToast(
                        "The current user cannot be deleted",
                      );
                      return;
                    } else {
                      _giverDel("${myGiver[index].id}");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
