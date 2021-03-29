class Product{

  static List<Product> getProducts() => [

    //burgers
    Product('Chicken Burger', 30, 'snack'),
    Product('Veg Burger', 30, 'snack'),
    Product('Cheesy Chicken Burger', 50, 'snack'),
    Product('Cheesy Veg Burger', 50, 'snack'),
    Product('Special Chicken Burger', 75, 'snack'),
    Product('Double Chicken Burger', 100, 'snack'),
    Product('Double Veg Burger', 100, 'snack'),
    Product('Mighty Burger', 150, 'snack'),

    //rolls
    Product('Chicken Roll', 20, 'snack'),
    Product('Chicken Schezwan Roll', 40, 'snack'),
    Product('Chicken Caferal Roll', 40, 'snack'),
    Product('Chicken Hot Dog Roll', 30, 'snack'),
    Product('Chicken Kebab Roll', 30, 'snack'),
    Product('Mushroom Roll', 30, 'snack'),
    Product('Paneer Roll', 50, 'snack'),

    //pizzas
    Product('Chicken Cheese Pizza', 100, 'snack'),
    Product('Chicken Kebab Pizza', 100, 'snack'),
    Product('Chicken Schezwan Pizza', 100, 'snack'),
    Product('Chicken Mexican Pizza', 100, 'snack'),
    Product('Cheese Pizza', 75, 'snack'),
    Product('Veg Loaded Pizza', 75, 'snack'),
    Product('Golden Corn Pizza', 75, 'snack'),
    Product('Tomato & Cheese Pizza', 75, 'snack'),
    Product('Mushroom Pizza', 75, 'snack'),

    //sandwiches
    Product('Chicken Mayo Sandwich', 30, 'snack'),
    Product('Chicken Peri Peri Sandwich', 30, 'snack'),
    Product('Ham & Cheese Sandwich', 50, 'snack'),
    Product('Club Sandwich', 75, 'snack'),
    Product('Tuna Sandwich', 40, 'snack'),
    Product('Sweetcorn Sandwich', 25, 'snack'),
    Product('Chutney Sandwich', 20, 'snack'),
    Product('Cheese Sandwich', 25, 'snack'),
    Product('Veg Sandwich', 30, 'snack'),

    //drinks
    Product('Coffee', 15, 'drink'),
    Product('Tea', 15, 'drink'),
    Product('Mocktails', 30, 'drink'),
    Product('Seasonal Fruit Shake', 30, 'drink'),
    Product('Lassi', 40, 'drink'),
    Product('Oreo Shake', 75, 'drink'),
    Product('Kitkat Shake', 75, 'drink'),
    Product('Snickers Shake', 75, 'drink'),

  ];

  String pName;
  int pPrice;
  String pType;

  Product(this.pName, this.pPrice, this.pType);
}