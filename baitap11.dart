// Lớp trừu tượng
abstract class Vehicle {
  void move();
}

// Lớp Car
class Car extends Vehicle {
  @override
  void move() {
    print("Car: Di chuyển bằng bánh xe");
  }
}

// Lớp Bike
class Bike extends Vehicle {
  @override
  void move() {
    print("Bike: Di chuyển bằng hai bánh");
  }
}

// Lớp Airplane
class Airplane extends Vehicle {
  @override
  void move() {
    print("Airplane: Bay trên không");
  }
}

void main() {
  // Danh sách các phương tiện
  List<Vehicle> vehicles = [Car(), Bike(), Airplane()];

  // Duyệt danh sách và gọi phương thức move()
  for (Vehicle vehicle in vehicles) {
    vehicle.move();
  }
}
//dart run baitap11.dart