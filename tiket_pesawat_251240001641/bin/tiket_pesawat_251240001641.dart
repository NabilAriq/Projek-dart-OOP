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

