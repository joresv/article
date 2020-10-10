class PostModel {
  String titre;
  String detail, date_post;
  String user, id_post;
  PostModel({this.titre, this.detail, this.user, this.date_post, this.id_post});


  factory PostModel.fromJson(Map<String, dynamic> j){
    return PostModel(
      id_post: j['id_post'],
      titre: j["titre"],
      detail: j["detail"],
      date_post: j["date_post"],
      user: j['id_user']
    );
  }

  Map toMap(){
    return {
      "id_post": id_post,
      "id_user": user,
      "titre": titre,
      "detail": detail
    };
  }
}