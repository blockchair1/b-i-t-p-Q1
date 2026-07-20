import 'dart:async';

// Tạo Stream đếm ngược
Stream<int> countdown() async* {
  await for (int i
      in Stream.periodic(Duration(seconds: 1), (count) => 10 - count)
          .takeWhile((value) => value >= 0)) {
    yield i;
  }
}

void main() async {
  await for (int number in countdown()) {
    print(number);

    if (number == 0) {
      print("Kết thúc!");
    }
  }
}
//dart run baitap17.dart