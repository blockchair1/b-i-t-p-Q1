class Student {
  String name;
  double score;
  String major;

  Student(this.name, this.score, this.major);
}

void main() {
  // Danh sách sinh viên
  List<Student> students = [
    Student("Nguyen Van A", 8.5, "CNTT"),
    Student("Tran Thi B", 7.8, "CNTT"),
    Student("Le Van C", 9.2, "Kinh tế"),
    Student("Pham Thi D", 8.8, "CNTT"),
    Student("Hoang Van E", 9.5, "CNTT"),
    Student("Do Thi F", 7.5, "Marketing"),
  ];

  // 1. Lọc sinh viên ngành CNTT có điểm >= 8.0
  List<Student> cnttStudents = students
      .where((student) => student.major == "CNTT" && student.score >= 8.0)
      .toList();

  // 2. Sắp xếp theo điểm giảm dần
  cnttStudents.sort((a, b) => b.score.compareTo(a.score));

  // In danh sách sau khi lọc và sắp xếp
  print("Danh sách sinh viên CNTT điểm >= 8.0:");
  for (var student in cnttStudents) {
    print("${student.name} - ${student.score}");
  }

  // 3. Lấy top 3 sinh viên và in tên
  print("\nTop 3 sinh viên:");
  cnttStudents
      .take(3)
      .map((student) => student.name)
      .forEach(print);

  // 4. Tính điểm trung bình của tất cả sinh viên
  double average = students
          .map((student) => student.score)
          .reduce((a, b) => a + b) /
      students.length;

  print("\nĐiểm trung bình: ${average.toStringAsFixed(2)}");
}
//dart run baitap18.dart