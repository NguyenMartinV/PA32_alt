import 'package:flutter/material.dart';
import 'package:pa32/routes.dart';

class PersonalPage extends StatefulWidget {
  PersonalPage({
    Key? key,
  }) : super(key: key);
  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  /* List list = [
    {
      Icon
    }
  ]; */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: MyPersonalDrawer(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
    );
  }
}

class MyPersonalDrawer extends StatefulWidget {
  @override
  State<MyPersonalDrawer> createState() => _MyPersonalDrawerState();
}

class _MyPersonalDrawerState extends State<MyPersonalDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xdd283137),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
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
                      print("更换头像"); //TODO
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(
                        right: 12.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(29),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/avatar.png"),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "12345678910",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            // height: 300.0,
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 20.0,
              ),
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) {
                  Widget imageUrl = Container(width: 0, height: 0);
                  String leftText = "";
                  int rightNum = 0;
                  switch (index) {
                    case 0:
                      leftText = "Cares";
                      rightNum = 3;
                      imageUrl = Container(
                        child: Image.asset("images/person.jpg"),
                        width: 15.0,
                        height: 15.0,
                      );
                      break;
                    case 1:
                      leftText = "Emergency Call";
                      imageUrl = Container(
                        child: Image.asset("images/person.jpg"),
                        width: 15.0,
                        height: 15.0,
                      );
                      break;
                    case 2:
                      leftText = "Alerts";
                      imageUrl = Container(
                        child: Image.asset("images/person.jpg"),
                        width: 15.0,
                        height: 15.0,
                      );
                      break;
                    case 3:
                      leftText = "Password";
                      imageUrl = Container(
                        child: Image.asset("images/person.jpg"),
                        width: 15.0,
                        height: 15.0,
                      );
                      break;
                    case 4:
                      leftText = "About";
                      imageUrl = Container(
                        child: Image.asset("images/person.jpg"),
                        width: 15.0,
                        height: 15.0,
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
                              imageUrl,
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
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  "$rightNum",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 25.0,
                              )
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        if (index == 0) {
                          Navigator.pushNamed(
                            context,
                            "/CaresPage",
                            arguments: {
                              'rightNum': rightNum,
                            },
                          );
                        }
                        if (index == 1) {
                          Navigator.pushNamed(
                            context,
                            "/EmergencyPhone",
                            arguments: {
                              'rightNum': rightNum,
                            },
                          );
                        }
                        if (index == 2) {
                          Navigator.pushNamed(
                            context,
                            "/AlertsPage",
                            arguments: {
                              'rightNum': rightNum,
                            },
                          );
                        }
                        if (index == 3) {
                          Navigator.pushNamed(
                            context,
                            "/ResetPassword",
                            arguments: {
                              'rightNum': rightNum,
                            },
                          );
                        }
                        if (index == 4) {
                          Navigator.pushNamed(
                            context,
                            "/AboutPage",
                            arguments: {
                              'rightNum': rightNum,
                            },
                          );
                        }
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 2.0,
                    color: Colors.white,
                    // indent: 20.0,
                  );
                },
                shrinkWrap: true,
              ),
            ),
            // )
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150.0, left: 40.0),
                  child: GestureDetector(
                    onTap: () {
                      print("log out");
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text(
                            "Log out",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
