import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;
  final String category;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    this.category = "General",
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: ["assets/images/ps4_console_white_1.png"],
    colors: [const Color(0xFFF6625E), Colors.white],
    title: "Wireless Controller",
    price: 64.99,
    description: description,
    rating: 4.8,
    isPopular: true,
    category: "Game",
  ),
  Product(
    id: 2,
    images: ["assets/images/Image Popular Product 2.png"],
    colors: [const Color(0xFFF6625E), Colors.white],
    title: "Nike Sport Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    category: "Flash Deal",
    isPopular: true,
  ),
  Product(
    id: 3,
    images: ["assets/images/glap.png"],
    colors: [const Color(0xFFF6625E), Colors.white],
    title: "XC Omega Gloves",
    price: 36.55,
    description: description,
    isFavourite: true,
    category: "Flash Deal",
  ),
  Product(
    id: 4,
    images: ["assets/images/wireless headset.png"],
    colors: [const Color(0xFFF6625E), Colors.white],
    title: "Logitech Headset",
    price: 20.20,
    description: description,
    rating: 4.1,
    category: "Flash Deal",
  ),
  Product(
    id: 5,
    images: ["assets/images/ps4_console_white_1.png"],
    colors: [Colors.black],
    title: "Sony PS4 Pro 1TB",
    price: 399.99,
    description: "Experience incredible games with 4K resolution.",
    category: "Game",
    isPopular: true,
  ),
  Product(
    id: 6,
    images: ["assets/images/wireless headset.png"],
    colors: [Colors.blue],
    title: "Gaming Headset RGB",
    price: 75.0,
    description: "Surround sound and RGB lighting for pro gamers.",
    category: "Game",
  ),
  Product(
    id: 7,
    images: ["assets/images/Image Popular Product 2.png"],
    colors: [Colors.grey],
    title: "Cotton Jogger Pants",
    price: 45.0,
    description: "Comfortable and stylish jogger pants for men.",
    category: "Daily Gift",
  ),
  Product(
    id: 8,
    images: ["assets/images/glap.png"],
    colors: [Colors.brown],
    title: "Leather Hand Gloves",
    price: 29.99,
    description: "Genuine leather gloves for winter and driving.",
    category: "Daily Gift",
  ),
  Product(
    id: 9,
    images: ["assets/images/wireless headset.png"],
    colors: [Colors.white],
    title: "Smart Air-Pods Pro",
    price: 249.0,
    description: "The ultimate wireless listening experience.",
    category: "Flash Deal",
    isPopular: true,
  ),
  Product(
    id: 10,
    images: ["assets/images/ps4_console_white_1.png"],
    colors: [Colors.red],
    title: "Customized DualShock 4",
    price: 79.99,
    description: "Stand out with this unique red controller.",
    category: "Game",
  ),
  Product(
    id: 11,
    images: ["assets/images/Image Popular Product 2.png"],
    colors: [Colors.green],
    title: "Hiking Cargo Pants",
    price: 55.0,
    description: "Durable pants for your outdoor adventures.",
    category: "Bill",
  ),
  Product(
    id: 12,
    images: ["assets/images/glap.png"],
    colors: [Colors.black],
    title: "Biker Protection Gloves",
    price: 40.5,
    description: "Reinforced gloves for maximum safety.",
    category: "Bill",
  ),
  Product(
    id: 13,
    images: ["assets/images/wireless headset.png"],
    colors: [Colors.black],
    title: "Studio Monitor Headphones",
    price: 150.0,
    description: "Professional grade sound for music production.",
    category: "Discover",
  ),
  Product(
    id: 14,
    images: ["assets/images/ps4_console_white_1.png"],
    colors: [Colors.white],
    title: "PS4 Vertical Stand",
    price: 19.99,
    description: "Space-saving stand for your gaming setup.",
    category: "Discover",
  ),
  Product(
    id: 15,
    images: ["assets/images/Image Popular Product 2.png"],
    colors: [Colors.blue],
    title: "Denim Jeans Slim Fit",
    price: 35.0,
    description: "A classic look that never goes out of style.",
    category: "Flash Deal",
  ),
];




const String description =
    "Premium quality product designed for durability and maximum comfort. This item features high-grade materials and professional craftsmanship.";

