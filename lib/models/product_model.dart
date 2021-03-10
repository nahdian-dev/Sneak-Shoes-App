class ProductModel {
  final String img;
  final String img2;
  final String img3;
  final String logo;
  final String title;
  final double price;
  bool isSelected;

  ProductModel({
    this.img,
    this.img2,
    this.img3,
    this.logo,
    this.title,
    this.price,
    this.isSelected = false,
  });
}
