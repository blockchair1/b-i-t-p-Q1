import 'dart:io';

void main() {
  print("Nhập n:");
  int n = int.parse(stdin.readLineSync()!);

  int tong = 0;

  for (int i = 1; i <= n; i++) {
    if (i % 3 == 0) {
      tong += i;
    }
  }

  print("Tổng các số chia hết cho 3 từ 1 đến $n là: $tong");
}
//dart run baitap1.dart