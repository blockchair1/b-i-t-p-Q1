// Khai báo enum
enum Status {
  pending,
  approved,
  rejected,
  done,
}

// Extension cho enum Status
extension StatusExtension on Status {
  // Trả về tên hiển thị bằng tiếng Việt
  String getDisplayName() {
    switch (this) {
      case Status.pending:
        return "Đang chờ";
      case Status.approved:
        return "Đã duyệt";
      case Status.rejected:
        return "Đã từ chối";
      case Status.done:
        return "Hoàn thành";
    }
  }

  // Kiểm tra đã hoàn thành hay chưa
  bool isCompleted() {
    return this == Status.done;
  }
}

void main() {
  Status status1 = Status.pending;
  Status status2 = Status.done;

  print("Trạng thái 1: ${status1.getDisplayName()}");
  print("Hoàn thành: ${status1.isCompleted()}");

  print("-------------------------");

  print("Trạng thái 2: ${status2.getDisplayName()}");
  print("Hoàn thành: ${status2.isCompleted()}");
}
