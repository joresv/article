import 'package:article/screen/authentification/login.dart';
import 'package:article/screen/authentification/register.dart';
import 'package:article/screen/home/home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool visible = true, login=true;
  toggle(){
    setState(() {
      visible = !visible;
    });
  }
  islogin(){
    setState(() {
      login=!login;
    });
  }
  @override
  Widget build(BuildContext context) {
    return login?Home():visible? Login(toggle, islogin):Register(toggle);
  }
}