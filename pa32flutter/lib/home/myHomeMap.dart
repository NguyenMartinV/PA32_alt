import 'dart:math';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/bean/customer_list_all_entity.dart';
import 'package:pa32/http/bean/my_cares_customer_detail_entity.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/DataUtils.dart';
import 'package:pa32/utils/SPUtil.dart';

import '../component/common_toast.dart';

class MyHomeMap extends StatefulWidget {
  @override
  State<MyHomeMap> createState() => _MyHomeMapPage();
}

class _MyHomeMapPage extends State<MyHomeMap> {
  late GoogleMapController mapController;
  bool isMapVisible = false;
  bool flag = true;
  bool myCountFlag = false;
  String myPhone = '';
  String imgSrc = '';
  String showIconId = '';
  String userImgSrc = '';
  String myIconId = "";
  String myToken = "";
  String myUserId = "";
  String myUserIcon = "";
  final ImagePicker _picker = ImagePicker();
  String callOutTime = '';
  String callComeTime = '';
  int myCount = 0;
  int mySwiperIndex = 0;
  LatLng _kGooglePlex = LatLng(37.42796133580664, -122.085749655962);
  String myCustomerId = '';
  List<CustomerListAllData> myHomeList = [];
  List myGpsList = [];
  List myEmergencyList = [];
  List myAlertList = [];
  List<Marker> customMarkers = [];
  String gpsAddress = "";
  MapType _mapType = MapType.normal;
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  var earth = Image.asset("assets/images/default_earth.png", //地球图标
      width: 20,
      height: 20);

  //获取设备地址
  Future<String> _getAddress(LatLng latLng) async {
    List<Placemark> p = await placemarkFromCoordinates(
        latLng.latitude, latLng.longitude,
        localeIdentifier: "en");
    Placemark place = p[0];
    return
      "${place.street} ${place.locality}, ${place.administrativeArea},${place.postalCode},${place.isoCountryCode}";
    // setState(() {
    //   address = _currentAddress;
    // });
  }

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
        // print(success);
        CustomerListAllEntity bean = CustomerListAllEntity.fromJson(success);
        // print("This is the bean");
        // print(bean);

        if (bean.code == 0 && bean.data != null) {
          myHomeList.clear();
          myHomeList.addAll(bean.data!);
          if (myHomeList.isNotEmpty) {
            setState((){
              if(myHomeList[0].gps != null && myHomeList[0].gps!.isNotEmpty){
                _getAddress(LatLng(myHomeList[0].gps![0].lat!,myHomeList[0].gps![0].lng!)).then((value) => {
                  setState(() {
                    gpsAddress = value;
                  })
                });
              }
              showIconId = myHomeList[0].icon as String;
              callOutTime = myHomeList[0].callOutTime ?? "";
              callComeTime = myHomeList[0].callComeTime ?? "";
              myCount = myHomeList.length;
              myGpsList = myHomeList[0].gps ?? [];
              myEmergencyList = myHomeList[0].emergency ?? [];
              myAlertList = myHomeList[0].alert ?? [];
              SPUtil.getToken().then(
                (value) => {
                  setState(() {
                    imgSrc =
                        '${BaseConfig.API_HOST}file/view?code=userIcon&id=$showIconId&token=Bearer $value';
                  })
                },
              );
              if (myGpsList.isNotEmpty) {
                LatLng _kGooglePlex = new LatLng(
                  myGpsList[0].lat,
                  myGpsList[0].lng,
                );
                mapController.animateCamera(
                  CameraUpdate.newLatLngZoom(_kGooglePlex, 16),
                );
                Utils.getBytesFromAsset(
                        'assets/images/positionMax.png', 127, 128)
                    .then((d) {
                  setState(() {
                    customMarkers.add(
                      Marker(
                        markerId: MarkerId("146564654564"),
                        icon: BitmapDescriptor.fromBytes(d),
                        position: _kGooglePlex,
                      ),
                    );
                  });
                });
              }
            });
            // print("75+++++++:${callOutTime + '--' + callComeTime}");
          } else {}
        }
      },
      (error) {
        CommonToast.showToast(error);
      },
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
      (success) async {
        setState(() {
          gpsAddress = "";
        });
        MyCaresCustomerDetailEntity bean =
            MyCaresCustomerDetailEntity.fromJson(success);
        if (bean.code == 0) {
          customMarkers.clear();
          var myHomeDetailList = bean.data;
          if(myHomeDetailList != null && myHomeDetailList.gps != null && myHomeDetailList.gps!.isNotEmpty){
            _getAddress(LatLng(myHomeDetailList.gps![0].lat!,myHomeDetailList.gps![0].lng!)).then((value) => {
              setState(() {
                gpsAddress = value;
              })
            });

          }
          List myTT = myHomeDetailList?.gps as List;
          setState(() {
            myGpsList = myTT;
            showIconId = myHomeDetailList?.icon as String;
          });
          SPUtil.getToken().then(
            (value) => {
              setState(() {
                imgSrc =
                    '${BaseConfig.API_HOST}file/view?code=userIcon&id=$showIconId&token=Bearer $value';
              })
            },
          );

          if (myHomeDetailList?.callComeTime != null) {
            setState(() {
              callComeTime = myHomeDetailList?.callComeTime as String;
            });
          }
          if (myHomeDetailList?.callOutTime != null) {
            setState(() {
              callOutTime = myHomeDetailList?.callOutTime as String;
            });
          }

          if (myGpsList.isNotEmpty) {
            LatLng _kGooglePlex = new LatLng(
              myGpsList[0].lat,
              myGpsList[0].lng,
            );
            mapController.animateCamera(
              CameraUpdate.newLatLngZoom(_kGooglePlex, 16),
            );

            Utils.getBytesFromAsset('assets/images/positionMax.png', 127, 128)
                .then((d) {
              setState(() {
                customMarkers.add(
                  Marker(
                    markerId: MarkerId("146564654564"),
                    icon: BitmapDescriptor.fromBytes(d),
                    position: _kGooglePlex,
                  ),
                );
              });
            });
          }
        } else {
          CommonToast.showToast(success['msg']);
        }
      },
      (error) {
        CommonToast.showToast(error);
      },
    );
  }

//修改giver信息
  _giverMod(String id, String icon, int mask) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/giverMod",
      {
        "id": id,
        "icon": icon,
        "mask": mask,
      },
      (success) {
        if (success['code'] == 0) {
          Navigator.pushNamed(context, "/MyHomeMap");
        } else {
          CommonToast.showToast(success['msg']);
        }
      },
      (error) {},
    );
  }

//判断gps剩余电量
  Widget _batteryPower(int pwor) {
    Widget myPower = Container();
    if (pwor < 1) {
      myPower = Container(
        child: Image(
          image: AssetImage("assets/images/battery_no.png"),
          width: 18,
          height: 10,
          fit: BoxFit.fill,
        ),
      );
    } else if (pwor >= 1 && pwor <= 20) {
      myPower = Container(
        child: Image(
          image: AssetImage("assets/images/battery_low.png"),
          width: 18,
          height: 10,
          fit: BoxFit.fill,
        ),
      );
    } else if (pwor > 20 && pwor <= 40) {
      myPower = Container(
        child: Image(
          image: AssetImage("assets/images/battery_forty.png"),
          width: 18,
          height: 10,
          fit: BoxFit.fill,
        ),
      );
    } else if (pwor > 40 && pwor <= 60) {
      myPower = Container(
        child: Image(
          image: AssetImage("assets/images/battery_center.png"),
          width: 18,
          height: 10,
          fit: BoxFit.fill,
        ),
      );
    } else if (pwor > 60 && pwor <= 80) {
      myPower = Container(
        child: Image(
          image: AssetImage("assets/images/battery_eighty.png"),
          width: 18,
          height: 10,
          fit: BoxFit.fill,
        ),
      );
    } else if (pwor > 80 && pwor <= 100) {
      myPower = Container(
        child: Image(
          image: AssetImage("assets/images/battery_high.png"),
          width: 18,
          height: 10,
          fit: BoxFit.fill,
        ),
      );
    }
    return myPower;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SPUtil.get("myPhoneText").then(
      (value) => {
        setState(() {
          myPhone = value.toString();
        })
      },
    );
    SPUtil.getToken().then(
      (value) => {
        setState(() {
          myToken = value.toString();
        })
      },
    );
    SPUtil.get("myUserIcon").then(
      (value) => {
        setState(() {
          myUserIcon = value.toString();
          userImgSrc =
              '${BaseConfig.API_HOST}file/view?code=userIcon&id=$value&token=Bearer $myToken';
        })
      },
    );
    SPUtil.get("userId").then(
      (value) => {
        setState(() {
          myUserId = value.toString();
        })
      },
    );
  }

  //切换地图类型
  void _changeMapType() {
    var imgSrc = "";
    var newMapType = MapType.normal;
    if (_mapType == MapType.normal) {
      imgSrc = "check";
      newMapType = MapType.hybrid;
    } else {
      imgSrc = "default";
      newMapType = MapType.normal;
    }
    setState(() {
      _mapType = newMapType;
      earth = Image.asset("assets/images/${imgSrc}_earth.png",
          width: 18, height: 18);
    });
  }

  _setAvatar([String? type]) async {
    Navigator.pop(context);
    if (type == "camera") {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        _uploadImg(photo);
      }
    } else if (type == "album") {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _uploadImg(image);
      }
    }
  }

  _uploadImg(XFile image) async {
    String path = image.path;
    String name = path.substring(path.lastIndexOf("/") + 1, path.length);
    String suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    FormData formData = FormData.fromMap({
      // "withLoading": false, //这里写其他需要传递的参数
      "file": await MultipartFile.fromFile(path,
          filename: name, contentType: MediaType('image', suffix)),
    });

    var token = await SPUtil.getToken();
    // print("++++99+++:$formData");
    DioManager().upload(
        BaseConfig.API_HOST + "file/upload?code=userIcon&token=Bearer $token",
        formData, (it) {
      // print("++++++++++103:$it");
      if (it["code"] == 0) {
        var data = it["data"];
        var iconId = data["id"];

        setState(() {
          myIconId = iconId;
          userImgSrc =
              '${BaseConfig.API_HOST}file/view?code=userIcon&id=$iconId&token=Bearer $token';
        });

        CommonToast.showToast("Update user avatar successfully");
        // 更新用户头像信息并保存
        SPUtil.save("myUserIcon", myIconId);
        _giverMod(myUserId, myIconId, 2);
        return;
      }
    }, (error) {
      CommonToast.showToast("Request error");
    });
  }

  Future _openModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 170.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Camera', textAlign: TextAlign.center),
                  onTap: () {
                    _setAvatar("camera");
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xfff2f2f2), width: 0.5),
                      bottom: BorderSide(color: Color(0xfff2f2f2), width: 0.5),
                    ),
                  ),
                  child: ListTile(
                    title: Text('Album', textAlign: TextAlign.center),
                    onTap: () {
                      _setAvatar("album");
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Cancel',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    _setAvatar();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // print("开始加载home页面");
    // print("++++50+++:${myCustomerId is String}");
    if (flag) {
      var args = ModalRoute.of(context)!.settings.arguments;
      if (args != null && args is Map) {}
      _customerList(0, 0, 1, 999, 15, 15, "{0:1,3:10}");
      flag = false;
    }
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xff2A3035),
        child: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  width: 15,
                  height: 12,
                  // color: Colors.red,
                  margin: EdgeInsets.only(
                    left: 250.0,
                  ),
                  child: Image.asset("assets/images/fold.png"),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 50.0,
                  left: 40.0,
                  right: 20.0,
                  bottom: 70.0,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _openModalBottomSheet();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.only(
                          right: 12.0,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: myUserIcon == "0"
                              ? Image.asset(
                                  "assets/images/avatar.png",
                                  fit: BoxFit.fill,
                                )
                              : Image.network(userImgSrc, fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Text(
                      "${myPhone}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 20.0,
                ),
                child: ListView.separated(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    Widget LeftIcon = Container();
                    String leftText = "";
                    switch (index) {
                      case 0:
                        myCountFlag = true;
                        leftText = "Cares";
                        LeftIcon = Container(
                          width: 17,
                          height: 19,
                          child: Image.asset(
                            "assets/images/me_cares.png",
                            fit: BoxFit.fill,
                          ),
                        );
                        break;
                      case 1:
                        leftText = "Emergency Call";
                        myCountFlag = false;
                        LeftIcon = Container(
                          width: 16,
                          height: 13,
                          child: Image.asset(
                            "assets/images/me_sos.png",
                            fit: BoxFit.fill,
                          ),
                        );
                        break;
                      case 2:
                        myCountFlag = false;
                        leftText = "Alerts";
                        LeftIcon = Container(
                          width: 15,
                          height: 15,
                          child: Image.asset(
                            "assets/images/me_alert_x2.png",
                            fit: BoxFit.fill,
                          ),
                        );
                        break;
                      case 3:
                        myCountFlag = false;
                        leftText = "Password";
                        LeftIcon = Container(
                          width: 13,
                          height: 15,
                          child: Image.asset(
                            "assets/images/password2.png",
                            fit: BoxFit.fill,
                          ),
                        );
                        break;
                      case 4:
                        myCountFlag = false;
                        leftText = "About";
                        LeftIcon = Container(
                          width: 16,
                          height: 16,
                          child: Image.asset(
                            "assets/images/about_x2.png",
                            fit: BoxFit.fill,
                          ),
                        );
                        break;
                      case 5:
                        myCountFlag = false;
                        leftText = "Bluetooth";
                        LeftIcon = Container(
                          width: 16,
                          height: 16,
                          child: Image.asset(
                            "assets/images/about_x2.png",
                            fit: BoxFit.fill,
                          ),
                        );
                        break;
                    }
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 15.0,
                      ),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                /* Image(
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.contain,
                                image: AssetImage("assets/images/avatar.png"),
                              ), */
                                LeftIcon,
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    leftText,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                if (myCountFlag)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      "${myCount}",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Color(0xffA0A3A5),
                                  size: 25.0,
                                )
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          if (index == 0) {
                            if (myCount <= 0) {
                              Scaffold.of(context).openDrawer();
                              CommonToast.showCenterTipsAlter(
                                context,
                                () {},
                                "Tips",
                                "You have not activated the Wecareservice, please activate it.",
                              );
                            } else {
                              Navigator.pushNamed(
                                context,
                                "/CaresPage",
                                arguments: {"page": "MyHomeMap"},
                              );
                            }
                          }
                          if (index == 1) {
                            if (myCount <= 0) {
                              Scaffold.of(context).openDrawer();
                              CommonToast.showCenterTipsAlter(
                                context,
                                () {},
                                "Tips",
                                "You have not activated the Wecareservice, please activate it.",
                              );
                            } else {
                              Navigator.pushNamed(
                                context,
                                "/EmergencyPhone",
                                arguments: {"pageFrom": "MyHomeMap"},
                              );
                            }
                          }
                          if (index == 2) {
                            if (myCount <= 0) {
                              Scaffold.of(context).openDrawer();
                              CommonToast.showCenterTipsAlter(
                                context,
                                () {},
                                "Tips",
                                "You have not activated the Wecareservice, please activate it.",
                              );
                            } else {
                              Navigator.pushNamed(
                                context,
                                "/AlertsPage",
                                arguments: {"pageFrom": "MyHomeMap"},
                              );
                            }
                          }
                          if (index == 3) {
                            Navigator.pushNamed(
                              context,
                              "/ResetPassword",
                            );
                          }
                          if (index == 4) {

                            Navigator.pushNamed(
                              context,
                              "/AboutPage",
                            );
                          }
                          if (index == 5) {
                            Navigator.pushNamed(
                              context,
                              "/DevicesPage",
                            );
                          }
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 2.0,
                      color: Color(0xff5B6166),
                      // indent: 20.0,
                    );
                  },
                  shrinkWrap: true,
                ),
              ),
              // )
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: GestureDetector(
                        onTap: () {
                          // print("log out");
                          // Navigator.pop(context);
                          Navigator.pushNamed(context, "/LoginPage");
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 19,
                              height: 16,
                              child: Image.asset(
                                "assets/images/logout.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7.0),
                              child: Text(
                                "Log out",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xffA0A3A5),
                                  wordSpacing: 2.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),


      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                AnimatedOpacity(
                  curve: Curves.fastOutSlowIn,
                  opacity: isMapVisible ? 1.0 : 0,
                  duration: Duration(milliseconds: 600),
                  child: GoogleMap(
                    myLocationButtonEnabled:false,
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: false,
                    markers: customMarkers.toSet(),
                    onMapCreated: onMapCreated,
                    mapType: _mapType,
                    initialCameraPosition: CameraPosition(
                      target: _kGooglePlex,
                      zoom: 16,
                    ),
                  ),
                ),

                myCount == 0
                    ? Positioned(
                        left: 10.0,
                        bottom: 10.0,
                        child: ActivateCon(),
                      )
                    : Positioned(
                        left: 12.0,
                        right: 12.0,
                        bottom: 16.0,
                        child: Container(
                          height: 170,
                          padding: EdgeInsets.only(
                            top: 18.0,
                            left: 12.0,
                            right: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Swiper(
                            loop: false,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          child: showIconId == '0'
                                              ? Image.asset(
                                                  "assets/images/avatar.png",
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.network(
                                                  imgSrc,
                                                  fit: BoxFit.fill,
                                                ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${myHomeList[index].nickname}",
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          Text(
                                            "${myHomeList[index].deviceNo}",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xff666666)
                                            ),
                                          ),
                                        ],
                                      ),

                                      Expanded(
                                        child:Container(
                                          margin: EdgeInsets.only(right:10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              myGpsList.isNotEmpty
                                                  ? _batteryPower(
                                                myGpsList[0].batteryPower,
                                              )
                                                  : Container(
                                                width: 16,
                                                height: 10,
                                                // color: Colors.red,
                                                child: Image.asset(
                                                  "assets/images/battery_high.png",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              if (myGpsList.isNotEmpty)
                                                Text(
                                                  "${myGpsList[0].batteryPower}%",
                                                  style: TextStyle(
                                                      color: Color(0xff69DE7D),
                                                      fontSize: 12
                                                  ),
                                                ),
                                            ],
                                          )
                                        )

                                      )

                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10, bottom: 6),
                                    // color: Colors.blue,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    "assets/images/focus.png"),
                                                width: 12,
                                                height: 13,
                                                fit: BoxFit.fill,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "${myHomeList[mySwiperIndex].giversCount}",
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child:Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                  "assets/images/call.png",
                                                ),
                                                width: 12,
                                                height: 12,
                                                fit: BoxFit.fill,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              if (callComeTime.isNotEmpty)
                                                Text(
                                                  "${callComeTime.substring(5, 16)}",
                                                ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child:Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                  "assets/images/dial.png",
                                                ),
                                                width: 12,
                                                height: 12,
                                                fit: BoxFit.fill,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              if (callOutTime.isNotEmpty)
                                                Text(
                                                  "${myHomeList[0].callOutTime!.substring(5, 16)}",
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 0.5, //宽度
                                          color: Color.fromARGB(
                                              255, 204, 202, 202), //边框颜色
                                        ),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(top: 6, bottom: 6),
                                    padding: EdgeInsets.only(
                                      bottom: 6,
                                    ),
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/alarm.png"),
                                          width: 18,
                                          height: 18,
                                          fit: BoxFit.fill,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        if (myAlertList.isNotEmpty)
                                          Text(
                                            "${myAlertList[0].alarmTime.substring(5, 16)}",
                                          ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        if (myAlertList.isNotEmpty)
                                          Text(
                                            "${myAlertList[0].alarmTypeName}",
                                          ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(top: 6, bottom: 6),
                                    // color: Colors.black,
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/map.png"),
                                          width: 18,
                                          height: 18,
                                          fit: BoxFit.fill,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            gpsAddress,
                                            maxLines: 1,
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: myCount,
                            onIndexChanged: (index) {
                              setState(() {
                                mySwiperIndex = index;
                                myCustomerId = myHomeList[index].id ?? "";
                              });
                              _customerDetail(myCustomerId, 15, 15, "0:1,3:10");
                            },
                          ),
                        ),
                      ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 20 * myCount) / 2,
                  bottom: 190,
                  child: Container(
                    width: myCount * 20,
                    height: 10,
                    // color: Colors.red,
                    child: Row(
                      children: List.generate(
                        myCount,
                        (index) => Container(
                          width: 10,
                          height: 10,
                          margin: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                            color: index == mySwiperIndex
                                ? Color(0xff028AFE)
                                : Color(0xffC2C2C2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // if (1 > 2)
                Positioned(
                  left: 12,
                  bottom: 280,
                  child: GestureDetector(
                    onTap: () {
                      _changeMapType();
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(
                              0,
                              0,
                            ),
                            blurRadius: 8.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: earth,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _customInfoWindowController.googleMapController = controller;
    Future.delayed(
        const Duration(milliseconds: 550),
            () => setState(() {isMapVisible = true;}));
  }
}

class ActivateCon extends StatefulWidget {
  @override
  State<ActivateCon> createState() => _ActivateConPage();
}

class _ActivateConPage extends State<ActivateCon> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(375, 667),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Container(
      width: MediaQuery.of(context).size.width - 20.0,
      height: 150,
      padding: EdgeInsets.only(
        top: 18.0,
        bottom: 23.0,
        left: 16.0,
        right: 16.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
              ),
              Container(
                width: 226.0,
                margin: EdgeInsets.only(left: 17.0),
                child: Text(
                  "Please activate your device for the  Wecare service.",
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ],
          ),
          Container(
            width: 320.0,
            height: 40.0,
            margin: EdgeInsets.only(top: 13.0),
            decoration: BoxDecoration(
              color: Color(0xff028AFE),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Text(
                "Activate",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.white, height: 2),
              ),
              onTap: () {
                print("Activate");
                Navigator.pushNamed(
                  context,
                  "/ServicePage",
                  arguments: {"page": "MyHomeMap"},
                );
              },
            ),
          ),
        ],
      ),
    );
  }


}
