import 'dart:io';
import 'pizza_prices.dart';

void main() {
  print("===== PIZZA ORDER CALCULATOR =====");
  print("Small  = \$5");
  print("Medium = \$7");
  print("Large  = \$10");

  bool ordering = true;

  while (ordering) {
    print("\nEnter pizza size (Small/Medium/Large): ");
    String size = stdin.readLineSync()!.toLowerCase();

    double price;

    switch (size) {
      case "small":
        price = PizzaPrices.small;
        break;

      case "medium":
        price = PizzaPrices.medium;
        break;

      case "large":
        price = PizzaPrices.large;
        break;

      default:
        print("Invalid pizza size. Please try again.");
        continue;
    }

    print("Enter quantity: ");
    int quantity = int.parse(stdin.readLineSync()!);

    while (quantity <= 0) {
      print("Quantity must be greater than 0. Enter again:");
      quantity = int.parse(stdin.readLineSync()!);
    }

    double total = price * quantity;

    print("\nPizza size: $size");
    print("Quantity: $quantity");
    print("Total payment: \$${total.toStringAsFixed(2)}");

    print("\nDo you want to order another pizza? (y/n): ");
    String answer = stdin.readLineSync()!.toLowerCase();

    if (answer != "y") {
      ordering = false;
    }
  }

  print("\nThank you for your order!");
}