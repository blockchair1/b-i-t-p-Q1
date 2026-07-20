import 'dart:async';

// Giả lập API lấy tên người dùng
Future<String> fetchUserName() async {
  await Future.delayed(Duration(seconds: 2));
  return "Nguyen Van A";
}

// Giả lập API lấy số dư tài khoản
Future<double> fetchUserBalance() async {
  await Future.delayed(Duration(seconds: 1));
  return 1500.5;
}

// Gọi đồng thời bằng Future.wait
Future<void> getUserInfo() async {
  Stopwatch stopwatch = Stopwatch()..start();

  List<dynamic> result = await Future.wait([
    fetchUserName(),
    fetchUserBalance(),
  ]);

  stopwatch.stop();

  print("Tên: ${result[0]}");
  print("Số dư: ${result[1]}");
  print("Thời gian (Future.wait): ${stopwatch.elapsedMilliseconds} ms");
}

// Gọi tuần tự
Future<void> getUserInfoSequential() async {
  Stopwatch stopwatch = Stopwatch()..start();

  String name = await fetchUserName();
  double balance = await fetchUserBalance();

  stopwatch.stop();

  print("Tên: $name");
  print("Số dư: $balance");
  print("Thời gian (Tuần tự): ${stopwatch.elapsedMilliseconds} ms");
}

void main() async {
  print("=== Gọi đồng thời bằng Future.wait ===");
  await getUserInfo();

  print("\n=== Gọi tuần tự ===");
  await getUserInfoSequential();
}
//dart run baitap16.dart