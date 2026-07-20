void main() {

  List<int> list1 = [1, 2, 3, 4, 5];
  List<int> list2 = [3, 4, 5, 6, 7];

  Set<int> set1 = list1.toSet();
  Set<int> set2 = list2.toSet();
  
  List<int> unionList = set1.union(set2).toList();
  List<int> intersectionList = set1.intersection(set2).toList();

  print('Danh sách 1 ban đầu: $list1');
  print('Danh sách 2 ban đầu: $list2');
  print('--------------------------------------------------');
  print('Danh sách HỢP (Không trùng lặp): $unionList');
  print('Danh sách GIAO (Các phần tử chung): $intersectionList');
}