class PhotosModel {
  int? id;
  String? url;

  PhotosModel({
    this.id,
    this.url,
  });

  PhotosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['product_image_path'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_image_path': url,
    };
  }
}
