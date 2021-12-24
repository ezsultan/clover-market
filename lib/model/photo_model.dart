class PhotosModel {
  int? id;
  String? url;

  PhotosModel({
    this.id,
    this.url,
  });

  PhotosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['path_to_product_image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path_to_product_image': url,
    };
  }
}
