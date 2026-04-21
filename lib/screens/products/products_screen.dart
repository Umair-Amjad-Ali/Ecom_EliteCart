import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';

import '../details/details_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static String routeName = "/products";

  @override
  Widget build(BuildContext context) {
    // Get category from arguments if available
    final String? categoryFilter =
        ModalRoute.of(context)?.settings.arguments as String?;

    // Filter products based on category
    final productsToShow = categoryFilter == null || categoryFilter == "More"
        ? demoProducts
        : demoProducts
            .where((p) => p.category == categoryFilter)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryFilter ?? "Products"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: productsToShow.isEmpty
              ? const Center(child: Text("No products found in this category."))
              : GridView.builder(
                  itemCount: productsToShow.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) => ProductCard(
                    product: productsToShow[index],
                    onPress: () => Navigator.pushNamed(
                      context,
                      DetailsScreen.routeName,
                      arguments: ProductDetailsArguments(
                          product: productsToShow[index]),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

