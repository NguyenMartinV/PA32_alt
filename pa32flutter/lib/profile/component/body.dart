
import 'package:flutter/material.dart';
import 'package:pa32/Password/ResetPassword.dart';
import 'package:pa32/cares/cares.dart';
import 'package:pa32/home/myHomeMap.dart';
import 'package:pa32/profile/component/profile_pic.dart';

import '../../about/about_page.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {



  @override
  Widget build(BuildContext context) {

    return Center(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration:  const BoxDecoration(
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
                    ClipPath(
                      clipper: CustomShape(),
                      child: Container(
                        height: 150,
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfilePic(),
                          Text("Ryan Nibs", style: TextStyle(fontSize: 22, color: Colors.black),),
                          Text("ryann@live4iot.com", style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8492A2),
                          ),)
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
                icon: Icons.elderly,
                text: "Cares",
                press: () {
                  Navigator.pushNamed(
                    context,
                    "/CaresPage",
                    arguments: {"page": "MyHomeMap"},
                  );                },
              ),

              ProfileMenu(
                icon: Icons.password,
                text: "Reset Password",
                press: () {
                  Navigator.pushNamed(context, "/ResetPassword");
                },
              ),

              ProfileMenu(
                icon: Icons.info,
                text: "About",
                press: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => AboutPage())
                  // );
                  Navigator.pushNamed(context, "/AboutPage");
                },
              ),

              ProfileMenu(
                icon: Icons.logout,
                text: "Log Out",
                press: () {
                  Navigator.pushNamed(context, "/LoginPage");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// Cares Menu
class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key,
    required this.text,
    required this.icon,
    required this.press
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFFF5F6F9),
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color:Colors.white),
          ),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(icon, color: Colors.lightBlue,),
            SizedBox(width: 20),
            Expanded(child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
            )),
            Icon(Icons.arrow_forward_ios, color: Colors.lightBlue,)
          ],
        ),
      ),
    );
  }
}


class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width/2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
  
}