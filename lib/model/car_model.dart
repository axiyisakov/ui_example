class CarModel {
  final String name;
  final String fuel;
  final String price;
  final String image;
  bool? isFavourite;
  CarModel(
      {required this.fuel,
      required this.name,
      required this.image,
      required this.isFavourite,
      required this.price});

  set favourite(bool? isFavourite) => this.isFavourite = isFavourite;
  bool? get favourite => isFavourite;
}
