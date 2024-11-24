bool validatePhoneNumber(String value) {
  // 简单的手机号码正则表达式验证
  final RegExp phoneRegex = RegExp(r'^1[3-9]\d{9}$');
  return phoneRegex.hasMatch(value);
}
