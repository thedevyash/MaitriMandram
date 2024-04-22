class UserModel {
  List? followBy;
  List? jobsApplied;
  String? sId;
  String? name;
  String? email;
  String? profilePic;
  String? password;
  String? phone;
  String? city;
  String? state;
  List? myposts;
  List? jobsPosted;
  List? followTo;

  UserModel(
      {this.followBy,
      this.jobsApplied,
      this.sId,
      this.name,
      this.email,
      this.profilePic,
      this.password,
      this.phone,
      this.city,
      this.state,
      this.myposts,
      this.jobsPosted,
      this.followTo});

  UserModel.fromJson(Map<String, dynamic> json) {
    followBy = json['followBy'];
    jobsApplied = json['jobsApplied'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    profilePic = json['profilePic'];
    password = json['password'];
    phone = json['phone'];
    city = json['city'];
    state = json['state'];
    myposts = json['myposts'];
    jobsPosted = json['jobsPosted'];
    followTo = json['followTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.followBy != null) {
      data['followBy'] = this.followBy!.map((v) => v.toJson()).toList();
    }
    if (this.jobsApplied != null) {
      data['jobsApplied'] = this.jobsApplied!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profilePic'] = this.profilePic;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['state'] = this.state;
    if (this.myposts != null) {
      data['myposts'] = this.myposts!.map((v) => v.toJson()).toList();
    }
    if (this.jobsPosted != null) {
      data['jobsPosted'] = this.jobsPosted!.map((v) => v.toJson()).toList();
    }
    if (this.followTo != null) {
      data['followTo'] = this.followTo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Myposts {
//   String? title;
//   String? content;
//   String? author;
//   String? authorID;
//   List? comments;
//   List? likes;
//   String? sId;
//   int? iV;

//   Myposts(
//       {this.title,
//       this.content,
//       this.author,
//       this.authorID,
//       this.comments,
//       this.likes,
//       this.sId,
//       this.iV});

//   Myposts.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     content = json['content'];
//     author = json['author'];
//     authorID = json['authorID'];
//     comments = json['comments'];
//     likes = json['likes'];
//     sId = json['_id'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['content'] = this.content;
//     data['author'] = this.author;
//     data['authorID'] = this.authorID;
//     if (this.comments != null) {
//       data['comments'] = this.comments!.map((v) => v.toJson()).toList();
//     }
//     if (this.likes != null) {
//       data['likes'] = this.likes!.map((v) => v.toJson()).toList();
//     }
//     data['_id'] = this.sId;
//     data['__v'] = this.iV;
//     return data;
//   }
// }

// class JobsPosted {
//   String? jobtitle;
//   String? postedBy;
//   String? jobcategory;
//   List? applications;
//   String? description;
//   Details? details;
//   String? sId;

//   JobsPosted(
//       {this.jobtitle,
//       this.postedBy,
//       this.jobcategory,
//       this.applications,
//       this.description,
//       this.details,
//       this.sId});

//   JobsPosted.fromJson(Map<String, dynamic> json) {
//     jobtitle = json['jobtitle'];
//     postedBy = json['postedBy'];
//     jobcategory = json['jobcategory'];
//     applications = json['applications'];
//     description = json['description'];
//     details = json['details'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['jobtitle'] = this.jobtitle;
//     data['postedBy'] = this.postedBy;
//     data['jobcategory'] = this.jobcategory;
//     if (this.applications != null) {
//       data['applications'] = this.applications!.map((v) => v.toJson()).toList();
//     }
//     data['description'] = this.description;
//     if (this.details != null) {
//       data['details'] = this.details!.toJson();
//     }
//     data['_id'] = this.sId;
//     return data;
//   }
// }

// class Details {
//   String? stipend;

//   Details({this.stipend});

//   Details.fromJson(Map<String, dynamic> json) {
//     stipend = json['stipend'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['stipend'] = this.stipend;
//     return data;
//   }
// }

// class FollowTo {
//   String? name;
//   String? userID;

//   FollowTo({this.name, this.userID});

//   FollowTo.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     userID = json['userID'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['userID'] = this.userID;
//     return data;
//   }
// }
