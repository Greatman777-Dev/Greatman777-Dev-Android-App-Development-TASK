# Exercise 10 README.md

```markdown
# Exercise 10: Product List with Details

## 📋 Overview
This exercise demonstrates a console-based product listing application with navigation between a product list and product details screens.

## 📝 Problem Statement
Build a simple app with two screens:

1. **ProductListScreen**: Shows a list of product names (hardcoded). Tapping/selecting an item navigates to details.
2. **ProductDetailScreen**: Displays the selected product name and an "Add to cart" option.

## 🚀 Implementation

### Product Model
```dart
class Product {
  final String id;
  final String name;
  final double price;
  Product({required this.id, required this.name, required this.price});
}
```

### ViewModel
```dart
class ProductViewModel {
  final List<Product> _products;
  ProductViewModel(this._products);
  List<Product> getProducts() => _products;
  Product? getProductById(String id) {...}
}
```

### Main Function
```dart
void main() {
  List<Product> products = [
    Product(id: '1', name: 'Laptop', price: 999.99),
    Product(id: '2', name: 'Smartphone', price: 699.99),
    Product(id: '3', name: 'Headphones', price: 199.99),
    Product(id: '4', name: 'Tablet', price: 499.99),
    Product(id: '5', name: 'Smartwatch', price: 249.99),
  ];
  
  ProductViewModel viewModel = ProductViewModel(products);
  showProductList(viewModel);
}
```

## 🧪 Sample Data

| ID | Name | Price |
|----|------|-------|
| 1 | Laptop | $999.99 |
| 2 | Smartphone | $699.99 |
| 3 | Headphones | $199.99 |
| 4 | Tablet | $499.99 |
| 5 | Smartwatch | $249.99 |

## 🎯 How to Run

```bash
dart exercise3_complete.dart
```

## ✅ Expected Output

```
============================================================
EXERCISE 3: PRODUCT LIST WITH DETAILS
============================================================

----------------------------------------
📋 PRODUCT LIST
----------------------------------------
1. Laptop - $999.99
2. Smartphone - $699.99
3. Headphones - $199.99
4. Tablet - $499.99
5. Smartwatch - $249.99

0. Exit

Select a product to view details (1-5): 1

----------------------------------------
📦 PRODUCT DETAILS
----------------------------------------
Name: Laptop
Price: $999.99
ID: 1
----------------------------------------

Options:
1. Add to Cart
2. Back to Product List

Choose an option (1-2): 1

✅ Laptop added to cart!
🛒 Your cart: 1 item

Press Enter to continue...