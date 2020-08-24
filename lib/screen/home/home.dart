import 'package:article/model/userModel/userModel.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page d'accueil"),),
      body: Container(
      child: Center(
        child: RaisedButton(
          onPressed: (){
            // UserModel.saveTest("bonjour");
          print(UserModel.test);
        }),
      ),
    ),
    );
  }
}