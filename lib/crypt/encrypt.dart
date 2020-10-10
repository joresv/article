import 'package:encrypt/encrypt.dart';

final key = Key.fromUtf8("bonjourtoutlemondejesuisonprogra");
final iv = IV.fromUtf8("hellotoutlemonde");

String encrypt(String text){
final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
final finalCrypt = encrypter.encrypt(text, iv: iv);
return finalCrypt.base64;
}

String decrypt(String text){
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final decrypt = encrypter.decrypt(Encrypted.fromBase64(text), iv: iv);
  return decrypt;
}