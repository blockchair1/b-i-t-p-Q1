int findSecondLargest(List<int> numbers) {
  if (numbers.length < 2) {
    throw Exception('Mảng phải có ít nhất 2 phần tử');
  }

  int? max;
  int? secondMax;

  for (int number in numbers) {
    if (max == null || number > max) {
      secondMax = max; 
      max = number; 
    } 

    else if (number < max && (secondMax == null || number > secondMax)) {
      secondMax = number; 
    }
  }

  if (secondMax == null) {
    throw Exception('Không tìm thấy số lớn thứ hai (có thể các phần tử đều bằng nhau)');
  }

  return secondMax;
}

void main() {
  List<int> testList = [3, 1, 9, 3, 8, 2];
  
  try {
    int result = findSecondLargest(testList);
    print('Mảng: $testList');
    print('Số lớn thứ hai là: $result');
  } catch (e) {
    print(e);
  }
}