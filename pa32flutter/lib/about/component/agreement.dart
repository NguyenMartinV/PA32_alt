import 'package:flutter/material.dart';
import 'package:pa32/component/common_appbar.dart';

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
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30.0, left: 12.0, right: 12.0),
          child: Column(
            children: [
              Text(
                "PrimeGPS uses the data we collect to provide you withrich, interactive experiences. In particular, we use data to:\n",
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                "1、Provide our products, which includes updating,securing, and troubleshooting, as well as providing support. lt also includes sharing data, when it is required to provide the service or carry out the transactions you request. \n2、lmprove and develop our products \n3、Personalize our products and make recommendations. \n4、Advertise and market to you, which includes sending promotional communications, targeting advertising,and presenting you with relevant offers.\n\n",
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                "We also use the data to operate our business, which includes analyzing our performance,meeting our legal obligations, developing our workforce, and doing research. \n\n",
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                "In carrying out these purposes, we combine data we \ncollect from different contexts or obtain from third parties to give you a more seamless, consistent, and personalized experience, to make informed business decisions, and for other legitimate purposes.",
              )
            ],
          ),
        ),
      ],
    );
  }
}
