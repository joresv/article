import 'dart:convert';

import 'package:article/model/userModel/userModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var user = UserModel.fromJson({
      "id":"1",
      "nom":"jores",
      "email":"jores@gmail.com"
    });

  save() async{
    SharedPreferences p = await SharedPreferences.getInstance();
    p.setString("user", "jores");
    p.commit();
  }

  getTest() async{
    String t=""; 
    var p = await SharedPreferences.getInstance();
    t = p.getString("user");
    print(t);
    return t;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Center(
        child: RaisedButton(onPressed: (){
          UserModel.getUser();
        }),
      ),
    ),
    );
  }
}