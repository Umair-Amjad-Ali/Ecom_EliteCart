import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/constants.dart';



class PaymentScreen extends StatefulWidget {
  static String routeName = "/payment";

  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedMethod = 0; // 0: Card, 1: Google Pay, 2: Apple Pay, 3: PayPal, 4: COD
  String shippingAddress = "123 Elite Street, Modern City, 45678";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Shipping Address",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: kPrimaryColor),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          shippingAddress,
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _showEditAddressModal(context);
                        },
                        icon: const Icon(Icons.edit, size: 20),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Select Payment Method",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                buildPaymentOption(
                  title: "Credit / Debit Card",
                  icon: Icons.credit_card,
                  isSelected: selectedMethod == 0,
                  onTap: () => setState(() => selectedMethod = 0),
                ),
                buildPaymentOption(
                  title: "Google Pay",
                  icon: Icons.account_balance_wallet,
                  isSelected: selectedMethod == 1,
                  onTap: () => setState(() => selectedMethod = 1),
                ),
                buildPaymentOption(
                  title: "PayPal",
                  icon: Icons.payment,
                  isSelected: selectedMethod == 3,
                  onTap: () => setState(() => selectedMethod = 3),
                ),
                buildPaymentOption(
                  title: "Cash on Delivery",
                  icon: Icons.money,
                  isSelected: selectedMethod == 4,
                  onTap: () => setState(() => selectedMethod = 4),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Logic to show different modals for different methods
                    if (selectedMethod == 0) {
                      showCardDetailsModal(context);
                    } else if (selectedMethod == 4) {
                      // Direct success for COD
                      final orderedItems =
                          List<CartItem>.from(context.read<Cart>().items);
                      context.read<Cart>().clear();
                      Navigator.pushNamed(
                        context,
                        "/order_success",
                        arguments: orderedItems,
                      );
                    } else {
                      showDummyPaymentModal(context, selectedMethod);
                    }
                  },

                  child: const Text("Confirm Order"),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showEditAddressModal(BuildContext context) {
    TextEditingController addressController =
        TextEditingController(text: shippingAddress);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Edit Shipping Address",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: "Shipping Address",
                hintText: "Enter full address",
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (addressController.text.isNotEmpty) {
                  setState(() {
                    shippingAddress = addressController.text;
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Save Address"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void showDummyPaymentModal(BuildContext context, int method) {

    String methodName = method == 1 ? "Google Pay" : "PayPal";
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(method == 1 ? Icons.account_balance_wallet : Icons.payment,
                size: 60, color: kPrimaryColor),
            const SizedBox(height: 20),
            Text(
              "Continue with $methodName",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "You will be redirected to the secure payment portal to complete your transaction.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final orderedItems = List<CartItem>.from(context.read<Cart>().items);
                context.read<Cart>().clear();
                Navigator.pop(context); // Close bottom sheet
                Navigator.pushNamed(
                  context,
                  "/order_success",
                  arguments: orderedItems,
                );
              },
              child: const Text("Authorize Payment"),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void showCardDetailsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Add Card Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: "Card Holder Name",
                hintText: "Enter name",
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                labelText: "Card Number",
                hintText: "XXXX XXXX XXXX XXXX",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Expiry Date",
                      hintText: "MM/YY",
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "CVV",
                      hintText: "XXX",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final orderedItems = List<CartItem>.from(context.read<Cart>().items);
                context.read<Cart>().clear();
                Navigator.pop(context); // Close bottom sheet
                Navigator.pushNamed(
                  context,
                  "/order_success",
                  arguments: orderedItems,
                );
              },
              child: const Text("Pay Now"),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOption({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? kPrimaryColor : const Color(0xFFE0E0E0),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? kPrimaryColor : Colors.grey),
            const SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            const Spacer(),
            if (isSelected)
              const Icon(Icons.check_circle, color: kPrimaryColor)
            else
              const Icon(Icons.circle_outlined, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}


