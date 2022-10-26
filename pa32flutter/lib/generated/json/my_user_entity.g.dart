import 'package:pa32/generated/json/base/json_convert_content.dart';
import 'package:pa32/http/bean/my_user_entity.dart';

MyUserEntity $MyUserEntityFromJson(Map<String, dynamic> json) {
  final MyUserEntity myUserEntity = MyUserEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    myUserEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    myUserEntity.msg = msg;
  }
  final MyUserData? data = jsonConvert.convert<MyUserData>(json['data']);
  if (data != null) {
    myUserEntity.data = data;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    myUserEntity.count = count;
  }
  return myUserEntity;
}

Map<String, dynamic> $MyUserEntityToJson(MyUserEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  data['count'] = entity.count;
  return data;
}

MyUserData $MyUserDataFromJson(Map<String, dynamic> json) {
  final MyUserData myUserData = MyUserData();
  final MyUserDataUser? user =
      jsonConvert.convert<MyUserDataUser>(json['user']);
  if (user != null) {
    myUserData.user = user;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    myUserData.token = token;
  }
  return myUserData;
}

Map<String, dynamic> $MyUserDataToJson(MyUserData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['user'] = entity.user?.toJson();
  data['token'] = entity.token;
  return data;
}

MyUserDataUser $MyUserDataUserFromJson(Map<String, dynamic> json) {
  final MyUserDataUser myUserDataUser = MyUserDataUser();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    myUserDataUser.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    myUserDataUser.nickname = nickname;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    myUserDataUser.userName = userName;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    myUserDataUser.phone = phone;
  }
  final int? verifyStatus = jsonConvert.convert<int>(json['verifyStatus']);
  if (verifyStatus != null) {
    myUserDataUser.verifyStatus = verifyStatus;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    myUserDataUser.email = email;
  }
  final int? userType = jsonConvert.convert<int>(json['userType']);
  if (userType != null) {
    myUserDataUser.userType = userType;
  }
  final String? orgId = jsonConvert.convert<String>(json['orgId']);
  if (orgId != null) {
    myUserDataUser.orgId = orgId;
  }
  final String? groupId = jsonConvert.convert<String>(json['groupId']);
  if (groupId != null) {
    myUserDataUser.groupId = groupId;
  }
  final String? pwd = jsonConvert.convert<String>(json['pwd']);
  if (pwd != null) {
    myUserDataUser.pwd = pwd;
  }
  final String? regTime = jsonConvert.convert<String>(json['regTime']);
  if (regTime != null) {
    myUserDataUser.regTime = regTime;
  }
  final int? clientOffset = jsonConvert.convert<int>(json['clientOffset']);
  if (clientOffset != null) {
    myUserDataUser.clientOffset = clientOffset;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    myUserDataUser.icon = icon;
  }
  final int? removable = jsonConvert.convert<int>(json['removable']);
  if (removable != null) {
    myUserDataUser.removable = removable;
  }
  final String? loginTime = jsonConvert.convert<String>(json['loginTime']);
  if (loginTime != null) {
    myUserDataUser.loginTime = loginTime;
  }
  final int? deleted = jsonConvert.convert<int>(json['deleted']);
  if (deleted != null) {
    myUserDataUser.deleted = deleted;
  }
  final List<String>? roleIds =
      jsonConvert.convertListNotNull<String>(json['roleIds']);
  if (roleIds != null) {
    myUserDataUser.roleIds = roleIds;
  }
  final int? standards = jsonConvert.convert<int>(json['standards']);
  if (standards != null) {
    myUserDataUser.standards = standards;
  }
  return myUserDataUser;
}

Map<String, dynamic> $MyUserDataUserToJson(MyUserDataUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['nickname'] = entity.nickname;
  data['userName'] = entity.userName;
  data['phone'] = entity.phone;
  data['verifyStatus'] = entity.verifyStatus;
  data['email'] = entity.email;
  data['userType'] = entity.userType;
  data['orgId'] = entity.orgId;
  data['groupId'] = entity.groupId;
  data['pwd'] = entity.pwd;
  data['regTime'] = entity.regTime;
  data['clientOffset'] = entity.clientOffset;
  data['icon'] = entity.icon;
  data['removable'] = entity.removable;
  data['loginTime'] = entity.loginTime;
  data['deleted'] = entity.deleted;
  data['roleIds'] = entity.roleIds;
  data['standards'] = entity.standards;
  return data;
}
