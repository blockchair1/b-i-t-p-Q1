 class Stack<T> {
  final List<T> _items = [];

  void push(T item) {
    _items.add(item);
  }

  T pop() {
    if (isEmpty()) {
      throw StateError('Lỗi: Không thể pop vì Stack đang rỗng!');
    }
    return _items.removeLast();
  }

  T peek() {
    if (isEmpty()) {
      throw StateError('Lỗi: Không thể peek vì Stack đang rỗng!');
    }
    return _items.last;
  }

  bool isEmpty() {
    return _items.isEmpty;
  }

  int size() {
    return _items.length;
  }
}

void main() {
  print('--- THỬ NGHIỆM STACK VỚI SỐ NGUYÊN (int) ---');
  Stack<int> numberStack = Stack<int>();
  
  numberStack.push(10);
  numberStack.push(20);
  numberStack.push(30);
  
  print('Số lượng phần tử: ${numberStack.size()}'); 
  print('Phần tử ở đỉnh (peek): ${numberStack.peek()}');
  print('Lấy ra (pop): ${numberStack.pop()}');
  print('Lấy ra (pop) tiếp: ${numberStack.pop()}');
  print('Số lượng phần tử còn lại: ${numberStack.size()}');


  print('\n--- THỬ NGHIỆM STACK VỚI CHUỖI (String) ---');
  Stack<String> stringStack = Stack<String>();
  
  stringStack.push('Flutter');
  stringStack.push('Dart');
  
  print('Phần tử ở đỉnh (peek): ${stringStack.peek()}'); 
  print('Lấy ra (pop): ${stringStack.pop()}'); 
  print('Stack có rỗng không? ${stringStack.isEmpty()}'); 
}