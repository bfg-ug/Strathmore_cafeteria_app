class Food {
  String name;
  String price;
  String rating;
  String imagepath;

  Food(
      {required this.price,
      required this.name,
      required this.imagepath,
      required this.rating});

  String get _name => name;
  String get _price => price;
  String get _rating => rating;
  String get _imagepath => imagepath;
}
