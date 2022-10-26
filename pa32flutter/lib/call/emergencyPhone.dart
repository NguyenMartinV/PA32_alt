import 'package:flutter/material.dart';
import 'package:pa32/component/common_appbar.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/bean/my_emergency_call_entity.dart';
import 'package:pa32/http/config/BaseConfig.dart';

class EmergencyPhone extends StatefulWidget {
  @override
  State<EmergencyPhone> createState() => _EmergencyPhonePage();
}

class _EmergencyPhonePage extends State<EmergencyPhone> {
  bool flag = true;
  List myEmergency = [];
  String pageFrom = '';
  String costumerId = '';
  _emergencyList(
    int pageNo,
    int pageSize,
    String qry_customerId_eq,
  ) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/emergencyList",
      {
        "pageNo": pageNo,
        "pageSize": pageSize,
        "qry_customerId_eq": qry_customerId_eq,
      },
      (success) {
        MyEmergencyCallEntity bean = MyEmergencyCallEntity.fromJson(success);

        if (bean.code == 0) {
          setState(() {
            myEmergency = bean.data as List;
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

  String _textFun(int code) {
    String result = '';
    switch (code) {
      case 0:
        result =
            "is other reasons to hang up. (Other reason including:The signal is not good or network instability ,or the other party hangs up,and more.)";
        break;
      case 1:
        result = "is taking the initiative to hang up.";
        break;
      case 2:
        result = "is low power to hang up.";
        break;
      case 3:
        result =
            "the call status is successful,whether the phone is answered or not";
        break;
      default:
    }
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (flag) {
      var args = ModalRoute.of(context)!.settings.arguments;
      if (args is Map) {
        setState(() {
          pageFrom = args['pageFrom'];
          if (args['customerId'] != null) {
            costumerId = args['customerId'];
          } else {
            costumerId = '';
          }
        });
      }
      _emergencyList(1, 999, costumerId);
      flag = false;
    }
    return CommonAppBar(
      bgColor:  const Color(0xffF2F2F2),
      title: "Emergency Call",
      body: Column(
        children: [
          myEmergency.isNotEmpty
              ? Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: MediaQuery.of(context).size.height - 200,
                  margin: EdgeInsets.only(left: 15, top: 30),
                  padding: EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    children: List.generate(
                      myEmergency.length,
                      (index) => Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                          border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 231, 231, 231)),
                          ),
                        ),
                        child: Column(
                          children: [
                            myEmergency[index].callStatus == 1
                                ? Container(
                                    width:
                                        MediaQuery.of(context).size.width - 90,
                                    // color: Colors.red,
                                    padding: EdgeInsets.only(top: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 12,
                                              height: 12,
                                              margin: EdgeInsets.only(right: 5),
                                              child: Image.asset(
                                                myEmergency[index].callType == 0
                                                    ? "assets/images/call.png"
                                                    : "assets/images/dial.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              "${myEmergency[index].phone}",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 12,
                                              height: 12,
                                              margin: EdgeInsets.only(right: 5),
                                              child: Image.asset(
                                                "assets/images/duration.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              constraints: BoxConstraints(
                                                  minWidth: 0, maxWidth: 100),
                                              child: Text(
                                                _durationTransform(
                                                    myEmergency[index]
                                                        .callDuration),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                : Container(
                                    width:
                                        MediaQuery.of(context).size.width - 90,
                                    // color: Colors.red,
                                    padding: EdgeInsets.only(top: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 12,
                                              height: 12,
                                              margin: EdgeInsets.only(right: 5),
                                              child: Image.asset(
                                                myEmergency[index].callType == 0
                                                    ? "assets/images/call_dafult.png"
                                                    : "assets/images/dial_dafult.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              "${myEmergency[index].phone}",
                                              style: TextStyle(
                                                color: Color(0xffF38484),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              constraints: BoxConstraints(
                                                  minWidth: 0, maxWidth: 100),
                                              child: Text(
                                                _textFun(myEmergency[index]
                                                    .callFailReason),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xffF28181),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Icon(
                                                Icons.error,
                                                size: 18,
                                                color: Color(0xffF28181),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                            Container(
                              padding: EdgeInsets.only(left: 16),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "${myEmergency[index].callTime.substring(5, 16)}",
                                style: TextStyle(
                                  color: Color(0xffB2B2B2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(
                  width: MediaQuery.of(context).size.width - 30,
                  margin: EdgeInsets.only(left: 15, top: 20),
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("No emergency call record"),
                ),
        ],
      ),
    );
  }
}
