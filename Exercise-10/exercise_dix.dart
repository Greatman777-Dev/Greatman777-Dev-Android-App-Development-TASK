// exercise3_complete.dart
// Complete working solution for Exercise 3: Product List with Details
// Run with: dart exercise3_complete.dart

import 'dart:io';

// Product Model
class Product {
  final String id;
  final String name;
  final double price;
  
  Product({
    required this.id,
    required this.name,
    required this.price,
  });
  
  @override
  String toString() => '$name - \$${price.toStringAsFixed(2)}';
}

// ViewModel
class ProductViewModel {
  final List<Product> _products;
  
  ProductViewModel(this._products);
  
  List<Product> getProducts() => _products;
  
  Product? getProductById(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
  
  Product? getProductByName(String name) {
    try {
      return _products.firstWhere((p) => p.name.toLowerCase() == name.toLowerCase());
    } catch (e) {
      return null;
    }
  }
}

// Main function - REQUIRED for Dart programs
void main() {
  print('=' * 60);
  print('EXERCISE 3: PRODUCT LIST WITH DETAILS');
  print('=' * 60);
  
  // Create product list
  List<Product> products = [
    Product(id: '1', name: 'Laptop', price: 999.99),
    Product(id: '2', name: 'Smartphone', price: 699.99),
    Product(id: '3', name: 'Headphones', price: 199.99),
    Product(id: '4', name: 'Tablet', price: 499.99),
    Product(id: '5', name: 'Smartwatch', price: 249.99),
  ];
  
  // Create ViewModel
  ProductViewModel viewModel = ProductViewModel(products);
  
  // Start the app
  showProductList(viewModel);
}

// Product List Screen
void showProductList(ProductViewModel viewModel) {
  while (true) {
    print('\n' + '-' * 40);
    print('📋 PRODUCT LIST');
    print('-' * 40);
    
    var products = viewModel.getProducts();
    for (int i = 0; i < products.length; i++) {
      print('${i + 1}. ${products[i]}');
    }
    
    print('\n0. Exit');
    stdout.write('\nSelect a product to view details (1-${products.length}): ');
    
    String? input = stdin.readLineSync();
    if (input == null || input == '0') {
      print('\n👋 Goodbye!');
      break;
    }
    
    int? choice = int.tryParse(input);
    if (choice != null && choice >= 1 && choice <= products.length) {
      String productId = products[choice - 1].id;
      showProductDetail(viewModel, productId);
    } else {
      print('❌ Invalid choice. Please try again.');
    }
  }
}

// Product Detail Screen - FIXED VERSION
void showProductDetail(ProductViewModel viewModel, String productId) {
  Product? product = viewModel.getProductById(productId);
  
  if (product == null) {
    print('❌ Product not found');
    return;
  }
  
  print('\n' + '-' * 40);
  print('📦 PRODUCT DETAILS');
  print('-' * 40);
  print('Name: ${product.name}');
  print('Price: \$${product.price.toStringAsFixed(2)}');
  print('ID: ${product.id}');
  print('-' * 40);
  
  print('\nOptions:');
  print('1. Add to Cart');
  print('2. Back to Product List');
  
  stdout.write('\nChoose an option (1-2): ');
  String? input = stdin.readLineSync();
  
  if (input == '1') {
    // FIXED: Use product.name instead of undefined variable
    print('\n✅ ${product.name} added to cart!');
    print('🛒 Your cart: 1 item');
  }
  
  // Return to product list automatically
  print('\nPress Enter to continue...');
  stdin.readLineSync();
}