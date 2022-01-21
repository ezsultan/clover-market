class CategoryModel {
  int? id;
  String? name;

  CategoryModel({
    this.id,
    this.name,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['sub_category_name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sub_category_name': name,
    };
  }
}
