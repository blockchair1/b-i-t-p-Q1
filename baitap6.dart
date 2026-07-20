import 'dart:io';


int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

int fibonacciMemo(int n, Map<int, int> memo) {
  if (n <= 1) return n;
  

  if (memo.containsKey(n)) {
    return memo[n]!;
  }
  
  memo[n] = fibonacciMemo(n - 1, memo) + fibonacciMemo(n - 2, memo);
  return memo[n]!;
}

void main() {
  stdout.write('Nhập vào số nguyên n (Nên thử n = 40 để thấy rõ sự chênh lệch thời gian): ');
  String? input = stdin.readLineSync();

  if (input != null) {
    int? n = int.tryParse(input.trim());

    if (n != null && n >= 0) {
      print('\nĐang tính toán, vui lòng đợi...');

      Stopwatch stopwatchNormal = Stopwatch()..start();
      int resultNormal = fibonacci(n);
      stopwatchNormal.stop();

      Map<int, int> memo = {};
      Stopwatch stopwatchMemo = Stopwatch()..start();
      fibonacciMemo(n, memo);
      stopwatchMemo.stop();

      print('\n--- KẾT QUẢ ---');
      print('Số Fibonacci thứ $n là: $resultNormal');
      print('⏳ Thời gian chạy (Đệ quy thường)    : ${stopwatchNormal.elapsedMilliseconds} mili-giây');
      print('⚡ Thời gian chạy (Có Memoization)   : ${stopwatchMemo.elapsedMilliseconds} mili-giây');
      
    } else {
      print('❌ Vui lòng nhập một số nguyên dương hợp lệ.');
    }
  }
}