class PostModel {
  int? id;
  String? name;
  String? email;
  Null emailVerifiedAt;
  Null currentTeamId;
  String? profilePhotoPath;
  String? about;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? title;
  String? slug;
  String? featuredimage;
  String? body;
  String? status;
  Null like;
  Null dislike;
  String? views;
  String? profilePhotoUrl;

  PostModel(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.currentTeamId,
      this.profilePhotoPath,
      this.about,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.title,
      this.slug,
      this.featuredimage,
      this.body,
      this.status,
      this.like,
      this.dislike,
      this.views,
      this.profilePhotoUrl});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    title = json['title'];
    slug = json['slug'];
    featuredimage = json['featuredimage'];
    body = json['body'];
    status = json['status'];
    like = json['like'];
    dislike = json['dislike'];
    views = json['views'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['current_team_id'] = currentTeamId;
    data['profile_photo_path'] = profilePhotoPath;
    data['about'] = about;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_id'] = userId;
    data['title'] = title;
    data['slug'] = slug;
    data['featuredimage'] = featuredimage;
    data['body'] = body;
    data['status'] = status;
    data['like'] = like;
    data['dislike'] = dislike;
    data['views'] = views;
    data['profile_photo_url'] = profilePhotoUrl;
    return data;
  }
}
