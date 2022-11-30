
import 'package:flutter/material.dart';
import 'package:pa32/CareTakerHomePage.dart';
import 'package:pa32/Password/ResetPassword.dart';
import 'package:pa32/alerts/alerts.dart';
import 'package:pa32/bluetooth/bluetoothDevice.dart';
import 'package:pa32/cares/cares.dart';
import 'package:pa32/devices.dart';
import 'package:pa32/home/myHomeMap.dart';
import 'package:pa32/home/userHome.dart';
import 'package:pa32/profile/profile.dart';

import '../about/about_page.dart';
import '../call/emergencyPhone.dart';


class UserNavi extends StatefulWidget {
  const UserNavi({Key? key}) : super(key: key);

  @override
  State<UserNavi> createState() => _UserNaviState();
}

class _UserNaviState extends State<UserNavi> {

  int currentIndex = 0;
  final screens = [
    //CareTakerHomePage(),
    UserHome(),
    // CaresPage(),
    // EmergencyPhone(),
    // ResetPassword(),


    // TrackerPage(),
    // DevicesHome(),
    // ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;

    return Scaffold(

      body:IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,), label: 'Home', backgroundColor: Colors.white),

        ],
      ),
    );
  }
}