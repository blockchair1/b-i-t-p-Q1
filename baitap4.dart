import 'dart:io';

void main() {
  List<String> todoList = [];
  bool isRunning = true;

  while (isRunning) {
    print('\n--- MENU QUẢN LÝ TODO LIST ---');
    print('1. Thêm công việc mới');
    print('2. Xóa công việc theo tên');
    print('3. Hiển thị tất cả công việc');
    print('4. Thoát chương trình');
    stdout.write('Chọn chức năng (1-4): ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Nhập tên công việc muốn thêm: ');
        String? newTask = stdin.readLineSync();
        if (newTask != null && newTask.trim().isNotEmpty) {
          todoList.add(newTask.trim());
          print('✅ Đã thêm "${newTask.trim()}" vào danh sách.');
        } else {
          print('❌ Tên công việc không được để trống.');
        }
        break;

      case '2':
        stdout.write('Nhập tên công việc muốn xóa: ');
        String? taskToRemove = stdin.readLineSync();
        if (taskToRemove != null && taskToRemove.trim().isNotEmpty) {
          if (todoList.remove(taskToRemove.trim())) {
            print('✅ Đã xóa "${taskToRemove.trim()}" khỏi danh sách.');
          } else {
            print('❌ Không tìm thấy công việc "${taskToRemove.trim()}" trong danh sách.');
          }
        } else {
          print('❌ Tên công việc không hợp lệ.');
        }
        break;

      case '3':
        if (todoList.isEmpty) {
          print('📋 Danh sách công việc đang trống.');
        } else {
          print('\n--- DANH SÁCH CÔNG VIỆC ---');
          for (int i = 0; i < todoList.length; i++) {
            print('${i + 1}. ${todoList[i]}');
          }
        }
        break;

      case '4':
        print('👋 Đã thoát chương trình. Tạm biệt!');
        isRunning = false; // Gán bằng false để kết thúc vòng lặp while
        break;

      default:
        print('⚠️ Lựa chọn không hợp lệ. Vui lòng nhập số từ 1 đến 4.');
    }
  }
}

