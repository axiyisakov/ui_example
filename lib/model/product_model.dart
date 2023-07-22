class Product {
  bool? isFavourite;
  String? image;
  Product({required this.image, required this.isFavourite});
  set favourite(bool isFavourite) {
    this.isFavourite = isFavourite;
  }

  bool get favourite => isFavourite!;
}
