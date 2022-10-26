
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/bean/country_code_entity.dart';
import 'package:pa32/http/bean/login_entity.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/DataUtils.dart';
import 'package:pa32/utils/SPUtil.dart';
import 'package:pa32/utils/VerifyUtil.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);
  bool isRemenber = false;
  bool isAgreee = false;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool codeFlag = false;
  bool isRemenber = false;
  var phoneController = TextEditingController();
  var pwdController = TextEditingController();
  List myCountryList = [];
  String countryCodeText = '1';

  _login(String phone, String password,int timeZoneOffset) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/login",
      {
        "phone": phone,
        "password": password,
        "timeZoneOffset": timeZoneOffset,
      },
      (success) {
        LoginEntity bean = LoginEntity.fromJson(success);
        /*  print("++++++success:${success['data']['user']['id']}");
        print("++++++bean:${bean}"); */
        if (bean.code == 0) {
          SPUtil.save("myUserIcon", success['data']['user']['icon']);
          SPUtil.save("userId", success['data']['user']['id']);
          SPUtil.save(SPUtil.tokenKey, bean.data!.token!);
          SPUtil.save("myPhoneText", phone);
          if (isRemenber) {
            List<String> list = phone.split("-");
            if(list.isNotEmpty && list.length == 2){
              SPUtil.save("mySavePhone", list[1]);
              SPUtil.save("mySavePassword", pwdController.text);
              SPUtil.save("countryCode",countryCodeText);
            }
          } else {
            SPUtil.remove("mySavePhone");
            SPUtil.remove("mySavePassword");
            SPUtil.remove("countryCode");
          }
          Navigator.pushNamed(
            context,
            "/BottomNavi",
          );
        } else {
          CommonToast.showToast("${bean.msg}");
        }
      },
      (error) {
        CommonToast.showToast(error);
      },
    );
  }

  //get countryCode
  _countryCodeList(String platformSecretKey) async {
    DioManager().post(
      BaseConfig.API_HOST + "general/countryCodeList",
      {
        "platformSecretKey": platformSecretKey,
      },
      (success) {
        CountryCodeEntity bean = CountryCodeEntity.fromJson(success);

        setState(() {
          myCountryList.addAll(bean.data as List);
        });
        // print("++++++++++70+++:${myCountryList}");
      },
      (error) {},
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countryCodeList(
      "F0962F2444C856E4255D98195548CC82",
    ); //获取区号
    //判断是否勾选记住密码
    SPUtil.get("mySavePhone").then(
      (value) => {
        if (value != null){
          setState(() {
            isRemenber = true;
            phoneController.text = value;
          })
        }
      },
    );
    SPUtil.get("mySavePassword").then((value) => {
      if (value != null){
        setState(() {
          pwdController.text = value;
        })
      }
    });
    SPUtil.get("countryCode").then(
          (value) => {
      if (value != null){
          setState(() {
            countryCodeText = value;
          })
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(375, 667),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF2F2F2),
      appBar: PreferredSize( //外面套一个PreferredSize
          preferredSize: Size.fromHeight(20.0), // 设置高度
          child: AppBar( //这个是原本的AppBar内容
            backgroundColor: Colors.white,
            leading: Text(""),
            elevation: 0,
          )
      ),
      body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40.h,left: 25.w,right:25.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Stack(
                children: [
                  Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 36.h, bottom: 35.h),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: 43.h,
                          margin: EdgeInsets.only(left:37.w,right: 37.w),
                          padding: EdgeInsets.only(left: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(width: 1.0, color: Colors.grey),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/user.png",
                                width: 18.5.r,
                                height: 18.5.r,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: 62.w,
                                  // color: Colors.red,
                                  child: Row(
                                    children: [
                                      Text(
                                        "+$countryCodeText",
                                        style: TextStyle(
                                          color:Color(0xff222222),
                                          fontSize: 16.sp
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        size: 25,
                                        color:Color(0xff222222),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  // print("选择国家区号");
                                  setState(() {
                                    codeFlag = !codeFlag;
                                  });
                                },
                              ),
                            Expanded(
                              child:TextField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                  hintText: "phone",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                  )
                                ),
                              )
                            ),
                            ],
                          ),
                        ),
                        Container(
                          height: 43.h,
                          margin: EdgeInsets.only(top:15.h,left:37.w,right: 37.w),
                          padding: EdgeInsets.only(left: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(
                              width: 1.0,
                              color: Color(0xffA0A0A0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 19,
                                child: Image.asset(
                                  "assets/images/password.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 13.w,
                              ),
                              Expanded(
                                child:TextField(
                                  obscureText: true,
                                  controller: pwdController,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontSize: 16.sp,
                                    )
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            String phone = phoneController.text;
                            String pwd = pwdController.text;
                            if (phone.isEmpty) {
                              CommonToast.showToast("Please enter Mobile");
                              return;
                            }
                            if (pwd.isEmpty) {
                              CommonToast.showToast(
                                  "Please enter Password");
                              return;
                            }
                            /* if (!VerifyUtil.isPhoneChina(phone)) {
                                CommonToast.showToast(
                                  VerifyUtil.phoneChinaErrMsg,
                                );
                                return;
                              } */
                            _login(
                                "${countryCodeText.replaceAll(" ", "") + '-' + phone.replaceAll(" ", "")}",
                                Utils.md5Encode(pwd),
                                Utils.getTimeOffset()
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h),
                            margin: EdgeInsets.only(top: 50.h,left: 37.5.w,right: 37.5.w),
                            decoration: BoxDecoration(
                              color: Color(0xff028AFE),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:16.h,left: 37.5.w,right: 37.5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                                  // Container(
                                  //   width: 10,
                                  //   height: 10,
                                  //   margin: EdgeInsets.only(right: 10.w),
                                  //   child: Checkbox(
                                  //     value: isRemenber,
                                  //     onChanged: (value) {
                                  //       setState(() {
                                  //         isRemenber = value as bool;
                                  //       });
                                  //       print("++++++268:$isRemenber");
                                  //     },
                                  //     activeColor: Colors.blue,
                                  //     checkColor: Colors.white,
                                  //   ),
                                  // ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    setState(() {
                                      isRemenber = !isRemenber;
                                    });
                                  });
                                },
                                child:
                                isRemenber?
                                Icon(
                                    Icons.check_box,
                                    size: 18.r,
                                    color: Colors.blue
                                ):
                                Icon(
                                  Icons.check_box_outline_blank,
                                  size: 18.r,
                                  color:Color(0xFF707070),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left:5.w),
                                child: Text(
                                  "Remember me",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color:Color(0xff494949)
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child:GestureDetector(
                                    onTap: () {
                                      // print("Forgot Password");
                                      Navigator.pushNamed(
                                          context, "/ForgotPassword");
                                    },
                                    child: Text(
                                      "Forgot Password",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color:Color(0xff494949)
                                      ),
                                    ),
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(top:43.h,right:38.w,bottom: 28.5.h),
                          // color: Colors.red,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/RegisterPage");
                            },
                            child: Text(
                              "Sign Up >",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color:Color(0xff494949)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                if (codeFlag)
                  Positioned(
                    top: 138.h,
                    left: 74.w,
                    child: Container(
                      width: 60.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Color.fromARGB(255, 230, 227, 227),
                        ),
                      ),
                      child: MediaQuery.removeViewPadding(
                        context: context,
                        removeTop: true,
                        child: ListView(
                          shrinkWrap: true,
                          children: List.generate(
                            myCountryList.length,
                            (index) => GestureDetector(
                              child: Container(
                                padding: EdgeInsets.only(top: 4, bottom: 4),
                                alignment: Alignment.center,
                                child: Text(
                                  "+${myCountryList[index].countryCode}",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  countryCodeText =
                                      "${myCountryList[index].countryCode}";
                                  codeFlag = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left:40.w,right:40.w),
                height: 56,
                child: RichText(
                  text: TextSpan(
                    text: "By continuing，you agree to the",
                    style: TextStyle(color: Color(0xFF494949), fontSize: 10.sp),
                    children: [
                      TextSpan(
                        text: ' Customer Agreement ',
                        style: TextStyle(color: Color(0xFF1166BB), fontSize: 10.sp),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // print('Customer Agreement');
                            Navigator.pushNamed(context, "/AgreementPage");
                          },
                      ),
                      TextSpan(
                        text: 'or other agreement for Pa32 services,and the ',
                        style: TextStyle(fontSize: 10.sp, color: Color(0xFF494949),
                        ),
                      ),
                      TextSpan(text: "  "),
                      TextSpan(
                        text: "Privacy Notice.",
                        style: TextStyle(color: Color(0xFF1166BB), fontSize: 10.sp),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Navigator.pushNamed(context, "/PrivacyPage");
                      }),
                    ],
                  ),
                ),
              )
            ),

            // Container(
            //   width: MediaQuery.of(context).size.width - 60,
            //   // color: Colors.red,
            //   margin: EdgeInsets.only(top: 50),
            //   child: RichText(
            //     text: TextSpan(
            //       text: 'I agree to the',
            //       style: TextStyle(fontSize: 13, color: Colors.black),
            //       children: [
            //         TextSpan(
            //           text: ' Customer Agreement ',
            //           style: TextStyle(fontSize: 13, color: Colors.blue),
            //           recognizer: TapGestureRecognizer()
            //             ..onTap = () {
            //               // print('Customer Agreement');
            //               Navigator.pushNamed(context, "/AgreementPage");
            //             },
            //         ),
            //         TextSpan(
            //           text: 'or other agreement for Pa32 services,and the ',
            //           style: TextStyle(
            //             fontSize: 12,
            //             color: Colors.black,
            //             height: 1.4,
            //           ),
            //         ),
            //         TextSpan(
            //           text: 'Privacy Notice',
            //           style: TextStyle(fontSize: 12, color: Colors.blue),
            //           recognizer: TapGestureRecognizer()
            //             ..onTap = () {
            //               Navigator.pushNamed(context, "/PrivacyPage");
            //             },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),

    );
  }
}
