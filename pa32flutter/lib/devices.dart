
import 'package:flutter/material.dart';
import 'package:pa32/alerts/alerts.dart';
import 'package:pa32/call/emergencyPhone.dart';
import 'package:pa32/profile/component/body.dart';

import 'about/about_page.dart';
import 'bluetooth/bluetoothDevice.dart';
import 'component/common_toast.dart';
import 'http/DioManager.dart';
import 'http/bean/my_cares_customer_detail_entity.dart';
import 'http/config/BaseConfig.dart';




class DevicesHome extends StatefulWidget {
  const DevicesHome({Key? key}) : super(key: key);

  @override
  State<DevicesHome> createState() => _DevicesHomeState();
}

class _DevicesHomeState extends State<DevicesHome> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
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
          Column(
            children: [
              SizedBox(
                height: 240,
                child: Stack(
                  children: [
                    // ClipPath(
                    //   clipper: CustomShape(),
                    //   child: Container(
                    //     height: 150,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/app logo final.png"),
                          // Text("Ryan Nibs", style: TextStyle(fontSize: 22, color: Colors.black),),
                          // Text("ryann@live4iot.com", style: TextStyle(
                          //   fontWeight: FontWeight.w400,
                          //   color: Color(0xFF8492A2),
                          // ),)

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height/50),
              //
              // new Center(
              //     child: Text("Profile",
              //       style: TextStyle(
              //           color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
              //     )
              // ),

              // SizedBox(height: MediaQuery.of(context).size.height/50),

              // SizedBox(height: 20,),

              // ProfileMenu(
              //   icon: Icons.person,
              //   text: "Personal Info",
              //   press: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => PersonalInfo())
              //     );
              //   },
              // ),

              ProfileMenu(
                icon: Icons.alarm,
                text: "Alerts Page",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AlertsPage())
                  );
                },
              ),

              ProfileMenu(
                icon: Icons.call,
                text: "Emergency Calls",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmergencyPhone())
                  );
                },
              ),

              ProfileMenu(
                icon: Icons.bluetooth,
                text: "BLE Pendant Connection",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FindDevicesScreen())
                  );
                },
              ),
              ProfileMenu(
                icon: Icons.bluetooth,
                text: "Activate WeCare Service",
                press: () {
                  Navigator.pushNamed(
                    context,
                    "/ServicePage",
                  );
                },
              ),
              // ProfileMenu(
              //   icon: Icons.bluetooth,
              //   text: "Tester",
              //   press: () {
              //
              //   },
              // ),

            ],
          ),
        ],
      ),

    );
  }
}
