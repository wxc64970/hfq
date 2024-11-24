class MaskPhone {
  static String maskPhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 7) {
      return phoneNumber;
    }
    final start = phoneNumber.substring(0, 3);
    final end = phoneNumber.substring(phoneNumber.length - 4);
    return '$start****$end';
  }
}
