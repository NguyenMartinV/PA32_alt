import 'dart:io';


import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

import '../../http/DioManager.dart';
import '../../http/bean/login_entity.dart';
import '../../utils/DataUtils.dart';
import '../../utils/SPUtil.dart';
import '../component/common_appbar.dart';
import '../component/common_bar_item.dart';


class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => UserInfoState();
}

class UserInfoState extends State<UserInfoPage> {
  String imgSrc = "";
  String username = "";
  String mobile = "";
  String email = "";
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _getLoginUser();
  }

  _getLoginUser() async {
    // LoginDataUser user = AppUser.loginAppUser;
    LoginDataUser user = await SPUtil.getLoginUserData();
    String iconId = user.icon ?? "0";
    var token = await SPUtil.getToken();
    setState(() {
      username = user.userName;
      mobile = user.mobile;
      email = user.email;
      if(iconId != "0"){
        imgSrc = Utils.buildImgUrl("userIcon", iconId, token);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
        bgColor: ThemeColors.mainBgNormalAndBlackDeep(context),
        title: MyLocalizations.of(context).userInfo,
        onLeadingPressed:(){
          Navigator.pop(context,imgSrc);
        },
        body:Container(
          width: double.infinity,
          height: double.infinity,
          color: ThemeColors.mainBgNormalAndBlackLight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CommonBarItem(
                    bgColor: ThemeColors.mainBgWhiteAndBlackDeep(context),
                    height: ToolHelper.toolHelper.isPad?90:null,
                    title:MyLocalizations.of(context).photo,
                    handleTap: (){
                      _openModalBottomSheet();
                    },
                    suffix: ClipOval(
                      child: Stack(
                        children: [
                          //占位头像
                          Image.asset(
                            "assets/images/avatar.png",
                            width: 35.r,
                            height: 35.r,
                            fit: BoxFit.cover,
                          ),
                          Utils.isBlank(imgSrc)
                              ? Image.asset(
                            "assets/images/avatar.png",
                            width: 35.r,
                            height: 35.r,
                            fit: BoxFit.cover,
                          )
                              : Image.network(
                            imgSrc,
                            width: 35.r,
                            height: 35.r,
                            fit: BoxFit.cover,
                            errorBuilder: (ctx,err,stackTrace) => Image.asset(
                              "assets/images/avatar.png",
                              width: 35.r,
                              height: 35.r,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  CommonBarItem(
                    bgColor: ThemeColors.mainBgWhiteAndBlackDeep(context),
                    title:MyLocalizations.of(context).username,
                    marginTop: 6.h,
                    suffixIcon: Text(""),
                    suffix: Text(
                      username,
                      style: TextStyle(
                          color:ThemeColors.textNorlmalAndWhiteColor(context),
                          fontSize:AppTextFont.kAppTextFont_15()
                      ),
                    ),
                  ),
                  CommonBarItem(
                    bgColor: ThemeColors.mainBgWhiteAndBlackDeep(context),
                    title:MyLocalizations.of(context).phone,
                    marginTop: 6.h,
                    handleTap: (){
                      String title = MyLocalizations.of(context).phone;
                      bool isBlank = Utils.isBlank(mobile);
                      if(!isBlank){
                        title = MyLocalizations.of(context).modify + " " + MyLocalizations.of(context).phone;
                      }
                      _editUserInfo(isBlank, title, NotificationActionType.kNotificationActionTypeSetUserSMS);
                    },
                    // handleTap: () async {
                    //   final  result = await Navigator.pushNamed(context, "/changeMobile");
                    //   if(result is String){
                    //     setState(() {
                    //       mobile = result;
                    //     });
                    //   }
                    // },
                    suffix: Text(
                      mobile,
                      style: TextStyle(
                          color:ThemeColors.textNorlmalAndWhiteColor(context),
                          fontSize: AppTextFont.kAppTextFont_15()
                      ),
                    ),
                    suffixIcon: Image.asset(
                      "assets/images/edit_phone.png",
                      width: 12.w,
                      height: 11.5.h,
                    ),
                  ),
                  CommonBarItem(
                    bgColor: ThemeColors.mainBgWhiteAndBlackDeep(context),
                    title:MyLocalizations.of(context).email,
                    marginTop: 6.h,
                    handleTap: (){
                      String title = MyLocalizations.of(context).email;
                      bool isBlank = Utils.isBlank(email);
                      if(!isBlank){
                        title = MyLocalizations.of(context).modify + " " + MyLocalizations.of(context).email;
                      }
                      _editUserInfo(isBlank, title, NotificationActionType.kNotificationActionTypeSetUserEmail);
                    },
                    // handleTap: () async {
                    //   final  result = await Navigator.pushNamed(context, "/changeEmail");
                    //   if(result is String){
                    //     setState(() {
                    //       email = result;
                    //     });
                    //   }
                    // },
                    suffix: Text(
                      email,
                      style: TextStyle(
                          color:ThemeColors.textNorlmalAndWhiteColor(context),
                          fontSize: AppTextFont.kAppTextFont_15()
                      ),
                    ),
                    suffixIcon: Image.asset(
                      "assets/images/edit_phone.png",
                      width: 12.w,
                      height: 11.5.h,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final  result = await Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) => PopupWindow(

                          )));
                      if(result is String) {
                        setState(() {
                          email = result;
                        });
                      }
                    },
                    child: Container(
                      height: ToolHelper.toolHelper.isPad?80:40.h,
                      width: double.infinity,
                      color: ThemeColors.mainBgWhiteAndBlackDeep(context),
                      child: Center(
                        child: Text(MyLocalizations.of(context).unbound,style: TextStyle(color: Colors.red,fontSize: AppTextFont.kAppTextFont_15()),),
                      ),
                    ),
                  ),
                  SizedBox(height: ToolHelper.toolHelper.isPad?100:40.h,),
                ],
              ),


            ],
          ),
        )
    );

  }
  Future _openModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height:ToolHelper.toolHelper.isPad?250:170.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(MyLocalizations.of(context).camera, textAlign: TextAlign.center,style: TextStyle(fontSize: AppTextFont.kAppTextFont_14()),),
                  onTap: () {
                    _setAvatar("camera");
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xfff2f2f2), width: 0.5),
                      bottom: BorderSide(color: Color(0xfff2f2f2), width: 0.5),
                    ),
                  ),
                  child: ListTile(
                    title: Text(MyLocalizations.of(context).album, textAlign: TextAlign.center,style: TextStyle(fontSize: AppTextFont.kAppTextFont_14())),
                    onTap: () {
                      _setAvatar("album");
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    MyLocalizations.of(context).cancel,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red,fontSize: AppTextFont.kAppTextFont_14()),
                  ),
                  onTap: () {
                    _setAvatar();
                  },
                ),
              ],
            ),
          );
        });
  }

  _setAvatar([String? type]) async {
    Navigator.pop(context);
    if (type == "camera") {
      final PickedFile? photo = await _picker.getImage(source: ImageSource.camera);
      // final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        cropImage(photo);
      }
    } else if (type == "album") {
      final PickedFile? image = await _picker.getImage(source: ImageSource.gallery);
      // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        cropImage(image);
      }
    }
  }

  void cropImage(PickedFile xImage) async {
    File fileImg = File(xImage.path);
    String result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => CropImageRoute(fileImg)));
    if (result.isEmpty) {
      print('上传失败');
    } else {
      setState(() {
        imgSrc = result;
      });
    }
  }

  _editUserInfo(bool isAddNew,String title,NotificationActionType actionType) async {
    final  result = await Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => NotificationPopupWindow(
            actionType:actionType,
            title: title,
            isActionOn:!isAddNew
        )));

    print("=============result:$result");
    if(actionType == NotificationActionType.kNotificationActionTypeSetUserSMS){
      setState(() {
        mobile = result;
      });
      print("=============kNotificationActionTypeSetSMS:$result");
    }else if(actionType == NotificationActionType.kNotificationActionTypeSetUserEmail){
      setState(() {
        email = result;
      });
      print("=============kNotificationActionTypeSetEmail:$result");
    }
  }
}

class PopupWindow extends StatefulWidget {
  PopupWindow({Key? key}) : super(key: key);

  @override
  State<PopupWindow> createState() => PopupState();
}

class PopupState extends State<PopupWindow> {
  bool isSelectedPhone = false;
  bool isSelectedEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.65),
      body: Padding(
        padding: EdgeInsets.all(ToolHelper.toolHelper.isPad?100:30),
        child: Center(
          child: Container(
            height: ToolHelper.toolHelper.isPad?350:290,
            decoration: BoxDecoration(
              color: ThemeColors.mainBgWhiteAndBlackDeep(context),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  height: ToolHelper.toolHelper.isPad?70:60,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border(
                      bottom: BorderSide(
                        color: ThemeColors.borderColor,
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(child: Text(MyLocalizations.of(context).unbound,style: TextStyle(fontSize: AppTextFont.kAppTextFont_14(),fontWeight: FontWeight.w500),),),
                      Positioned(
                          right: 10,
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                            ),
                            color: Colors.grey,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: ToolHelper.toolHelper.isPad?30:20, right: ToolHelper.toolHelper.isPad?30:20),
                      child: Column(
                        children: [
                          Padding(
                            padding:EdgeInsets.only(
                                top:ToolHelper.toolHelper.isPad?20:0, bottom:ToolHelper.toolHelper.isPad?30: 20, left: 30, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // GestureDetector(
                                //   onTap: (){
                                //     setState(() {
                                //       isSelectedPhone = true;
                                //       isSelectedEmail = false;
                                //     });
                                //     },
                                //   child: Row(children: [
                                //     Text(
                                //         MyLocalizations.of(context).phone,
                                //         style: TextStyle(fontSize: AppTextFont.kAppTextFont_13(),
                                //             color: ThemeColors.textDeepAndWhiteColor(context))),
                                //     SizedBox(width: 5,),
                                //     isSelectedPhone?
                                //     Icon(
                                //       Icons.check_circle,
                                //       size:ToolHelper.toolHelper.isPad?30:28.r,
                                //       color: ThemeColors.isCheckedColor,
                                //     ):Icon(
                                //       // Icons.brightness_1_outlined,
                                //       Icons.check_circle,
                                //       size: ToolHelper.toolHelper.isPad?30:28.r,
                                //       color: ThemeColors.notCheckColor,
                                //     ),
                                //   ],),
                                // ),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      isSelectedPhone = false;
                                      isSelectedEmail = true;
                                    });
                                  },
                                  child: Row(children: [
                                    Text(
                                        MyLocalizations.of(context).email,
                                        style: TextStyle(fontSize: AppTextFont.kAppTextFont_13(),
                                            color: ThemeColors.textDeepAndWhiteColor(context))),
                                    SizedBox(width: 5,),
                                    isSelectedEmail?
                                    Icon(
                                      Icons.check_circle,
                                      size:ToolHelper.toolHelper.isPad?30:28.r,
                                      color: ThemeColors.isCheckedColor,
                                    ):Icon(
                                      // Icons.brightness_1_outlined,
                                      Icons.check_circle,
                                      size: ToolHelper.toolHelper.isPad?30:28.r,
                                      color: ThemeColors.notCheckColor,
                                    )
                                  ],),
                                ),
                              ],
                            ),
                          ),
                          Text(MyLocalizations.of(context).unboundUserPhoneTips,
                            style: TextStyle(fontSize: AppTextFont.kAppTextFont_13(),
                                color: ThemeColors.textDeepAndWhiteColor(context)),),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: ToolHelper.toolHelper.isPad?70:60,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xffe7e7e7),
                      ),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                MyLocalizations.of(context).cancel,
                                style: TextStyle(
                                  color: ThemeColors.textLightAndWhiteColor(context),
                                  fontSize: AppTextFont.kAppTextFont_14(),
                                ),
                              ),
                            ),
                          ),
                        ),),
                        Container(
                          height: double.infinity,
                          width: 1,
                          color: Color(0xffe7e7e7),
                        ),
                        Expanded(child: GestureDetector(
                          onTap: () {
                            _unbind();
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                MyLocalizations.of(context).unbound,
                                style: TextStyle(
                                  color: ThemeColors.textDeepAndWhiteColor(context),
                                  fontSize: AppTextFont.kAppTextFont_14(),
                                ),
                              ),
                            ),
                          ),
                        ),),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _unbind() async {
    int type = 1;
    if(isSelectedPhone){
      type = 1;
    }else if(isSelectedEmail){
      type = 2;
    }

    LoginDataUser user = await SPUtil.getLoginUserData();
    String mobile = user.mobile;
    String email = user.email;

    if(isSelectedPhone && mobile.isEmpty){
      CommonToast.showToast(MyLocalizations.of(context).unboundMobile);
      Navigator.pop(context);
      return;
    }
    if(isSelectedEmail && user.email.isEmpty){
      CommonToast.showToast(MyLocalizations.of(context).unboundEmail);
      Navigator.pop(context);
      return;
    }

    DioManager().post(BaseConfig.API_HOST + "sys/userModMobileOrEmail",
        {
          "type":type,//修改类型 1手机2邮箱
          "mobile":mobile,
          "email":email
        }, (it) async {
          if (it["code"] == 0) {

            if(type == 1){
              user.mobile = "";
              setState(() {
                mobile = "";
              });
            }else if(type == 2){
              user.email = "";
              setState(() {
                email = "";
              });
            }

            Navigator.pop(context,email);
            SPUtil.saveLoginUserData(user);
            CommonToast.showToast("unpair successful");
          } else {
            CommonToast.showToast(it["msg"]);
          }
        }, (error) {
          CommonToast.showToast(MyLocalizations.of(context).reqErrMsg);
        });
  }
}









//change email
import 'package:Live4IoT2/http/API.dart';
import 'package:flutter/material.dart';
import 'package:Live4IoT2/config/BaseConfig.dart';
import 'package:Live4IoT2/http/DioManager.dart';
import 'package:Live4IoT2/utils/DataUtils.dart';
import 'package:Live4IoT2/utils/SPUtil.dart';
import 'package:Live4IoT2/utils/VerifyUtil.dart';
import 'package:Live4IoT2/utils/common_toast.dart';
import 'package:Live4IoT2/widgets/common_appbar.dart';
import 'package:Live4IoT2/widgets/common_btn.dart';
import 'package:Live4IoT2/widgets/common_input_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import '../../http/bean/country_code_entity.dart';
import '../../http/bean/login_entity.dart';
import '../../utils/AppTextFont.dart';
import '../../utils/ColorTheme.dart';
import '../../utils/app_localizations.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({Key? key}) : super(key: key);

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  String userId = "";
  bool inited = false;
  var emailController = TextEditingController();
  var vCodeController = TextEditingController();
  late Timer _timer;
  String _codeText = "Send";
  int _timeCount = 60;
  String countryCode = "1";
  bool showPhoneList = false;
  List countryCodeList = [];
  String email = "";
  bool isSend = false;  //是否发送了邮件

  _getLoginUser() async {
    LoginDataUser user = await SPUtil.getLoginUserData();
    setState(() {
      email = user.email;
    });
  }

  _changeUserInfo(String newEmail) async {
    LoginDataUser user = await SPUtil.getLoginUserData();
    user.email = newEmail;
    SPUtil.saveLoginUserData(user);
  }

  _getVerifyCode() {
    var phone = emailController.text;
    API.postSendVerifyCodeCommonApi(phone, userId, 2, 1, (value) {
      CommonToast.showToast(MyLocalizations.of(context).sendCodeSucMsg);
      _startTimer();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(
        Duration(seconds: 1),
            (Timer timer) => {
          setState(() {
            if (_timeCount <= 1) {
              _codeText = MyLocalizations.of(context).resent;
              _timer.cancel();
              _timeCount = 60;
            } else {
              _timeCount -= 1;
              _codeText = "${_timeCount}s";
            }
          })
        });
  }

  @override
  void initState() {
    _getLoginUser();
    super.initState();
  }

  @override
  dispose() {
    try {
      if (_timer != null) {
        _timer.cancel();
      }
    } catch (e) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(
    //     BoxConstraints(
    //         maxWidth: MediaQuery.of(context).size.width,
    //         maxHeight: MediaQuery.of(context).size.height),
    //     designSize: Size(375, 667),
    //     context: context,
    //     minTextAdapt: true,
    //     orientation: Orientation.portrait);
    var bgColor = Colors.white;
    return CommonAppBar(
        body: Container(
          padding: EdgeInsets.all(20.r),
          margin: EdgeInsets.only(left:20.w,right: 20.w),
          decoration: BoxDecoration(
              color: ThemeColors.mainBgNormalAndBlackDeep(context)
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    MyLocalizations.of(context).originalEmail,
                    style: TextStyle(
                        fontSize: AppTextFont.kAppTextFont_14(),
                        color: ThemeColors.textNorlmalAndWhiteColor(context),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        fontSize: AppTextFont.kAppTextFont_14(),
                        color: ThemeColors.defaultGaryColor
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:20.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            MyLocalizations.of(context).newEmail,
                            style: TextStyle(
                                fontSize: AppTextFont.kAppTextFont_14(),
                                color: ThemeColors.textNorlmalAndWhiteColor(context),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                            width: 120.w,
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                var email = emailController.text;
                                if (Utils.isBlank(email)) {
                                  CommonToast.showToast(
                                      MyLocalizations.of(context).pleaseEnterMsg(MyLocalizations.of(context).emailAddress));
                                  return;
                                }
                                if (!VerifyUtil.isEmail(email)) {
                                  CommonToast.showToast(MyLocalizations.of(context).formatErrMsg(MyLocalizations.of(context).email));
                                  return;
                                }
                                if (_timeCount != 60) {
                                  return;
                                }
                                _getVerifyCode();
                                isSend = true;
                              },
                              child: Text(
                                _codeText,
                                style: TextStyle(
                                  color: Color(0xff44B2FF),
                                  fontSize: AppTextFont.kAppTextFont_14(),
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin:EdgeInsets.only(top:12.h),
                    decoration: BoxDecoration(
                      color:ThemeColors.whiteAndBlackLight(context),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color:ThemeColors.borderColor,
                        width: 1.r,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left:4.w),
                      child: TextField(
                        controller: emailController,
                        style: TextStyle(
                            fontSize: AppTextFont.kAppTextFont_16(),
                            color: ThemeColors.textNorlmalAndWhiteColor(context)
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  if(isSend)
                    Container(
                      margin: EdgeInsets.only(top:30.h),
                      child: Text(
                        MyLocalizations.of(context).verification,
                        style: TextStyle(
                            fontSize: AppTextFont.kAppTextFont_14(),
                            color: ThemeColors.textNorlmalAndWhiteColor(context),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  if(isSend)
                    Container(
                      margin:EdgeInsets.only(top:12.h),
                      padding: EdgeInsets.only(left:4.w),
                      decoration: BoxDecoration(
                        color:ThemeColors.whiteAndBlackLight(context),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:ThemeColors.borderColor,
                          width: 1.r,
                        ),
                      ),
                      child: TextField(
                        controller: vCodeController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                            fontSize: AppTextFont.kAppTextFont_16(),
                            color: ThemeColors.textNorlmalAndWhiteColor(context)
                        ),
                      ),
                    ),
                  if(isSend)
                    Container(
                      margin: EdgeInsets.only(top:32.h),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: (){
                          var email = emailController.text;
                          var vCode = vCodeController.text;
                          if (Utils.isBlank(email)) {
                            CommonToast.showToast(MyLocalizations.of(context).pleaseEnterMsg(MyLocalizations.of(context).phoneNumber));
                            return;
                          }
                          if (!VerifyUtil.isEmail(email)) {
                            CommonToast.showToast(MyLocalizations.of(context).formatErrMsg(MyLocalizations.of(context).email));
                            return;
                          }
                          if (Utils.isBlank(vCode)) {
                            CommonToast.showToast(
                                MyLocalizations.of(context).pleaseEnterMsg(MyLocalizations.of(context).verification));
                            return;
                          }
                          if (!VerifyUtil.isVcode(vCode)) {
                            CommonToast.showToast(MyLocalizations.of(context).vCodeErrMsg);
                            return;
                          }
                          API.postChangeEmailApi(email, vCode, (value) {
                            CommonToast.showToast(
                                MyLocalizations.of(context).modSuccess(MyLocalizations.of(context).email));
                            _changeUserInfo(email);
                            Navigator.pop(context, email);
                          });
                        },
                        child: Icon(
                          Icons.check_circle,
                          size: 60.0.r,
                          color: Color(0xff42b4ff),
                        ),
                      ),
                    ),
                ],
              ),
              if (showPhoneList)
                Positioned(
                  top: 129.h,
                  left: 0.w,
                  child: Container(
                    width: 56.w,
                    height: 160.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ThemeColors.whiteAndBlackLight(context),
                        border: Border.all(color: Color(0xffaaaaaa), width: 1),
                        borderRadius: BorderRadius.circular(6)),
                    child: ListView(
                      children: List.generate(countryCodeList.length, (index) {
                        CountryCodeData countryCodeItem =
                        countryCodeList[index];
                        String codeStr = countryCodeItem.countryCode.toString();
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              showPhoneList = false;
                              countryCode = codeStr;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 3, right: 3, top: 5, bottom: 5),
                            child: Center(
                              child: Text(
                                "+$codeStr",
                                style: TextStyle(color: ThemeColors.textNorlmalAndWhiteColor(context), fontSize: AppTextFont.kAppTextFont_16()),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
            ],
          ),
        ),
        title: MyLocalizations.of(context).changeEmail);
  }
}

//change password
import 'dart:async';

import 'package:Live4IoT2/http/API.dart';
import 'package:Live4IoT2/utils/tool_helper.dart';
import 'package:flutter/material.dart';
import 'package:Live4IoT2/config/BaseConfig.dart';
import 'package:Live4IoT2/http/DioManager.dart';
import 'package:Live4IoT2/utils/DataUtils.dart';
import 'package:Live4IoT2/utils/VerifyUtil.dart';
import 'package:Live4IoT2/utils/common_toast.dart';
import 'package:Live4IoT2/widgets/common_appbar.dart';
import 'package:Live4IoT2/widgets/common_btn.dart';
import 'package:Live4IoT2/widgets/common_input_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../pages/forgot/CommonNextCircleBtn.dart';
import '../../utils/AppTextFont.dart';
import '../../utils/ColorTheme.dart';
import '../../utils/app_localizations.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Timer _timer;
    var bgColor = Colors.white;
    var pwdController = TextEditingController();
    var newPwdController = TextEditingController();
    var confirmPwdController = TextEditingController();
    _changePwd(String pwd, String newPwd, String confirmPwd) {

      API.postChangePwdApi(Utils.md5Encode(pwd), Utils.md5Encode(newPwd), Utils.md5Encode(confirmPwd), (value) {
        CommonToast.showToast(
            MyLocalizations.of(context).changePwdSucMsg);
        _timer = Timer.periodic(Duration(seconds: 1), (timer) {
          Navigator.pushReplacementNamed(context, "/");
          _timer.cancel();
        });
      });
    }

    return CommonAppBar(
        bgColor: ThemeColors.mainBgNormalAndBlackDeep(context),
        body: Container(
          color: ThemeColors.mainBgNormalAndBlackDeep(context),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 17.h, bottom: 17.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/diogle.png",
                      width: 12.r,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      MyLocalizations.of(context).changePwdTit,
                      style: TextStyle(
                          fontSize: AppTextFont.kAppTextFont_12(),
                          color: ThemeColors.textNorlmalAndWhiteColor(context)
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left:30.w,right:30.w),
                decoration: BoxDecoration(
                  color: ThemeColors.whiteAndBlackLight(context),
                ),
                child: Row(
                  children: [
                    Text(
                      "${MyLocalizations.of(context).originalPassword}:",
                      style: TextStyle(
                          color: ThemeColors.textNorlmalAndWhiteColor(context),
                          fontSize: AppTextFont.kAppTextFont_15()
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Expanded(
                        child: TextField(
                          controller: pwdController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: MyLocalizations.of(context).pleaseEnterMsg(MyLocalizations.of(context).originalPassword),
                              hintStyle: TextStyle(
                                  fontSize: AppTextFont.kAppTextFont_13(),
                                  color: ThemeColors.textPlaceHolderColor(context)
                              )
                          ),
                        )
                    )
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 1,
                  color: ThemeColors.borderColor
              ),
              Container(
                padding: EdgeInsets.only(left:30.w,right:30.w),
                decoration: BoxDecoration(
                  color: ThemeColors.whiteAndBlackLight(context),
                ),
                child: Row(
                  children: [
                    Text(
                      "${MyLocalizations.of(context).newPwd}:",
                      style: TextStyle(
                          color: ThemeColors.textNorlmalAndWhiteColor(context),
                          fontSize: AppTextFont.kAppTextFont_15()
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Expanded(
                        child: TextField(
                          controller: newPwdController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: MyLocalizations.of(context).pleaseEnterMsg(MyLocalizations.of(context).newPwd),
                              hintStyle: TextStyle(
                                  fontSize: AppTextFont.kAppTextFont_13(),
                                  color: ThemeColors.textPlaceHolderColor(context)
                              )
                          ),
                        )
                    )
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 1,
                  color: ThemeColors.borderColor
              ),
              Container(
                padding: EdgeInsets.only(left:30.w,right:30.w),
                decoration: BoxDecoration(
                  color: ThemeColors.whiteAndBlackLight(context),
                ),
                child: Row(
                  children: [
                    Text(
                      "${MyLocalizations.of(context).confirmPwd}:",
                      style: TextStyle(
                          color: ThemeColors.textNorlmalAndWhiteColor(context),
                          fontSize: AppTextFont.kAppTextFont_15()
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Expanded(
                        child: TextField(
                          controller: confirmPwdController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: MyLocalizations.of(context).pleaseEnterMsg(MyLocalizations.of(context).confirmPwd),
                              hintStyle: TextStyle(
                                  fontSize: AppTextFont.kAppTextFont_13(),
                                  color: ThemeColors.textPlaceHolderColor(context)
                              )
                          ),
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: ToolHelper.toolHelper.isPad?60:40.h,),
              CommonNextCircleBtn(
                isLastStep: true,
                handleTap: () {
                  // 获取各项密码的值
                  String pwd = pwdController.text.trim().replaceAll(RegExp(r"\s+\b|\b\s"), "");
                  String newPwd = newPwdController.text.trim().replaceAll(RegExp(r"\s+\b|\b\s"), "");
                  String confirmPwd = confirmPwdController.text.trim().replaceAll(RegExp(r"\s+\b|\b\s"), "");

                  if (Utils.isBlank(pwd) ||
                      Utils.isBlank(newPwd) ||
                      Utils.isBlank(confirmPwd)) {
                    CommonToast.showToast(MyLocalizations.of(context).changePwdErrMsg);
                    return;
                  }
                  if (!VerifyUtil.isPwd(pwd) ||
                      !VerifyUtil.isPwd(newPwd) ||
                      !VerifyUtil.isPwd(confirmPwd)) {
                    CommonToast.showToast(
                        MyLocalizations.of(context).pwdErrMsg);
                    return;
                  }
                  if(pwd == newPwd ) {
                    CommonToast.showToast(
                        MyLocalizations.of(context).pwdSameNewPwd);
                    return;
                  }
                  if (newPwd != confirmPwd) {
                    CommonToast.showToast(
                        MyLocalizations.of(context).userPwdNotMatch);
                    return;
                  }
                  _changePwd(pwd, newPwd, confirmPwd);
                },
              ),
            ],
          ),
        ),
        title: MyLocalizations.of(context).changePwd);
  }
}
