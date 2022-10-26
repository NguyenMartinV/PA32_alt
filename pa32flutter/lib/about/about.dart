import 'package:flutter/material.dart';
import 'package:pa32/component/common_appbar.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Container(
                      width: 37,
                      height: 37,
                      margin: EdgeInsets.only(top: 44.0, bottom: 20.0),
                      child: Image.asset("assets/images/about_icon.png"),
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
              margin: EdgeInsets.only(top: 35.0),
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
              height: 155.0,
              child: AboutContent(),
            ),
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
            padding: EdgeInsets.only(top: 10.0),
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
                  width: 7,
                  height: 12,
                  child: Image.asset("assets/images/cares_next.png"),
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
