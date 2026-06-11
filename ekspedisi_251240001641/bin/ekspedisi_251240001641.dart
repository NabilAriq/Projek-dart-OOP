
abstract class ShippingService {
  String get serviceName;

  double calculateShippingCost(double weightKG, String destination);
  int estimateDeliveryDays(String destination);

  void printEstimate(double weightKG, String destination) {
    calculateShippingCost(weightKG, destination);
    estimateDeliveryDays(destination);
  }
}

abstract class TrackableService {
  String trackPackage(String trackingNumber);
}

class JNEService implements ShippingService, TrackableService {
  @override
  String get serviceName => "JNE";

  @override
  double calculateShippingCost(double weightKG, String destination) {
    double ongkir = weightKG * 12000;
    return ongkir;
  }

  @override
  int estimateDeliveryDays(String destination) {
    if (destination == "Jakarta") {
      return 1;
    } else {
      return 3;
    }
  }

  @override
  String trackPackage(String trackingNumber) {
    return trackingNumber;
  }

  @override 
  void printEstimate(double weightKG, String destination) {
    print("$serviceName");
    print("Total Biaya         : ${calculateShippingCost(weightKG, destination)}");
    print("Estimasi Pengiriman : ${estimateDeliveryDays(destination)}\n");
  }
}

class SiCepatService implements ShippingService, TrackableService {
  @override
  String get serviceName => "SiCepat";

  @override
  double calculateShippingCost(double weightKG, String destination) {
    double ongkir = weightKG * 10000;
    return ongkir;
  }
  
  @override
  int estimateDeliveryDays(String destination) {
    if (destination == "Jakarta") {
      return 1;
    } else {
      return 2;
    }
  }

  @override
  String trackPackage(String trackingNumber) {
    return trackingNumber;
  }

  @override 
  void printEstimate(double weightKG, String destination) {
    print("$serviceName");
    print("Total Biaya         : ${calculateShippingCost(weightKG, destination)}");
    print("Estimasi Pengiriman : ${estimateDeliveryDays(destination)}\n");
  }
}

class PosIndonesiaService implements ShippingService {
  @override
  String get serviceName => "Pos Indonesia";

  @override
  double calculateShippingCost(double weightKG, String destination) {
    double ongkir = weightKG * 7000;
    return ongkir;
  }

  @override
  int estimateDeliveryDays(String destination) {
    if (destination == "Jakarta") {
      return 2;
    } else {
      return 7;
    }
  }

  @override 
  void printEstimate(double weightKG, String destination) {
    print("$serviceName");
    print("Total Biaya         : ${calculateShippingCost(weightKG, destination)}");
    print("Estimasi Pengiriman : ${estimateDeliveryDays(destination)}\n");
  }
}

class ShippingComparator {
  final List<ShippingService> services;

  ShippingComparator(this.services);

  void compareAll(double weightKG, String destination) {
    for (ShippingService service in services) {
      service.printEstimate(weightKG, destination);
    }
  }
}

void main() {
  ShippingComparator comparator = ShippingComparator([
    JNEService(),
    SiCepatService(),
    PosIndonesiaService(),
  ]);

  comparator.compareAll(2.5, "Surabaya");

  String nomorResiDummy = "RESI123456789";

  for (var service in comparator.services){
    if (service is TrackableService) {
      var trackable = service as TrackableService;

      String statusTracking = trackable.trackPackage(nomorResiDummy);
      print(statusTracking);
    } else {
      print("[${service.serviceName}]");
    }
  }
}