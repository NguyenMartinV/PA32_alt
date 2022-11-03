

import 'package:flutter/material.dart';
import 'package:pa32/alerts/alerts.dart';
import 'package:pa32/bluetooth/bluetoothDevice.dart';

import '../about/about_page.dart';

import '../home/myHomeMap.dart';
import 'component/body.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {








  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),

        // Center(
        //     child: Stack(
        //       //mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Container(
        //           height: MediaQuery.of(context).size.height,
        //           width: MediaQuery.of(context).size.width,
        //           decoration: BoxDecoration(
        //               gradient: LinearGradient(
        //                   begin: Alignment.topCenter,
        //                   end: Alignment.bottomCenter,
        //                   colors: [
        //                     Color(0x6603A9F4),
        //                     Color(0x9903A9F4),
        //                     Color(0xcc03A9F4),
        //                     Color(0xff03A9F4),
        //                   ]
        //               )
        //           ),
        //         ),
        //         Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: <Widget>[
        //               Row(
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   //Text('Redirecting'),
        //                 ],
        //               ),
        //               ListTile(
        //                 onTap: () {
        //                   Navigator.pop(context);
        //                   Navigator.push(
        //                     context,
        //                     MaterialPageRoute(builder: (context) => LoginScreen()),
        //                   );
        //                   signOut();
        //                 },
        //                 leading: Icon(Icons.person_off_outlined),
        //                 title: Text('Sign Out',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        //               ), //Signout
        //               /*ListTile(
        //                 onTap: () {
        //                   Navigator.push(
        //                     context,
        //                     MaterialPageRoute(builder: (context) => EditEmerg())
        //                 );
        //                 },
        //                 leading: Icon(Icons.settings_phone_outlined),
        //                 title: Text('Edit Emergency Contact',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        //               ),*/
        //               ListTile(
        //                 onTap: () {
        //                   Navigator.push(
        //                       context,
        //                       MaterialPageRoute(builder: (context) => PersonalInfo())
        //                   );
        //                 },
        //                 leading: Icon(Icons.person),
        //                 title: Text('Edit Personal Info',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        //               ),
        //               ListTile(
        //                 onTap: () {
        //                   Navigator.push(
        //                       context,
        //                       MaterialPageRoute(builder: (context) => AboutPage())
        //                   );
        //                 },
        //                 leading: Icon(Icons.info),
        //                 title: Text('About',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        //               ),
        //               ListTile(
        //                 onTap: () async {
        //                   //call our number
        //                   String number = '2147645189';
        //                   await FlutterPhoneDirectCaller.callNumber(number);
        //                 },
        //                 //leading: Icon(Icons.info),
        //                 title: Text('Questions? Press here to call our number or dial 214-764-5189',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        //               ),
        //
        //             ]
        //         ),
        //
        //       ],
        //     )
        // ),

    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: SizedBox(),
      centerTitle: true,
      elevation: 0,
      title: Text(
        "Profile",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.blueAccent),
      ),
      actions: <Widget> [
        // TextButton(onPressed: (){
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => MyHomeMap())
        //   );
        // },child: Text(
        //   "Edit",
        //   style: TextStyle(fontSize: 16, color: Colors.blueAccent),)
        // )
      ]
    );
  }
}
