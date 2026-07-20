import 'dart:io';
import 'dart:math';

// Giả lập API lấy tỷ giá USD -> VND
Future<double> fetchExchangeRate() async {
  await Future.delayed(Duration(seconds: 1));

  // Giả lập API có thể bị lỗi
  if (Random().nextBool()) {
    return 25500.0;
  } else {
    throw Exception("Không thể kết nối API!");
  }
}

void main() async {
  while (true) {
    print("\nNhập số tiền USD (hoặc 'exit' để thoát):");
    String input = stdin.readLineSync()!;

    // Thoát chương trình
    if (input.toLowerCase() == "exit") {
      print("Đã thoát chương trình.");
      break;
    }

    try {
      // Chuyển đổi sang số
      double usd = double.parse(input);

      double rate;

      try {
        // Gọi API lấy tỷ giá
        rate = await fetchExchangeRate();
        print("Tỷ giá hiện tại: $rate VND/USD");
      } catch (e) {
        // Nếu API lỗi thì dùng tỷ giá mặc định
        print("Lỗi API: $e");
        print("Sử dụng tỷ giá mặc định: 23000 VND/USD");
        rate = 23000.0;
      }

      // Quy đổi
      double vnd = usd * rate;

      print(
          "$usd USD = ${vnd.toStringAsFixed(0)} VND");
    } catch (e) {
      print("Vui lòng nhập đúng số tiền!");
    }
  }
}
//dart run baitap20.dart