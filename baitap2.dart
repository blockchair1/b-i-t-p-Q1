// Hàm kiểm tra chuỗi đối xứng theo yêu cầu đề bài
bool isPalindrome(String str) {
  int length = str.length;
  
  // Dùng vòng lặp chạy từ đầu chuỗi đến vị trí chính giữa
  // Phép chia ~/ 2 là chia lấy phần nguyên trong Dart
  for (int i = 0; i < length ~/ 2; i++) {
    // So sánh ký tự ở đầu (i) với ký tự ở cuối tương ứng (length - 1 - i)
    if (str[i] != str[length - 1 - i]) {
      // Chỉ cần 1 cặp ký tự khác nhau, kết luận luôn là sai (false)
      return false;
    }
  }
  
  // Nếu vòng lặp chạy xong mà không bị thoát ra giữa chừng => Chuỗi đối xứng
  return true;
}

void main() {
  // Kiểm tra với các ví dụ trong đề bài
  String test1 = "racecar";
  String test2 = "hello";

  print('Chuỗi "$test1" -> ${isPalindrome(test1)}');
  print('Chuỗi "$test2" -> ${isPalindrome(test2)}');
}