class Product{

  static List<Product> getProducts() => [
    Product('Chicken Mayo Sandwich', 30, 'snack'),
    Product('Chutney Sandwich', 20, 'snack'),
    Product('Tuna Sandwich', 40, 'snack'),
    Product('Ham and Cheese Sandwich', 50, 'snack'),
    Product('Falooda', 30, 'drink'),
    Product('Coffee', 15, 'drink'),
    Product('Lassi', 40, 'drink'),
    Product('Chickoo Shake', 30, 'drink'),
  ];

  String pName;
  int pPrice;
  String pType;

  Product(this.pName, this.pPrice, this.pType);
}