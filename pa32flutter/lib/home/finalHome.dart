
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_sms/flutter_sms.dart';



class FinalHomePage extends StatefulWidget {
  FinalHomePage({Key? key}) : super(key: key);

  @override
  State<FinalHomePage> createState() => _FinalHomePageState();
}

class _FinalHomePageState extends State<FinalHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      Center(
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

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[

                    Align(
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage('assets/images/app logo final.png' ),
                        // height: MediaQuery.of(context).size.height,
                        // width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text('Welcome to the BLE Pendant App!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                    //Visibility(visible: checkConnect(), child: Text('Click here to pair your device'),)

                  ]

              )

            ],

          )
      ),

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

