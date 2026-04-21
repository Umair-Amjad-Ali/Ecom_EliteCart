import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';


class SettingsScreen extends StatelessWidget {
  static String routeName = "/settings";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const SettingToggle(title: "Dark Mode", value: false),
            const SettingToggle(title: "Email Notifications", value: true),
            const SettingToggle(title: "Order Updates", value: true),
            const SettingItem(title: "Language", value: "English"),
            const SettingItem(title: "Currency", value: "USD (\$)"),
            const SizedBox(height: 30),
            const SettingItem(title: "Privacy Policy", value: ""),
            const SettingItem(title: "Terms of Service", value: ""),
          ],
        ),
      ),
    );
  }
}

class SettingToggle extends StatelessWidget {
  final String title;
  final bool value;

  const SettingToggle({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6F9),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          title: Text(title, style: const TextStyle(color: Color(0xFF757575))),
          trailing: Switch(
              value: value, onChanged: (v) {}, activeColor: kPrimaryColor),
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final String title;
  final String value;

  const SettingItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6F9),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: () {},
          title: Text(title, style: const TextStyle(color: Color(0xFF757575))),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (value.isNotEmpty)
                Text(value, style: const TextStyle(color: Colors.grey)),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward_ios,
                  size: 14, color: Color(0xFF757575)),
            ],
          ),
        ),
      ),
    );
  }
}

