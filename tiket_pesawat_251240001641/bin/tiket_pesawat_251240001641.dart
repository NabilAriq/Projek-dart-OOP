enum SeatClass {
  economy("Economy", 1.0),
  business("Business", 1.5),
  firstClass("First Class", 2.0);

  final String label;
  final double priceMultiplier;

  const SeatClass(this.label, this.priceMultiplier);

  String get description {
    print("class : $label");
    return label;
  }
}

enum FlightStatus {
  onTime,
  delayed,
  boarding,
  departed,
  cancelled;
}

abstract class Flight {
  String flightNumber;
  String origin;
  String destination;
  double basePrice;
  FlightStatus status;

  Flight(this.flightNumber, this.origin, this.destination, this.basePrice, this.status);

  double calculateFinalPrice(SeatClass seatClass);

  void printInfo(SeatClass seatClass){
    print("Flight Details :");
    print("---------------------------------------------------------");
    print("Flight Number : $flightNumber");
    print("Origin        : $origin");
    print("Destination   : $destination");
    print("Base Price    : $basePrice");
    print("Status        : ${status.name}");
    print("Seat Class    : ${seatClass.label}");
    print("Final Price   : ${calculateFinalPrice(seatClass)}\n");
  }   
}

class DomesticFlight extends Flight {
  DomesticFlight(String flightNumber, String origin, String destination, double basePrice, FlightStatus status) : super(flightNumber, origin, destination, basePrice, status);

  @override
  double calculateFinalPrice(SeatClass seatClass) {
    return basePrice * seatClass.priceMultiplier + 50000;
  }
}

class InternationalFlight extends Flight {
  InternationalFlight(String flightNumber, String origin, String destination, double basePrice, FlightStatus status) : super(flightNumber, origin, destination, basePrice, status);

  @override
  double calculateFinalPrice(SeatClass seatClass) {
    return basePrice * seatClass.priceMultiplier + 200000;
  }
}

void main() {


  DomesticFlight jakartaBali = DomesticFlight("DOM0001", "Jakarta", "Bali", 500000, FlightStatus.boarding);
  InternationalFlight japanSemarang = InternationalFlight("INT0001", "Semarang", "Japan", 12000000, FlightStatus.onTime);

  jakartaBali.status = FlightStatus.delayed;
  japanSemarang.status = FlightStatus.boarding;

  jakartaBali.calculateFinalPrice(SeatClass.economy);
  jakartaBali.calculateFinalPrice(SeatClass.business);
  jakartaBali.calculateFinalPrice(SeatClass.firstClass);

  japanSemarang.calculateFinalPrice(SeatClass.economy);
  japanSemarang.calculateFinalPrice(SeatClass.business);
  japanSemarang.calculateFinalPrice(SeatClass.firstClass);

  jakartaBali.printInfo(SeatClass.economy);
  jakartaBali.printInfo(SeatClass.business);
  jakartaBali.printInfo(SeatClass.firstClass);

  japanSemarang.printInfo(SeatClass.economy);
  japanSemarang.printInfo(SeatClass.business);
  japanSemarang.printInfo(SeatClass.firstClass);
}
