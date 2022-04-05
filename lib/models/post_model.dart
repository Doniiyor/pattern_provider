
class Post {

  String? id;
  String? title;
  String? content;


  Post({this.id, this.title, this.content, });

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        content = json['content'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
  };
}