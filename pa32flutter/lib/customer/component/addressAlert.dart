import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pa32/component/common_appbar.dart';
import 'package:pa32/utils/DataUtils.dart';

class addressAlertPage extends StatefulWidget {
  @override
  State<addressAlertPage> createState() => _customerAddressPgae();
}

class _customerAddressPgae extends State<addressAlertPage> {
  bool flag = true;
  LatLng _MyGooglePlex = LatLng(30.653455732131118, 104.06917910514069);
  late GoogleMapController mapController;
  List<Marker> customMarkers = [];
  var myAlert;
  String pageWhere = '';
  String deviceNo = '';
  String alarmContent = '';
  String alarmTime = '';
  String alarmTypeName = '';
  int alarmType = 0;
  BitmapDescriptor? beginIcon;
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  MapType _mapType = MapType.normal;
  var earth = Image.asset("assets/images/default_earth.png", //地球图标
      width: 20,
      height: 20);
  var location = Image.asset("assets/images/location.png", //定位图标
      width: 20,
      height: 20);

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
  Widget _typeFun(int code) {
    Widget result = Container();
    switch (code) {
      case 0:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/Overspeed.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 2:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/highTemperature.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 3:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/powerOutage.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 4:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/removeDevice.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 6:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/ExitFence.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 7:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/EnterFence.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 10:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/BatteryLow.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 11:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/SOS.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 12:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/MotionStart.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 13:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/MotionStop.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 14:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/OnCharge.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 15:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/OffCharge.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 16:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/PowerOn.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 17:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/PowerOff.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 18:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/IgnitionOn.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 19:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/IgnitionOff.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 20:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/LowTemperature.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 21:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/HighHumidity.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;
      case 22:
        result = Container(
          child: Row(
            children: [
              Text(
                "${alarmTypeName}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff72D9C9),
                ),
              ),
              Container(
                width: 15,
                height: 16,
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "assets/images/LowHumidity.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
        break;

      default:
    }
    return result;
  }

  void infoWindow(String deviceId, LatLng latLng) {
    _customInfoWindowController.addInfoWindow!(
      Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 135,
        margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
        padding: EdgeInsets.only(left: 5, right: 2, top: 4, bottom: 4),
        decoration: BoxDecoration(
          // color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Color(0xff666666).withOpacity(0.3),
              offset: Offset(
                0,
                0,
              ),
              blurRadius: 8.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Container(
          width: 250,
          height: 83,
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mapBg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$deviceNo",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff333333),
                      ),
                    ),
                    Row(
                      children: [
                        _typeFun(alarmType),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  "${alarmContent}",
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                    color: Color(0xffADADAD),
                  ),
                ),
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    Text(
                      "${alarmTime}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffADADAD),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      latLng,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (flag) {
      var args = ModalRoute.of(context)!.settings.arguments;

      if (args != null && args is Map) {
        setState(() {
          pageWhere = args['pageWhere'];
          myAlert = args['currentData'];
          deviceNo = myAlert.deviceNo;
          alarmContent = myAlert.alarmContent;
          alarmTime = myAlert.alarmTime;
          alarmTypeName = myAlert.alarmTypeName;
          alarmType = myAlert.alarmType;
          _MyGooglePlex = LatLng(myAlert.lat, myAlert.lng);
        });

        Utils.getBytesFromAsset('assets/images/positionMax.png', 127, 128)
            .then((d) {
          setState(() {
            customMarkers.add(
              Marker(
                markerId: MarkerId(myAlert.deviceId),
                icon: BitmapDescriptor.fromBytes(d),
                position: _MyGooglePlex,
              ),
            );
          });
        });
      }
      flag = false;
    }
    return CommonAppBar(
      bgColor:  const Color(0xffF2F2F2),
      title: "Alerts",
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  myLocationButtonEnabled:false,
                  zoomControlsEnabled: false,
                  markers: customMarkers.toSet(),
                  onMapCreated: onMapCreated,
                  mapType: _mapType,
                  initialCameraPosition: CameraPosition(
                    target: _MyGooglePlex,
                    zoom: 16,
                  ),
                  onCameraMove: (position) {
                    if (_customInfoWindowController.onCameraMove != null) {
                      _customInfoWindowController.onCameraMove!();
                    }
                  },
                ),
                Positioned(
                  left: 12,
                  bottom: 250,
                  child:
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          mapController.animateCamera(
                              CameraUpdate.newLatLngZoom(
                                  LatLng(_MyGooglePlex.latitude, _MyGooglePlex.longitude), 16));
                        },
                        onTapDown: (tapDownDetails) {
                          setState(() {
                            location = Image.asset(
                                "assets/images/this_location.png",
                                width: 18,
                                height: 18);
                          });
                        },
                        onTapUp: (tapUpDetails) {
                          setState(() {
                            location = Image.asset(
                                "assets/images/location.png",
                                width: 18,
                                height: 18);
                          });
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
                            child: location,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
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
                    ],
                  )
                ),
                CustomInfoWindow(
                  controller: _customInfoWindowController,
                  height: 83,
                  width: 250,
                  offset: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _customInfoWindowController.googleMapController = controller;
    LatLng _kGooglePlex = new LatLng(
      myAlert.lat,
      myAlert.lng,
    );
    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(_kGooglePlex, 16),
    );
    infoWindow(myAlert.deviceId, _MyGooglePlex);
  }

  /* //搜索地址方法
  _customerAddress(String address) async {
    try {
      List<Location> list = await locationFromAddress(address);
      print(list);
      mapController.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(list[0].latitude, list[0].longitude), 16));
    } catch (e) {
      CommonToast.showToast("Can not find any address");
    }
  } */
}
