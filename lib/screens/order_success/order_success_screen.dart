import 'package:flutter/material.dart';
import 'package:shop_app/screens/init_screen.dart';
import 'package:shop_app/models/Cart.dart';


class OrderSuccessScreen extends StatelessWidget {
  static String routeName = "/order_success";

  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CartItem> orderedItems = ModalRoute.of(context)!.settings.arguments as List<CartItem>;
    double totalAmount = orderedItems.fold(0, (sum, item) => sum + (item.product.price * item.numOfItem));

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Thank You!"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
            const SizedBox(height: 10),
            const Text(
              "Order Successful",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Order Summary",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFF5F6F9)),
              ),
              child: Column(
                children: [
                  ...List.generate(
                    orderedItems.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${orderedItems[index].numOfItem}x ${orderedItems[index].product.title}"),
                          Text("\$${(orderedItems[index].product.price * orderedItems[index].numOfItem).toStringAsFixed(2)}"),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Paid",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$${totalAmount.toStringAsFixed(2)}",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, InitScreen.routeName);
                },
                child: const Text("Continue Shopping"),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

