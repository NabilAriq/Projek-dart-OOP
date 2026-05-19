abstract class MenuItem {
  String name;
  double basePrice;
  
  MenuItem(this.name, this.basePrice);
  
  double calculatePrice();

  void printItem(){
    print("nama : $name");
    print("harga : $basePrice");
    print("total : ${calculatePrice()}");
  }

  @override
  String toString() => "$name : Rp${calculatePrice()}";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuItem &&
        other.runtimeType == runtimeType &&
        other.name == name;
  }
}

class Food extends MenuItem {
  Food(String name, double basePrice) : super(name, basePrice);

  @override
  double calculatePrice() {
    return basePrice;
  }
}

class Beverage extends MenuItem {
  Beverage(String name, double basePrice) : super(name, basePrice);

  @override
  double calculatePrice() {
    return basePrice + 2000;
  }
}

class Dessert extends MenuItem {
  String size;

  Dessert(String name, double basePrice, this.size) : super(name, basePrice);

  @override
  double calculatePrice() {
    if (size == "M"){
      return basePrice * 1.5;
    } else if (size == "L"){
      return basePrice * 2;
    } else {
      return basePrice;
    }
  } 
}

class Discount {
  String name;
  double percentage;

  Discount(this.name, this.percentage);

  double call(double price){
      return price - (price * percentage);
  }
}

typedef TaxCalculator = double Function(double price);

class Order {
  String custName;
  List<MenuItem> items = [];

  Order(this.custName);

  void addItem(MenuItem item) {
    items.add(item);
  }

  void printBill(Discount discount, TaxCalculator taxCalculator) {
    double subTotal = 0;
    
    for(var item in items){
      print("- $item");
      double jumlahDiskon = discount.percentage * item.calculatePrice();
      subTotal += item.calculatePrice();
      subTotal -= jumlahDiskon;
    }

    print(taxCalculator);
    print(subTotal);
  }
}

void main(List<String> args) {
  Order orderanNabil = Order("Nabil");

  orderanNabil.addItem(Food("Nasgor Goreng", 15000));
  orderanNabil.addItem(Beverage("Es Teh", 3000));
  orderanNabil.addItem(Dessert("Kue mas rusdi", 25000, "M"));

  Discount happyHour = Discount("Happy Hour", 0.1);

  double hitungPajak(double price) => price * 0.11;

  orderanNabil.printBill(happyHour, hitungPajak);
}


