// Mixin Logger
mixin Logger {
  void log(String message) {
    print("[${DateTime.now()}] $message");
  }
}

// Mixin Validator
mixin Validator {
  bool isValidEmail(String email) {
    return email.contains("@") && email.contains(".");
  }
}

// Class sử dụng cả 2 mixin
class UserService with Logger, Validator {}

void main() {
  UserService userService = UserService();

  String email1 = "abc@gmail.com";
  String email2 = "abcgmailcom";

  // Kiểm tra email thứ nhất
  if (userService.isValidEmail(email1)) {
    userService.log("$email1 là email hợp lệ.");
  } else {
    userService.log("$email1 không hợp lệ.");
  }

  // Kiểm tra email thứ hai
  if (userService.isValidEmail(email2)) {
    userService.log("$email2 là email hợp lệ.");
  } else {
    userService.log("$email2 không hợp lệ.");
  }
}
//dart run baitap12.dart