import 'dart:convert';

import 'package:article/crypt/encrypt.dart';
import 'package:http/http.dart' as http;

class Api {
  static addPost(Map data) async{
    final response = await http.post(Url.addPost, body: {
      "data": encrypt(jsonEncode(data))
    });

    if(response.statusCode == 200){
      var result = jsonDecode(decrypt(response.body));
      if(result[0]) return result;
      else return null;
    }else{
      return null;
    }
  }

  static getPost() async{
    final response = await http.get(Url.getpost);
    if(response.statusCode == 200){
      return jsonDecode(decrypt(response.body));
    } else{
      return null;
    }
  }

  static getPostUser(String id) async{
    final response = await http.post(Url.upost, body: {
      "id_user":encrypt(id),
      "type": encrypt("1")
    });

    if(response.statusCode == 200){
      return jsonDecode(decrypt(response.body));
    } else{
      return null;
    }
  }

  static updatePost(Map data) async{
    final response = await http.post(Url.upost, body: {
      "data": encrypt(jsonEncode(data)),
      "type": encrypt("2")
    });

    if(response.statusCode == 200){
      var result = jsonDecode(decrypt(response.body));
      if(result[0]) return result;
      else return null;
    }else{
      return null;
    }
  }

  static deletePost(List data) async{
    final response = await http.post(Url.delete, body: {
      "id_posts": encrypt(jsonEncode(data)),
    });
    if(response.statusCode == 200){
      var result = jsonDecode(decrypt(response.body));
      print(result[0]);
      if(result[0]) return result;
      else return null;
    }else{
      return null;
    }
  }
}

class Url {
  static String addPost = "https://mesprojetsapp.000webhostapp.com/article/addPost.php";
  static String getpost = "https://mesprojetsapp.000webhostapp.com/article/getpost.php";
  static String upost = "https://mesprojetsapp.000webhostapp.com/article/updatepost.php";
  static String delete = "https://mesprojetsapp.000webhostapp.com/article/deletepost.php";
}