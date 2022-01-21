import 'package:clover/model/category_model.dart';
import 'package:clover/model/photo_model.dart';

class ProductModel {
  int? id;
  String? name;
  double? discount;
  double? price;
  String? description;
  CategoryModel? category;
  List<PhotosModel>? photos;

  ProductModel({
    this.id,
    this.name,
    this.discount,
    this.price,
    this.description,
    this.category,
    this.photos,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['product_name'];
    price = double.parse(json['product_price'].toString());
    discount = double.parse(json['product_discount'].toString());
    description = json['product_description'];
    category = CategoryModel.fromJson(json['sub_category']);
    photos = json['photos']
        .map<PhotosModel>((photo) => PhotosModel.fromJson(photo))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_name': name,
      'producut_discount': discount,
      'product_price': price,
      'product_description': description,
      'sub_category': category!.toJson(),
      'photos': photos!.map((photo) => photo.toJson()).toList(),
    };
  }
}
