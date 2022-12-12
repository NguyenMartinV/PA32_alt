import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:flutter_pickers/time_picker/model/suffix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pa32/component/common_bar_item.dart';
import 'package:pa32/component/my_divider.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/DataUtils.dart';
import 'package:pa32/utils/SPUtil.dart';
import '../component/common_appbar.dart';
import '../component/common_toast.dart';

class ServicePage extends StatefulWidget {
  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  String myToken = "";
  String myIconId = "";
  String pageFrom = "";
  String InitNickname = '';
  String InitFirstname = '';
  String InitMiddlename = '';
  String InitLastname = '';
  String fullName = "";
  // String InitBirth = '';
  int gender = 1;
  String InitAddress = '';
  String InitPCondition = '';
  var weAddress = '';
  String deviceId = '';
  bool flag = true;
  DateTime _dateTime = DateTime.now();
  var deviceController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String imgSrc = "";
  String state = "";
  String addressDetail = "";
  String zipCode = "";

  void _showDatePicker() {
    Pickers.showDatePicker(
      context,
      // 模式，详见下方
      mode: DateMode.YM,
      // 后缀 默认Suffix.normal()，为空的话Suffix()
      suffix: Suffix(),
      // 样式
      pickerStyle: Utils.pickerStyle("Birthday"),
      // 默认选中
      selectDate: PDuration.parse(_dateTime),
      onConfirm: (pd) {
        setState(() {
          _dateTime = DateTime(
              pd.year!,
              pd.month!,);
        });
      },
      // onChanged: (p) => print(p),
    );
  }

  _customerAdd(
    String imei,
    String icon,
    String nickname,
    String firstName,
    String middleName,
    String lastName,
    int gender,
    String birth,
    String address,
    String PCondition,
    String state,
    String detailAddress,
    String zipCode
  ) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/customerAdd",
      {
        "imei": imei,
        "icon":icon,
        "nickname": nickname,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "gender": gender,
        "birth": birth,
        "address": address,
        "physicalCondition": PCondition,
        "state":state,
        "detailAddress":detailAddress,
        "zipCode":zipCode
      },
      (success) {
        if (success['code'] == 0) {
          // print(success['code']);
          // Navigator.pop(context);
          // Navigator.pushNamed(context, "/$pageFrom");
          Navigator.pushNamed(context, "/BottomNavi");
        } else {
          CommonToast.showToast(success['msg']);
        }
      },
      (error) {
        print(error);
      },
    );
  }

  _setAvatar([String? type]) async {
    Navigator.pop(context);
    if (type == "camera") {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        _uploadImg(photo);
      }
    } else if (type == "album") {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _uploadImg(image);
      }
    }
  }

  _uploadImg(XFile image) async {
    String path = image.path;
    String name = path.substring(path.lastIndexOf("/") + 1, path.length);
    String suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    FormData formData = FormData.fromMap({
      // "withLoading": false, //这里写其他需要传递的参数
      "file": await MultipartFile.fromFile(path,
          filename: name, contentType: MediaType('image', suffix)),
    });

    var token = await SPUtil.getToken();
    // print("++++99+++:$formData");
    DioManager().upload(
        BaseConfig.API_HOST + "file/upload?code=userIcon&token=Bearer $token",
        formData, (it) {
      // print("++++++++++103:$it");
      if (it["code"] == 0) {
        var data = it["data"];
        var iconId = data["id"];

        setState(() {
          myIconId = iconId;
          imgSrc =
              '${BaseConfig.API_HOST}file/view?code=userIcon&id=$iconId&token=Bearer $token';
        });

        CommonToast.showToast("Update user avatar successfully");
        // 更新用户头像信息并保存
        SPUtil.save("myIcon", iconId);

        return;
      }
    }, (error) {
      CommonToast.showToast("Request error");
    });
  }

  Future _openModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 170.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Camera', textAlign: TextAlign.center),
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
                    title: Text('Album', textAlign: TextAlign.center),
                    onTap: () {
                      _setAvatar("album");
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Cancel',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
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
    if (flag) {
      var args = ModalRoute.of(context)!.settings.arguments;

      if (args != null && args is Map) {
        // print(args);
        pageFrom = args['page'];
      }
      print(pageFrom);
    }
    String genderName = "";
    switch(gender){
      case 1:genderName = "Male";break;
      case 2:genderName = "Female";break;
    }
    // Navigator.pushNamed(context, "/$pageFrom");
    return
      CommonAppBar(
        bgColor:  const Color(0xffF2F2F2),
        title: "Activate Wecare Service",
        body:Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 12.0.h, bottom: 12.0.h,left:13.w,right: 13.w),
                          padding: EdgeInsets.only(left: 24.0.w,right: 24.0.w,),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Device No.: ",
                                style: TextStyle(color:Color(0xff222222), fontSize: 15.sp),
                              ),
                              Expanded(
                                // color: Colors.red,
                                child: TextField(
                                  // autofocus: false,
                                  controller: deviceController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color:Color(0xff222222)
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: Container(
                                  width: 17,
                                  height: 16,
                                  child: Image.asset(
                                    "assets/images/service_add.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, "/scanQrcode").then((value) {
                                    setState(() {
                                      if (value != null) {
                                        deviceController.text = value.toString();
                                      } else {
                                        deviceController.text = '';
                                      }
                                    });
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left:13.w,right: 13.w),
                          padding: EdgeInsets.only(
                            left: 24.0.w,
                            right: 24.0.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              CommonBarItem(
                                title:"Photo",
                                handleTap: (){
                                  _openModalBottomSheet();
                                },
                                suffixIcon: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Utils.isBlank(imgSrc)
                                      ? Image.asset(
                                    "assets/images/avatar.png",
                                    fit: BoxFit.fill,
                                    width: 32.r,
                                    height: 32.r,
                                  )
                                      : Image.network(
                                    imgSrc,
                                    fit: BoxFit.fill,
                                    width: 32.r,
                                    height: 32.r,
                                  ),
                                ),
                              ),
                              MyDivider(),
                              CommonBarItem(
                                  handleTap: () async {
                                    Map<String,String> map = {};
                                    map["from"] = "service";
                                    map["nickname"] = InitNickname;
                                    final result = await Navigator.pushNamed(context, "/nickName",arguments:map);
                                    if(result is String){
                                      setState(() {
                                        InitNickname = result;
                                      });
                                    }
                                  },
                                  title:"Nickname",
                                  suffix: Text(
                                    InitNickname!=""?InitNickname:"Enter your nickname",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Color(0x99222222),
                                    )
                                  ),
                                ),
                              MyDivider(),
                              CommonBarItem(
                                title:"Name",
                                handleTap: () async {
                                  Map<String,String> map = {};
                                  map["from"] = "service";
                                  map["firstName"] = InitFirstname;
                                  map["middleName"] = InitMiddlename;
                                  map["lastName"] = InitLastname;
                                  final result = await Navigator.pushNamed(context, "/SetName",arguments:map);
                                  if(result is Map){
                                    setState(() {
                                      InitFirstname = result["firstName"].toString();
                                      InitMiddlename = result["middleName"].toString();
                                      InitLastname = result["lastName"].toString();
                                      fullName = "$InitFirstname $InitMiddlename $InitLastname";
                                    });
                                  }
                                },
                                suffix: Text(
                                  fullName!=""?fullName:"Enter your name",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Color(0x99222222),
                                  )
                                ),
                              ),
                              MyDivider(),
                              CommonBarItem(
                                title:"Gender",
                                handleTap: (){
                                  Pickers.showSinglePicker(context,
                                    data: ['Male', 'Female'],
                                    selectData: genderName,
                                    pickerStyle: Utils.pickerStyle("Gender"),
                                    onConfirm: (p, position) {
                                      setState(() {
                                        if(position == 0){
                                          gender = 1;
                                          genderName = "Male";
                                        }else if(position == 1){
                                          gender = 2;
                                          genderName = "Female";
                                        }
                                      });
                                    },
                                  );
                                },
                                suffix: Text(
                                    genderName,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Color(0x99222222),
                                    )
                                ),
                              ),
                              MyDivider(),
                              CommonBarItem(
                                title:"Birthday",
                                handleTap: (){
                                  _showDatePicker();
                                },
                                suffix: Text("${formatDate(_dateTime, [
                                  yyyy,
                                  '-',
                                  mm,
                                ])}",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Color(0x99222222),
                                    )),
                              ),
                              MyDivider(),
                              CommonBarItem(
                                title:"Address",
                                handleTap: (){
                                  Map<String,String> map = {};
                                  map["state"] = state;
                                  map["address"] = addressDetail;
                                  map["zipCode"] = zipCode;
                                  map["from"] = "service";
                                  Navigator.pushNamed(context, "/SearchAddress", arguments: map)
                                      .then((value) {
                                    if(value is Map){
                                      setState(() {
                                        weAddress = value["state"] + value["address"] + value["zipCode"];
                                        state = value["state"];
                                        addressDetail = value["address"];
                                        zipCode = value["zipCode"];
                                      });
                                    }
                                  });
                                },
                                suffix:
                                Container(
                                  width:130,
                                  child: Text(
                                      weAddress,
                                      maxLines: 1,
                                      softWrap: true,
                                      textAlign: TextAlign.right,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Color(0x99222222),
                                      )
                                  ),
                                ),

                                // suffixIcon: Container(
                                //   margin: EdgeInsets.only(right: 5.w),
                                //   child: Image.asset(
                                //     "assets/images/map.png",
                                //     width: 20,
                                //     height: 20,
                                //   ),
                                // ),
                              ),
                              MyDivider(),

                              GestureDetector(
                                onTap: () async {
                                  final result = await Navigator.pushNamed(
                                    context,
                                    "/PhysicalPage",
                                    arguments: {
                                      "from":"service",
                                      "physicalCondition": InitPCondition,
                                    },
                                  );
                                  if(result is String){
                                    setState(() {
                                      InitPCondition = result;
                                    });
                                  }
                                },
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(top: 10.h),
                                        // padding: EdgeInsets.only(left: 25.w,right: 25.w),
                                        child:Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Physical Condition",
                                                style: TextStyle(
                                                    fontSize: 15.sp
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              color: Color(0xFF969696),
                                              // size: 20.r,
                                            )
                                          ],
                                        )
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(top:5.h),
                                      padding: EdgeInsets.only(bottom: 10.h),
                                      child:Text(
                                        InitPCondition!=""?InitPCondition:"Enter your physical health status, such as allergic drugs, heart disease, skin disease, fever, infectious disease, disability or hearing, visual impairment, and other medical treatment",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          height: 1.8,
                                          color: Color(0x99222222),
                                        ),
                                      )
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          margin: EdgeInsets.only(top: 20.0,left:11.5.w,right: 11.5.w),
                          decoration: BoxDecoration(
                            color: Color(0xff028AFE),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: Text(
                              "Complete",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 18.0),
                            ),
                            onTap: () {
                              _customerAdd(
                                '${deviceController.text}',
                                "$myIconId",
                                '$InitNickname ',
                                '$InitFirstname ',
                                '$InitMiddlename ',
                                '$InitLastname ',
                                gender,
                                '${_dateTime.toString().substring(0, 7)} ',
                                "$weAddress",
                                '$InitPCondition ',
                                state,
                                addressDetail,
                                zipCode
                              );

                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
      );
  }
}
