import 'package:clover/model/category_model.dart';
import 'package:clover/model/photo_model.dart';

class ProductModel {
  int? id;
  String? name;
  double? price;
  String? description;
  CategoryModel? category;
  List<PhotosModel>? photos;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.category,
    this.photos,
  });

  ProductModel.fromJsonn(Map<String, dynamic> json) {
    id = json['id'];
    name = json['product_name'];
    price = double.parse(json['product_price'].toString());
    description = json['product_description'];
    category = CategoryModel.fromJson(json['category']);
    photos = json['photos']
        .map<PhotosModel>((photo) => PhotosModel.fromJson(photo))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_name': name,
      'product_price': price,
      'product_description': description,
      'category': category!.toJson(),
      'photos': photos!.map((photo) => photo.toJson()).toList(),
    };
  }
}
