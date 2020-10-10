import 'dart:convert';

import 'package:article/api/api.dart';
import 'package:article/model/userModel/postModel.dart';
import 'package:article/model/userModel/userModel.dart';
import 'package:article/screen/home/addpage.dart';
import 'package:article/screen/home/updatePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  final VoidCallback login;
  Home({this.login});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color whiteColor = Colors.white;
  TextStyle style = TextStyle(color: Colors.white);
  List<PostModel> postModel = [];
  getdata() async{
    var data = await Api.getPost();
    if(data != null){
      postModel.clear();
      for(Map i in data){
        setState(() {
          postModel.add(PostModel.fromJson(i));
        });
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page d'accueil"),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(FontAwesomeIcons.signOutAlt, color: Colors.white,), onPressed: (){
            widget.login.call();
            UserModel.logOut();
          }),
          IconButton(icon: Icon(Icons.refresh, color: Colors.white,), onPressed: (){
            print("test");
            getdata();
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton.icon(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AppPost()));
                }, icon: Icon(Icons.add, color: whiteColor), label: Text("Ajouter", style: style,), color: Colors.green),
                FlatButton.icon(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PostUser()));
                }, icon: Icon(Icons.edit, color: whiteColor), label: Text("Modifier", style: style,), color: Colors.yellow),
                FlatButton.icon(onPressed: (){}, icon: Icon(Icons.delete, color: whiteColor), label: Text("Supprimer", style: style,), color: Colors.red),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height/1.25,
              child: ListView.builder(
                itemCount: postModel.length,
                itemBuilder: (context, i){
                  final post = postModel[i];
                  return Card(
                    color: Colors.green[100],
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(post.titre, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Divider(),
                          Text(post.detail),
                          Divider(),
                          Text("publier le: "+post.date_post)
                        ],
                      ),
                    ),
                  );
                },
              )
            )
          ],
        ),),
    );
  }
}