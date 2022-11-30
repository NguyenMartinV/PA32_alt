import 'package:flutter/material.dart';

import '../../component/common_appbar.dart';

class AgreementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      bgColor:  const Color(0xffF2F2F2),
      title: "Customer Agreement",
      body: AgreementText(),
    );
  }
}

class AgreementText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: EdgeInsets.only(top: 30.0, left: 12.0, right: 12.0),
      child: Column(
        children: [
          // Text(
          //   "PrimeGPS uses the data we collect to provide you withrich, interactive experiences. In particular, we use data to:\n",
          //   style: TextStyle(fontSize: 14.0),
          // ),
          // Text(
          //   "1. Provide our products, which includes updating,securing, and troubleshooting, as well as providing support. lt also includes sharing data, when it is required to provide the service or carry out the transactions you request. \n2. lmprove and develop our products \n3. Personalize our products and make recommendations. \n4. Advertise and market to you, which includes sending promotional communications, targeting advertising,and presenting you with relevant offers.\n\n",
          //   style: TextStyle(fontSize: 14.0),
          // ),
          // Text(
          //   "We also use the data to operate our business, which includes analyzing our performance,meeting our legal obligations, developing our workforce, and doing research. \n\n",
          //   style: TextStyle(fontSize: 14.0),
          // ),
          // Text(
          //   "In carrying out these purposes, we combine data we \ncollect from different contexts or obtain from third parties to give you a more seamless, consistent, and personalized experience, to make informed business decisions, and for other legitimate purposes.",
          // )
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
            height: 480.0,
            child: Column(
              children: [
                Text(
                  "WeCare uses the data we collect to provide you with rich, interactive experiences. In particular, we use data to:\n",
                  style: TextStyle(fontSize: 14.0),
                ),
                Text(
                  "1. Provide our products, which includes updating, securing, troubleshooting, as well as providing support. It also includes sharing data, when it is required to provide the service or carry out the transactions you request. \n2. lmprove and develop our products \n3. Personalize our products and make recommendations. \n4. Advertise and market to you, which includes sending promotional communications, targeting advertising, and presenting you with relevant offers.\n\n",
                  style: TextStyle(fontSize: 14.0),
                ),
                Text(
                  "We also use the data to operate our business, which includes analyzing our performance,meeting our legal obligations, developing our workforce, and doing research. \n\n",
                  style: TextStyle(fontSize: 14.0),
                ),
                Text(
                  "In carrying out these purposes, we combine data we \ncollect from different contexts or obtain from third parties to give you a more seamless, consistent, and personalized experience, to make informed business decisions, and for other legitimate purposes.",
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
