class CategoryModel {
  int? status;
  int? categoriesCount;
  List<Category>? categories;

  CategoryModel({this.status, this.categoriesCount, this.categories});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    categoriesCount = json['categories_count'];
    if (json['tags'] != null) {
      categories = <Category>[];
      json['tags'].forEach((v) {
        categories!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['tags_count'] = this.categoriesCount;
    if (this.categories != null) {
      data['tags'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? title;
  String? slug;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.title, this.slug, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
