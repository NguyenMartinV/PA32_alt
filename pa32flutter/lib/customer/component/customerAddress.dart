import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pa32/component/common_appbar.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/DataUtils.dart';
import 'package:pa32/utils/SPUtil.dart';

import '../../component/common_toast.dart';

class customerAddress extends StatefulWidget {
  @override
  State<customerAddress> createState() => _customerAddressPgae();
}

class _customerAddressPgae extends State<customerAddress> {
  bool flag = true;
  String customerId = '';
  LatLng _MyGooglePlex = LatLng(37.42796133580664, -122.085749655962);
  late GoogleMapController mapController;
  var searchText = TextEditingController();
  List<Marker> customMarkers = [];
  LatLng? pos;
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
          Navigator.pop(context);
        }else {
          CommonToast.showToast(success["msg"]);
        }
      },
      (error) {},
    );
  }

  _getPosition() async {
    LatLng pos = await Utils.determinePosition();
    setState(() {
      _MyGooglePlex = pos;
      mapController.animateCamera(CameraUpdate.newLatLngZoom(pos, 16));
    });
  }

  onMapTap(position) {
    pos = position;
    setState(() {
      customMarkers.add(Marker(
        markerId: MarkerId("pos"),
        position: position,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (flag) {
      var args = ModalRoute.of(context)!.settings.arguments;

      if (args != null && args is Map) {
        // print("-------------:${args}");
        /*  setState(() {
          customerId = args['customerId'];
        }); */
      }
      // print("最新保存：$customerId");
      flag = false;
    }
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
            onTap: () async {
              if(pos == null){
                CommonToast.showToast("Please tap map to select a position");
                return;
              }
              String address = await _getAddress(pos!);
              SPUtil.get("onlyCustomerId").then(
                (value) => {_customerMod("$value", 6, address)},
              );

              // print("-----------------:$customerId");
              // Navigator.pushNamed(context, "/CaresPage");
            },
          )
        ],
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: onMapCreated,
                  mapType: MapType.terrain,
                  markers: customMarkers.toSet(),
                  initialCameraPosition: CameraPosition(
                    target: _MyGooglePlex,
                    zoom: 16,
                  ),
                  onTap: onMapTap,
                ),
                Positioned(
                  top: 12,
                  left: 11,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 22.0,
                    height: 40.0,
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.2, color: Color(0xffC4C4C4)),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 220,
                          height: 40.0,
                          child: TextField(
                            controller: searchText,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Please enter the location",
                              hintStyle: TextStyle(
                                color: Color(0xff97979F),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Container(
                            width: 17,
                            height: 16,
                            child: Image.asset(
                              "assets/images/address_search.png",
                            ),
                          ),
                          onTap: () {
                            // print("search");
                            _customerAddress(searchText.text);
                          },
                        ),
                      ],
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

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _getPosition();
  }

  //搜索地址方法
  _customerAddress(String address) async {
    try {
      List<Location> list = await locationFromAddress(address);
      print(list);
      mapController.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(list[0].latitude, list[0].longitude), 16));
    } catch (e) {
      CommonToast.showToast("Can not find any address");
    }
  }

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
}
