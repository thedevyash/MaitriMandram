class Post {
  List? likes;
  String? sId;
  String? title;
  String? content;
  String? author;
  List? comments;

  Post(
      {this.likes,
      this.sId,
      this.title,
      this.content,
      this.author,
      this.comments});

  Post.fromJson(Map<String, dynamic> json) {
    likes = json['likes'];
    sId = json['_id'];
    title = json['title'];
    content = json['content'];
    author = json['author'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['likes'] = this.likes;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['author'] = this.author;
    data['comments'] = this.comments;
    return data;
  }
}
