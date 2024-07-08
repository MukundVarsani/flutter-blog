class UserPostModel {
  int? status;
  int? postsCount;
  UserDetails? userDetails;
  List<Posts>? posts;

  UserPostModel({this.status, this.postsCount, this.userDetails, this.posts});

  UserPostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    postsCount = json['posts_count'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['posts_count'] = this.postsCount;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  factory UserPostModel.fromMap(Map<String, dynamic> json) {
    return UserPostModel(
      status: json['status'],
      postsCount: json['posts_count'],
      userDetails: json['user_details'] != null
          ? UserDetails.fromJson(json['user_details'])
          : null,
      posts: json['posts'] != null
          ? List<Posts>.from(json['posts'].map((post) => Posts.fromJson(post)))
          : null,
    );
  }
}

class UserDetails {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  Null? currentTeamId;
  String? profilePhotoPath;
  String? about;
  String? createdAt;
  String? updatedAt;
  String? profilePhotoUrl;

  UserDetails(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.currentTeamId,
      this.profilePhotoPath,
      this.about,
      this.createdAt,
      this.updatedAt,
      this.profilePhotoUrl});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['current_team_id'] = this.currentTeamId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['about'] = this.about;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }

  factory UserDetails.fromMap(Map<String, dynamic> json) {
    return UserDetails(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      currentTeamId: json['current_team_id'],
      profilePhotoPath: json['profile_photo_path'],
      about: json['about'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      profilePhotoUrl: json['profile_photo_url'],
    );
  }
}

class Posts {
  int? id;
  String? userId;
  String? title;
  String? slug;
  String? featuredimage;
  String? body;
  String? status;
  Null? like;
  Null? dislike;
  String? views;
  String? createdAt;
  String? updatedAt;

  Posts(
      {this.id,
      this.userId,
      this.title,
      this.slug,
      this.featuredimage,
      this.body,
      this.status,
      this.like,
      this.dislike,
      this.views,
      this.createdAt,
      this.updatedAt});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    slug = json['slug'];
    featuredimage = json['featuredimage'];
    body = json['body'];
    status = json['status'];
    like = json['like'];
    dislike = json['dislike'];
    views = json['views'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['featuredimage'] = this.featuredimage;
    data['body'] = this.body;
    data['status'] = this.status;
    data['like'] = this.like;
    data['dislike'] = this.dislike;
    data['views'] = this.views;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
