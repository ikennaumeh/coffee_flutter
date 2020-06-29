class Coffee {
  final String coffeeName;
  final String coffeeImage;
  final String coffeePrice;
  final String coffeesubText;

  Coffee(
      {this.coffeeName,
      this.coffeeImage,
      this.coffeePrice,
      this.coffeesubText});
}

class CoffeeList {
  static List<Coffee> _coffeeList = [
    Coffee(
        coffeeName: "Cappuccino",
        coffeeImage: "images/coffee1.jpg",
        coffeePrice: "150",
        coffeesubText: "Latesso"),
    Coffee(
        coffeeName: "Espresso",
        coffeeImage: "images/coffee2.jpg",
        coffeePrice: "200",
        coffeesubText: "Latesso"),
    Coffee(
        coffeeName: "Ristretto",
        coffeeImage: "images/coffee3.jpg",
        coffeePrice: "300",
        coffeesubText: "Latesso"),
    Coffee(
        coffeeName: "Americano",
        coffeeImage: "images/coffee4.jpg",
        coffeePrice: "350",
        coffeesubText: "Latesso"),
    Coffee(
        coffeeName: "Latte",
        coffeeImage: "images/coffee5.jpg",
        coffeePrice: "400",
        coffeesubText: "Latesso")
  ];

  static List<Coffee> get coffeeList {
    return _coffeeList;
  }
}

class CappucinoCoffeeList {
  static List<Coffee> _cappucinocoffeelist = [
    Coffee(
        coffeeName: "Cappuccino",
        coffeeImage: "images/coffee1.jpg",
        coffeePrice: "150",
        coffeesubText: "Latesso"),
  ];
  static List<Coffee> get cappucinocoffeelist {
    return _cappucinocoffeelist;
  }
}

class AmericanoCoffeeList {
  static List<Coffee> _americanocoffeelist = [
    Coffee(
        coffeeName: "Americano",
        coffeeImage: "images/coffee4.jpg",
        coffeePrice: "350",
        coffeesubText: "Latesso"),
  ];
  static List<Coffee> get americanocoffeelist {
    return _americanocoffeelist;
  }
}
