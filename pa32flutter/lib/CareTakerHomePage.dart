
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pa32/utils/DataUtils.dart';
import 'package:pa32/utils/SPUtil.dart';

import 'component/common_toast.dart';
import 'http/DioManager.dart';
import 'http/bean/customer_list_all_entity.dart';
import 'http/bean/my_cares_customer_detail_entity.dart';
import 'http/config/BaseConfig.dart';




class CareTakerHomePage extends StatefulWidget {
  CareTakerHomePage({Key? key}) : super(key: key);

  @override
  State<CareTakerHomePage> createState() => _CareTakerHomePageState();
}

class _CareTakerHomePageState extends State<CareTakerHomePage> {

  bool active = false;
  bool active1 = false;
  bool active2 = false;
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

        });
        MyCaresCustomerDetailEntity bean =
        MyCaresCustomerDetailEntity.fromJson(success);

        // if (bean.code == 0 && bean.data != null){
        //   myHomeList.clear();
        //   myHomeList.addAll(bean.data!);
        // }
        // else{
        //
        // }

        //print(bean);

        //message = bean.data?.nickname.toString();
        final data = bean.data;
        if(data!=null){
          message = data.firstName.toString() + " "  + data.middleName.toString()  + "\n" + data.address.toString() + " " + data.lastName.toString() + "\n" + data.birth.toString() + "\n" + data.gender.toString() + "\n" + data.physicalCondition.toString() + "\n" + data.deviceNo.toString() + "\n" + data.lastUpdateTime.toString();
        }
        return message;
      },
          (error) {
        CommonToast.showToast(error);
      },
    );
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
  List myAlertsData = [];
  bool flag1 = true;
  String ? message = "Hello";
  // Future<String> displayText() async{
  //   DioManager().post(
  //     BaseConfig.API_HOST + "pa32/customerDetail",
  //     {
  //       "customerId": '1591099483739385856',
  //       "mask": 15,
  //       "arrayMask": 15,
  //       "count": "{0:1,3:10}",
  //     },
  //         (success) async {
  //       setState(() {
  //
  //       });
  //       MyCaresCustomerDetailEntity bean =
  //       MyCaresCustomerDetailEntity.fromJson(success);
  //
  //       // if (bean.code == 0 && bean.data != null){
  //       //   myHomeList.clear();
  //       //   myHomeList.addAll(bean.data!);
  //       // }
  //       // else{
  //       //
  //       // }
  //
  //       //print(bean);
  //
  //       //message = bean.data?.nickname.toString();
  //       final data = bean.data;
  //       if(data!=null){
  //         message = data.firstName.toString() + " "  + data.middleName.toString()  + "\n" + data.address.toString() + " " + data.lastName.toString() + "\n" + data.birth.toString() + "\n" + data.gender.toString() + "\n" + data.physicalCondition.toString() + "\n" + data.deviceNo.toString() + "\n" + data.lastUpdateTime.toString();
  //       }
  //       return message;
  //     },
  //         (error) {
  //       CommonToast.showToast(error);
  //     },
  //   );
  //   return "Loading...";
  // }
  int num = 0;
  static const intro =
      'To connect pendant, please press search button and then press and hold the button on the pendant until the red light appears. Find the pendant in the list and press \"CONNECT\". Once connected, press the search button and leave on. Your device is ready to use.'
      '\n'
      'Note: if an action is detected, the app will stop searching automatically';

  @override
  Widget build(BuildContext context) {
    if (flag1) {
      //myCustomerId = myHomeList[0].id ?? "";
      var args = ModalRoute.of(context)!.settings.arguments;
      if (args != null && args is Map) {}
      _customerList(0, 0, 1, 999, 15, 15, "{0:1,3:10}");
      flag1 = false;
    }

    return Scaffold(
      body:
          SingleChildScrollView(
            child: Center(

                child: Stack(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [



                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration:  BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFA2C8FC),
                                Color(0xFF9AC3FC),
                                Color(0xFF85B5F8),
                                Color(0xFF66A5FC),
                              ]
                          )
                      ),
                    ),
                    //BottomNavi(),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: <Widget>[

                          Align(
                            alignment: Alignment.topCenter,
                            child: Image(
                              image: AssetImage('assets/images/app logo final.png' ),
                              height: MediaQuery.of(context).size.height/2,
                              width: MediaQuery.of(context).size.width/2,
                            ),
                          ),
                          Text('Patients under your care: ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                          SizedBox(height: MediaQuery.of(context).size.height/54),

                          Container(


                            width: MediaQuery.of(context).size.width/1.1,
                             child: ExpansionPanelList(

                                animationDuration: Duration(milliseconds: 500),
                                dividerColor: Color(0xFFA2C8FC),
                                elevation: 1,
                                expansionCallback: (panelIndex, isExpanded) {
                                  if(panelIndex==0){

                                    myCustomerId = myHomeList[0].id ?? "";
                                    _customerDetail(myCustomerId, 15, 15, "0:1,3:10");
                                    active = !active;
                                    active1 = false;
                                    active2 = false;
                                  }
                                  if(panelIndex==1){

                                    myCustomerId = myHomeList[1].id ?? "";
                                    _customerDetail(myCustomerId, 15, 15, "0:1,3:10");
                                    active1 = !active1;
                                    active2 = false;
                                    active = false;
                                  }

                                  if(panelIndex==2){

                                    myCustomerId = myHomeList[2].id ?? "";
                                    _customerDetail(myCustomerId, 15, 15, "0:1,3:10");
                                    active2 = !active2;
                                    active = false;
                                    active1 = false;
                                  }
                                  setState(() {

                                  });
                                },
                                expandedHeaderPadding: EdgeInsets.all(1),
                                children: [
                                  ExpansionPanel(

                                    canTapOnHeader: true,
                                    backgroundColor: Colors.white,
                                    headerBuilder: (_, isExpanded) => Container(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                        child: Text(
                                          'Patient 0',
                                          style: TextStyle(fontSize: 20, fontFamily: 'Cairo'),
                                        )),
                                    body: Container(
                                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                      child: Text(message!,style: TextStyle(fontSize: 18, fontFamily: 'Cairo'),textAlign: TextAlign.left,),
                                    ),
                                    isExpanded: active,

                                  ),
                                  ExpansionPanel(
                                    canTapOnHeader: true,
                                    backgroundColor: Colors.white,
                                    headerBuilder: (_, isExpanded) => Container(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                        child: Text(
                                          'Patient 1',
                                          style: TextStyle(fontSize: 20,fontFamily: 'Cairo'),
                                        )),
                                    body: Container(
                                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                      child: Text(message!, style: TextStyle(fontFamily: 'Cairo',fontSize: 18),),//Text('Name: William Difty\nAge: 78\nHeight: 5\'9\"\nWeight: 220\nBlood Type: AB-\nHealth Condition(s): chronic back pain, rheumatoid arthritis',style: TextStyle(fontFamily: 'Cairo',fontSize: 18),),
                                    ),
                                    isExpanded: active1,

                                  ),
                                  ExpansionPanel(
                                    canTapOnHeader: true,
                                    backgroundColor: Colors.white,
                                    headerBuilder: (_, isExpanded) => Container(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                        child: Text(
                                          'Patient 2',
                                          style: TextStyle(fontSize: 20,fontFamily: 'Cairo'),
                                        )),
                                    body: Container(
                                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                      child: Text(message!,style: TextStyle(fontSize: 18, fontFamily: 'Cairo'),),
                                    ),
                                    isExpanded: active2,

                                  ),

                                ],
                              )
                          ),


                          //ListView(
                            //   scrollDirection: Axis.vertical,
                            //   shrinkWrap: true,
                            //   //physics: const BouncingScrollPhysics(),
                            //   children: [
                            //     Container(
                            //       height: MediaQuery.of(context).size.height/20,
                            //       width: MediaQuery.of(context).size.height/20,
                            //       color: Colors.amber[100],
                            //       child: const Center(child: Text('Entry A')),
                            //     ),
                            //     Container(
                            //       height: MediaQuery.of(context).size.height/20,
                            //       width: MediaQuery.of(context).size.height/20,
                            //       color: Colors.amber[100],
                            //       child: const Center(child: Text('Entry B')),
                            //     ),
                            //     Container(
                            //       height: MediaQuery.of(context).size.height/20,
                            //       width: MediaQuery.of(context).size.height/20,
                            //       color: Colors.amber[100],
                            //       child: const Center(child: Text('Entry C')),
                            //     ),
                            //     ExpandablePanel(
                            //
                            //       header: Text('Intructions',style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                            //       collapsed: Text('', softWrap: true, overflow: TextOverflow.ellipsis),
                            //       expanded: Text(intro, softWrap: true, ),
                            //       //theme:  ,
                            //     ),
                            //
                            //     Container(
                            //       height: MediaQuery.of(context).size.height/20,
                            //       width: MediaQuery.of(context).size.height/20,
                            //       color: Colors.amber[100],
                            //       child:
                            //
                            //
                            //           DropdownButton<String>(
                            //
                            //             items: <String>['A', 'B', 'C', 'D'].map((String value) {
                            //               return DropdownMenuItem<String>(
                            //                 value: value,
                            //                 child: Text(value),
                            //               );
                            //             }).toList(),
                            //             onChanged: (_) {},
                            //           ),
                            //
                            //       ),
                            //
                            //
                            //   ],
                            // )
                          //



                          // DropdownButton<String>(
                          //
                          //   items: <String>['A', 'B', 'C', 'D'].map((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          //   onChanged: (_) {},
                          // )

                          //Visibility(visible: checkConnect(), child: Text('Click here to pair your device'),)

                        ]

                    )

                  ],

                )
            ),
          )


      /* bottomNavigationBar: BottomNavigationBar(

        onTabChange: (index) => setState(() {
          pageTracer(index1);
        }),
        : [
            GButton(icon: Icons.home, text: 'Home', backgroundColor: Colors.blue),
            GButton(icon: Icons.gps_fixed, text: 'Track', backgroundColor: Colors.red),
            GButton(icon: Icons.device_hub, text: 'Devices', backgroundColor: Colors.black),
            GButton(icon: Icons.person, text: 'Profile', backgroundColor: Colors.green),
        ],

      ),*/

    );
  }
}

