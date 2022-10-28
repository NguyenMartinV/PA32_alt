import 'package:flutter/material.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'component/body.dart';

class testProfile extends StatelessWidget {
  const testProfile({Key? key}) : super(key: key);

  static String routenName = '/ProfilePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: new Center(
      //       child: Text("Profile")
      //   ),
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      // ),
      body: Body(),
    );
  }
}
