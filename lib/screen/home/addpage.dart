import 'package:article/api/api.dart';
import 'package:article/model/userModel/postModel.dart';
import 'package:article/model/userModel/userModel.dart';
import 'package:article/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class AppPost extends StatefulWidget {
  @override
  _AppPostState createState() => _AppPostState();
}

class _AppPostState extends State<AppPost> {

@override
void initState() { 
  super.initState();
}
  CustomTextField titre =
      new CustomTextField(placeholder: "Entrer le titre", title: "Titre");
  CustomTextField detail = new CustomTextField(
      placeholder: "Entrer le detail", title: "Détail", line: 5);
  PostModel myPost = new PostModel();
  bool post = false;

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    titre.err = "veillez entrer le titre";
    detail.err = "veillez entrer le detail";
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un Post"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Nouvelle Publication",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                titre.textfrofield(),
                SizedBox(
                  height: 10,
                ),
                detail.textfrofield(),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                    onPressed: post?null: () async {
                      if (_key.currentState.validate()) {
                        setState(() {
                          post = true;
                        });
                        myPost.titre = titre.value;
                        myPost.detail = detail.value;
                        myPost.user = UserModel.sessionUser.id;
                        var result = await Api.addPost(myPost.toMap());
                        if(result != null && result[0]){
                          setState(() {
                            post = false;
                          });
                          Navigator.of(context).pop();
                        }else if(result != null && !result[0]){
                          setState(() {
                            post = false;
                          });
                        }else{
                          setState(() {
                            post = false;
                          });
                        }
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Publier",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.redAccent.withOpacity(.7)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
