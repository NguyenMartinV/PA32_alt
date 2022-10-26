import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scan/scan.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ScanController controller = ScanController();
    String qrcode = 'Unknown';
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,        //状态栏背景颜色
    //     statusBarIconBrightness: Brightness.light  // dark:一般显示黑色   light：一般显示白色
    // ));
    return
      AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
              child: ScanView(
                controller: controller,
                // custom scan area, if set to 1.0, will scan full area
                scanAreaScale: .7,
                scanLineColor: Color(0xff06dbee),
                onCapture: (data) {
                  String regexString = r'(\d+)';
                  RegExp regExp = RegExp(regexString);
                  var matches = regExp.allMatches(data.toString());
                  var content = matches.elementAt(0).group(0).toString();
                  Navigator.pop(context, content);
                  // print("扫描信息：$content");
                },
              ),
            ),
            Positioned(
                top: 15,
                left: 0,
                right: 0,
                height: 100,
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        "Add Device",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 10,
                        height: 100,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                    ),
                  ],
                )
            ),
            Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/scan_icon.png",
                      width: 14,
                      height: 14,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Please scan the QR code on the device",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffd3d3d3)
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      );
  }
}
