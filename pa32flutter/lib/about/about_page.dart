
// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../component/common_appbar.dart';

class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String appVersion = ""; //APP版本号

  _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
    });
  }



  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      bgColor:  const Color(0xffF2F2F2),
      title: "About",
      body: Container(
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
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          Container(  // logo
                            width: 365,
                            height: 146,
                            margin: EdgeInsets.only(top: 44.0, bottom: 20.0),
                            child: Image.asset("assets/images/app logo final.png"),
                          ),
                          Text(
                            "Version $appVersion",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 35.0), // logo和选项框的距离
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.white,
                    ),
                    height: 140.0,    // 选项框的高度
                    child: AboutContent(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AboutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (content, index) {
        String ListText = "";
        if (index == 0) {
          ListText = "Privacy Notice";
        }
        if (index == 1) {
          ListText = "Customer Agreement";
        }
        if (index == 2) {
          ListText = "Contact Us";
        }
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Container(
            padding: EdgeInsets.only(top: 4.5, bottom: 4.5),   // 字和上下栏的距离
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ListText,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          onTap: () {
            // print("点击了第$index项");
            if (index == 0) {
              Navigator.pushNamed(context, "/PrivacyPage");
            }
            if (index == 1) {
              Navigator.pushNamed(context, "/AgreementPage");
            }
            if (index == 2) {
              Navigator.pushNamed(context, "/ContactUsPage");
            }
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: 3,
    );
  }
}