
class Product{
  String? image;
  String? desc;
  double? rating;
  int?    total_ratings;
  String? category;
  double? price;
  bool?   isFav;
  List<String>? thumbnails;
  Product({
    this.image,
    this.desc,
    this.rating,
    this.total_ratings,
    this.category,
    this.price,
    this.isFav,
    this.thumbnails
  });
}