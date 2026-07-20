class Product {
  String id;
  String name;
  double price;
  Product({required this.id, required this.name, required this.price});
}


class Cart {

  List<Product> items = [];


  void addProduct(Product p) {
    items.add(p);
    print('✅ Đã thêm "${p.name}" vào giỏ hàng.');
  }

  void removeProduct(String id) {
    int initialLength = items.length;
    
    items.removeWhere((product) => product.id == id);
    
    if (items.length < initialLength) {
      print('🗑️ Đã xóa sản phẩm có ID "$id" khỏi giỏ hàng.');
    } else {
      print('⚠️ Không tìm thấy sản phẩm có ID "$id" để xóa.');
    }
  }

  double getTotal() {
    double total = 0;
    for (Product item in items) {
      total += item.price;
    }
    return total;
  }

  void displayCart() {
    print('\n--- 🛒 GIỎ HÀNG CỦA BẠN ---');
    if (items.isEmpty) {
      print('Giỏ hàng đang trống.');
    } else {
      for (int i = 0; i < items.length; i++) {
        print('${i + 1}. [${items[i].id}] ${items[i].name} - Giá: \$${items[i].price}');
      }
      print('---------------------------');
      print('💰 TỔNG CỘNG: \$${getTotal()}');
    }
    print('---------------------------\n');
  }
}

void main() {

  Cart myCart = Cart();

  Product p1 = Product(id: 'SP01', name: 'Laptop Dell XPS', price: 1500.0);
  Product p2 = Product(id: 'SP02', name: 'Chuột không dây Logitech', price: 45.5);
  Product p3 = Product(id: 'SP03', name: 'Bàn phím cơ Keychron', price: 120.0);

  myCart.addProduct(p1);
  myCart.addProduct(p2);
  myCart.addProduct(p3);
  myCart.displayCart();
  myCart.removeProduct('SP02');
  myCart.displayCart();
}