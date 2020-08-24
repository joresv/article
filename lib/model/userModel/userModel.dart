import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  String id;
  String nom;
  String email;
  UserModel({this.id, this.nom, this.email});
  factory UserModel.fromJson(Map<String, dynamic> i)=>UserModel(
    id: i['id'],
    nom: i['nom'],
    email: i['email']
  );
  static UserModel sessionUser;
  Map<String, dynamic> toMap()=>{
    "id":id,
    "nom":nom,
    "email":email
  };

  static  save(UserModel user) async{
    SharedPreferences p = await SharedPreferences.getInstance();
    p.setString("user", json.encode(user.toMap()));
    p.commit();
  }

  static Future<UserModel> get currentuser async{
    SharedPreferences p = await SharedPreferences.getInstance();
    var user = UserModel.fromJson(json.decode(p.getString("user")));
    return user!=null?user:null;
  }
  static void saveTest(String a) async{
    SharedPreferences p = await SharedPreferences.getInstance();
    await p.setString("test", a);
    print("enregis");
  }

  static void test() async{
    SharedPreferences p = await SharedPreferences.getInstance();
    var val = p.getString('test');
    print(val);
  }
}