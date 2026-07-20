import 'dart:io';

void main() {
  int? number;

  while (number == null) {
    print("Nhập một số nguyên:");

    try {
      String input = stdin.readLineSync()!;
      number = int.parse(input);

      print("Bạn đã nhập đúng: $number");
    } catch (e) {
      print("Lỗi: Vui lòng nhập một số nguyên hợp lệ!");
    }
  }
}