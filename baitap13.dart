// Singleton Pattern
class DatabaseConnection {
  // Instance duy nhất
  static final DatabaseConnection _instance = DatabaseConnection._internal();

  // Private constructor
  DatabaseConnection._internal();

  // Static phương thức lấy instance
  static DatabaseConnection getInstance() {
    return _instance;
  }

  // Kết nối database
  void connect() {
    print("Connected to database");
  }

  // Ngắt kết nối
  void disconnect() {
    print("Disconnected");
  }
}

void main() {
  // Tạo 2 biến tham chiếu đến cùng một instance
  DatabaseConnection db1 = DatabaseConnection.getInstance();
  DatabaseConnection db2 = DatabaseConnection.getInstance();

  // Gọi các phương thức
  db1.connect();
  db2.disconnect();

  // Kiểm tra có cùng địa chỉ không
  print("db1 và db2 có cùng instance: ${identical(db1, db2)}");
}
