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
import 'package:pa32/component/common_appbar.dart';
import 'package:pa32/component/common_toast.dart';
import 'package:pa32/http/DioManager.dart';
import 'package:pa32/http/bean/customer_info_detail_entity.dart';
import 'package:pa32/http/config/BaseConfig.dart';
import 'package:pa32/utils/DataUtils.dart';
import 'package:pa32/utils/SPUtil.dart';

import '../component/common_bar_item.dart';
import '../component/my_divider.dart';

class CustomerPage extends StatefulWidget {
  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  bool flag = true;
  String customerId = '';
  String nickname = '';
  String userName = '';
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String birth = '';
  String address = '';
  String phone = '';
  String physicalCondition = '';
  int gender = 0;
  final ImagePicker _picker = ImagePicker();
  String imgSrc = "";
  String myToken = "";
  String token = "";
  DateTime _dateTime = DateTime.now();
  String state = "";
  String addressDetail = "";
  String zipCode = "";
  //获取customer Detail列表
  _customerDetail(
    String customerId,
    int mask,
    int arrayMask,
    String count,
  ) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/customerDetail",
      {
        "customerId": customerId,
        "mask": mask,
        "arrayMask": arrayMask,
        "count": count,
      },
      (success) {
        CustomerInfoDetailEntity bean =
            CustomerInfoDetailEntity.fromJson(success);
        // SPUtil.save("myIcon", bean.data?.icon as String);
        if (bean.code == 0) {
          CustomerInfoDetailData myBean = bean.data as CustomerInfoDetailData;

          if (myBean.physicalCondition != null) {
            setState(() {
              physicalCondition = myBean.physicalCondition as String;
            });
          }
          setState(() {
            nickname = myBean.nickname as String;
            userName = myBean.userName as String;
            firstName = myBean.firstName as String;
            middleName = myBean.middleName as String;
            lastName = myBean.lastName as String;
            birth = myBean.birth as String;
            address = myBean.address as String;
            gender = myBean.gender as int;
            state = myBean.state ?? "";
            addressDetail = myBean.detailAddress ?? "";
            zipCode = myBean.zipCode ?? "";
            if(!Utils.isBlank(birth)){
              List list = birth.split("-");
              setState(() {
                _dateTime = DateTime(
                  int.parse(list[0]),
                  int.parse(list[1]),);
              });
            }
            SPUtil.getToken().then(
              (value) => {
                setState(() {
                  if (myBean.icon == '0') {
                    // print("5555555555555");
                    imgSrc = '';
                    return;
                  }
                  imgSrc =
                      '${BaseConfig.API_HOST}file/view?code=userIcon&id=${myBean.icon as String}&token=Bearer $value';
                })
              },
            );
          });
          // print("-------------${myBean}");
        }
      },
      (error) {},
    );
  }

//修改customer信息 customerMod
  _customerMod(String id, int fieldId, String fieldValue) async {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/customerMod",
      {
        "id": id,
        "fieldId": fieldId,
        "fieldValue": fieldValue,
      },
      (success) {
        if (success['code'] == 0) {
          setState(() {
            imgSrc =
            '${BaseConfig.API_HOST}file/view?code=userIcon&id=$fieldValue&token=Bearer $token';
          });
          // Navigator.pushNamed(context, "/CustomerPage");
        }
      },
      (error) {},
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

    token = await SPUtil.getToken() ?? "";
    // print("++++99+++:$formData");
    DioManager().upload(
        BaseConfig.API_HOST + "file/upload?code=userIcon&token=Bearer $token",
        formData, (it) {
      // print("++++++++++103:$it");
      if (it["code"] == 0) {
        var data = it["data"];
        var iconId = data["id"];

        setState(() {
          imgSrc =
              '${BaseConfig.API_HOST}file/view?code=userIcon&id=$iconId&token=Bearer $token';
        });

        CommonToast.showToast("Modify successfully");
        // 更新用户头像信息并保存
        SPUtil.save("myIcon", iconId);

        /* SPUtil.get("myIcon")
            .then((value) => print("2222222222222222:${value}")); */

        _customerMod(
          customerId,
          3,
          "$iconId",
        );
        return;
      }
    }, (error) {
      CommonToast.showToast("Request error");
    });
  }

  _modGenderOrBirth(String id, int fieldId, String fieldValue) {
    DioManager().post(
      BaseConfig.API_HOST + "pa32/customerMod",
      {
        "id": id,
        "fieldId": fieldId,
        "fieldValue": fieldValue,
      },
          (success) {
        if (success['code'] == 0) {
          CommonToast.showToast("modify successfully");
        } else {
          CommonToast.showToast(success['msg']);
        }
      },
          (error) {},
    );
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
        SPUtil.get("onlyCustomerId").then(
              (value) => {
            _modGenderOrBirth(
              "$value",
              5,
              "${_dateTime.toString().substring(0, 7)}",
            )
          },
        );
      },
      // onChanged: (p) => print(p),
    );
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
      SPUtil.get("onlyCustomerId").then(
        (value) => {
          _customerDetail("$value", 15, 15, "0:1,3:10"),
          setState(() {
            customerId = value.toString();
          })
        },
      );
      flag = false;
    }
    String genderName = "";
    switch(gender){
      case 1:genderName = "Male";break;
      case 2:genderName = "Female";break;
    }
    return CommonAppBar(
      bgColor:  const Color(0xffF2F2F2),
      title: "Customer Information",
      body:
      Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20,left:13.w,right: 13.w,bottom: 20),
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
                              map["from"] = "customer";
                              map["nickname"] = nickname;
                              final result = await Navigator.pushNamed(context, "/nickName",arguments:map);
                              if(result is String){
                                setState(() {
                                  nickname = result;
                                });
                              }
                            },
                            title:"Nickname",
                            suffix: Text(
                                nickname!=""?nickname:"Enter your nickname",
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
                              map["from"] = "customer";
                              map["firstName"] = firstName;
                              map["middleName"] = middleName;
                              map["lastName"] = lastName;
                              final result = await Navigator.pushNamed(context, "/SetName",arguments:map);
                              if(result is Map){
                                setState(() {
                                  firstName = result["firstName"].toString();
                                  middleName = result["middleName"].toString();
                                  lastName = result["lastName"].toString();
                                  userName = "$firstName $middleName $lastName";
                                });
                              }
                            },
                            suffix: Text(
                                userName!=""?userName:"Enter your name",
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
                                  SPUtil.get("onlyCustomerId")
                                      .then((value) => {_modGenderOrBirth("$value", 4, "$gender")});
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
                              map["from"] = "customer";
                              Navigator.pushNamed(context, "/SearchAddress", arguments: map)
                                  .then((value) {
                                if(value is Map){
                                  setState(() {
                                    address = value["state"] + value["address"] + value["zipCode"];
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
                                  address,
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
                                  "from":"customer",
                                  "customerId": customerId,
                                  "physicalCondition": physicalCondition,
                                },
                              );
                              if(result is String){
                                setState(() {
                                  physicalCondition = result;
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
                                    physicalCondition!=""?physicalCondition:"Enter your physical health status, such as allergic drugs, heart disease, skin disease, fever, infectious disease, disability or hearing, visual impairment, and other medical treatment",
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
