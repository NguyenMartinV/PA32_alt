import 'DataUtils.dart';

class VerifyUtil {
  // 邮箱判断
  static String emailErrMsg = "Email format is incorrect";
  static bool isEmail(String input) {
    String regexEmail =
        "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}\$";
    if (Utils.isBlank(input)) return false;
    return RegExp(regexEmail).hasMatch(input);
  }

  // 手机号 美国
  static String phoneErrMsg = "Phone format is incorrect";
  // flag表示输入的内容是否包含国家码前面的加号 包含0个或1个
  static bool isPhone(String input, [bool flag = false]) {
    String regexPhone = "^\\S{10,20}\$";
    if (flag) {
      regexPhone = "^\\+?[^+]{10,20}\$";
    }
    if (Utils.isBlank(input)) return false;
    return RegExp(regexPhone).hasMatch(input);
  }

  // 手机号 中国
  static String phoneChinaErrMsg = "Phone format is incorrect";
  static bool isPhoneChina(String input) {
    String regexPhone = "^1[35789]\\d{9}\$";
    if (Utils.isBlank(input)) return false;
    return RegExp(regexPhone).hasMatch(input);
  }

  // 用户名 字母开头的4-32位非空字符
  static String uniNameErrMsg = "Username/Email/Mobile is 4-64 characters";
  static bool isUniName(String input) {
    if (Utils.isBlank(input)) return false;
    return input.length >= 4 && input.length <= 64;
  }

  // 用户名 字母开头的4-32位非空字符
  static String userNameErrMsg =
      "Username starts with letter and exclude @ symbol and length between 4 and 32";
  static bool isUserName(String input) {
    String regexUname = "^[a-zA-Z]((?!@).){3,32}\$";
    if (Utils.isBlank(input)) return false;
    return RegExp(regexUname).hasMatch(input);
  }

  // 密码 6-32位非空字符
  static String pwdErrMsg = "Password is 6-32 characters";
  static bool isPwd(String input) {
    String regexPwd = "^\\S{6,32}\$";
    if (Utils.isBlank(input)) return false;
    return RegExp(regexPwd).hasMatch(input);
  }

  // 设备编号 7-32位字母数字
  static String deviceNoErrMsg = "Device No. is 7-32 letters and numbers";
  static bool isDeviceNo(String input) {
    String regexDno = "^[0-9a-zA-Z]{7,32}\$";
    if (Utils.isBlank(input)) return false;
    return RegExp(regexDno).hasMatch(input);
  }

  // 设备名称 2-32位字母数字
  static String deviceNameErrMsg = "Device name is 2-32 letters and numbers";
  static bool isDeviceName(String input) {
    String regexDname = "^[a-zA-Z0-9\\s]{2,32}\$";
    if (Utils.isBlank(input)) return false;
    return RegExp(regexDname).hasMatch(input);
  }

  // firstName/lastName判断 长度等于4位
  static String shortNameErrMsg = " length between 2-128";
  static bool isShortName(String input) {
    if (Utils.isBlank(input)) return false;
    return input.length >= 2 && input.length <= 128;
  }

  // 验证码 长度等于4位
  static String vCodeErrMsg = "Verification code is 4 digit number";
  static bool isVcode(String input) {
    if (Utils.isBlank(input)) return false;
    return input.length == 4;
  }
}
