class Product {
  final String productName;
  final String type;
  final double price;
  final int quantity;

  Product({
    required this.productName,
    required this.type,
    required this.price,
    required this.quantity,
  });
}

// Dummy data produk
List<Product> products = [
  Product(productName: 'Tiket Masuk Taman Safari', type: 'VIP', price: 150000, quantity: 2),
  Product(productName: 'Tiket Wisata Pantai', type: 'Reguler', price: 50000, quantity: 1),
  Product(productName: 'Tiket Museum Nasional', type: 'Anak-anak', price: 25000, quantity: 3),
];
