import 'dart:convert';
import 'package:encrypt/encrypt.dart';

class DESEncrypt {
  static String base64ToStr(String base64Data) {
    final bytes = base64.decode(base64Data);
    return utf8.decode(bytes);
  }

  static String generatekey(int offset) {
    String library =
        'SFVvYVN0Uk9kZXZ3ZlZJMUtzTUNqR2lReDByY21ieVhnaE5rQkxGNVdUN3VEbnpQWTY0cDkyQTNKbHFFWjg=';
    String lis = base64ToStr(library);
    String keyNum = 'NTh8N3wyOXwzMXw0NnwtMnwyN3w0NHwxNXw0NXw1OA==';
    String keyVal = base64ToStr(keyNum);
    String key = '';
    List<String> numList = keyVal.split('|');
    for (String num in numList) {
      key = key + lis[int.parse(num) + offset];
    }
    return key;
  }

  static String encryptByDES(String message) {
    String key = generatekey(3);
    final keyBytes = utf8.encode(key);
    // final encrypter = Encrypter(
    //   DES(keyBytes, mode: DESMode.ecb, padding: 'PKCS7'),
    // );
    final encrypter =
        Encrypter(AES(keyBytes as Key, mode: AESMode.ecb, padding: 'PKCS7'));
    final encrypted = encrypter.encrypt(message);
    return encrypted.base64;
  }

  static String decryptByDES(String ciphertext, String type) {
    String key = generatekey(3);
    final keyBytes = utf8.encode(key);
    final encrypter = Encrypter(
      AES(keyBytes as Key, mode: AESMode.ecb, padding: 'PKCS7'),
    );
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(ciphertext));
    String decVal = decrypted;
    if (type == 'phone') {
      decVal = decVal.replaceAllMapped(RegExp(r'(\d{3})\d{4}(\d{4})'),
          (Match m) => '${m.group(1)}****${m.group(2)}');
    }
    if (type == 'idCard') {
      decVal = decVal.replaceAllMapped(RegExp(r'(\d{3})\d{11}(\d{4})'),
          (Match m) => '${m.group(1)}***********${m.group(2)}');
    }
    return decVal;
  }
}
