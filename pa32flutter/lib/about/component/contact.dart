import 'package:flutter/material.dart';

import '../../component/common_appbar.dart';


class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      bgColor:  const Color(0xffF2F2F2),
      title: "Contact Us",
      body: Container(
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
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 42.0, bottom: 71.0),
                      child: Container(
                        width: 365,
                        height: 146,
                        child: Image.asset("assets/images/app logo final.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
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
              height: 101.0,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Contact Us",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          "(014)513-1745",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          "ffsas@gmail.com",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
