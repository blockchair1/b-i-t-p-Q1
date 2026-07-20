import 'dart:io';

void main() {
  print('BẢNG CỬU CHƯƠNG TỪ 2 ĐẾN 9\n');

  for (int i = 1; i <= 10; i++) {
    for (int j = 2; j <= 9; j++) {
      String bcc = '$j x $i = ${j * i}';
      stdout.write(bcc.padRight(15));
    }
    print('');
  }
}