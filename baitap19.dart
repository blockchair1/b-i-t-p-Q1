import 'dart:io';

// Lớp Book
class Book {
  String id;
  String title;
  String author;
  int year;

  Book(this.id, this.title, this.author, this.year);

  // Chuyển đối tượng thành chuỗi để lưu file
  @override
  String toString() {
    return "$id|$title|$author|$year";
  }

  // Tạo Book từ chuỗi
  factory Book.fromString(String data) {
    List<String> parts = data.split("|");
    return Book(
      parts[0],
      parts[1],
      parts[2],
      int.parse(parts[3]),
    );
  }
}

// Lớp quản lý thư viện
class Library {
  List<Book> books = [];
  final String fileName = "books.txt";

  // Đọc dữ liệu từ file
  void loadBooks() {
    try {
      File file = File(fileName);

      if (file.existsSync()) {
        List<String> lines = file.readAsLinesSync();
        books = lines.map((e) => Book.fromString(e)).toList();
        print("Đã đọc ${books.length} sách từ file.");
      }
    } catch (e) {
      print("Lỗi đọc file: $e");
    }
  }

  // Lưu dữ liệu vào file
  void saveBooks() {
    try {
      File file = File(fileName);

      file.writeAsStringSync(
        books.map((e) => e.toString()).join("\n"),
      );

      print("Đã lưu dữ liệu vào books.txt");
    } catch (e) {
      print("Lỗi ghi file: $e");
    }
  }

  // Thêm sách
  void addBook() {
    print("Mã sách:");
    String id = stdin.readLineSync()!;

    print("Tên sách:");
    String title = stdin.readLineSync()!;

    print("Tác giả:");
    String author = stdin.readLineSync()!;

    print("Năm xuất bản:");
    int year = int.parse(stdin.readLineSync()!);

    books.add(Book(id, title, author, year));

    print("Thêm sách thành công!");
  }

  // Hiển thị
  void displayBooks() {
    if (books.isEmpty) {
      print("Danh sách trống.");
      return;
    }

    for (Book book in books) {
      print(
          "Mã: ${book.id} | Tên: ${book.title} | Tác giả: ${book.author} | Năm: ${book.year}");
    }
  }

  // Tìm sách
  void searchBook() {
    print("Nhập tên hoặc tác giả:");
    String keyword = stdin.readLineSync()!.toLowerCase();

    var result = books.where((book) =>
        book.title.toLowerCase().contains(keyword) ||
        book.author.toLowerCase().contains(keyword));

    if (result.isEmpty) {
      print("Không tìm thấy.");
    } else {
      for (var book in result) {
        print(
            "${book.id} - ${book.title} - ${book.author} - ${book.year}");
      }
    }
  }

  // Xóa sách
  void deleteBook() {
    print("Nhập mã sách cần xóa:");
    String id = stdin.readLineSync()!;

    books.removeWhere((book) => book.id == id);

    print("Đã xóa (nếu tồn tại).");
  }
}

void main() {
  Library library = Library();

  // Đọc dữ liệu khi khởi động
  library.loadBooks();

  while (true) {
    print("\n===== QUẢN LÝ THƯ VIỆN =====");
    print("1. Thêm sách");
    print("2. Hiển thị sách");
    print("3. Tìm sách");
    print("4. Xóa sách");
    print("5. Lưu vào file");
    print("0. Thoát");

    print("Chọn:");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case "1":
        library.addBook();
        break;

      case "2":
        library.displayBooks();
        break;

      case "3":
        library.searchBook();
        break;

      case "4":
        library.deleteBook();
        break;

      case "5":
        library.saveBooks();
        break;

      case "0":
        library.saveBooks();
        print("Thoát chương trình.");
        return;

      default:
        print("Lựa chọn không hợp lệ!");
    }
  }
}
//dart run baitap19.dart