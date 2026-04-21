import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class NotificationsScreen extends StatelessWidget {
  static String routeName = "/notifications";

  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: demoNotifications.length,
        itemBuilder: (context, index) {
          final notification = demoNotifications[index];
          return NotificationTile(notification: notification);
        },
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final NotificationItem notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notification.isRead ? Colors.white : const Color(0xFFFFECDF),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: notification.color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(notification.icon, color: notification.color),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  notification.message,
                  style: const TextStyle(color: Color(0xFF757575)),
                ),
                const SizedBox(height: 5),
                Text(
                  notification.time,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color color;
  final bool isRead;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.color,
    this.isRead = false,
  });
}

List<NotificationItem> demoNotifications = [
  NotificationItem(
    title: "Order Successful! 🎉",
    message: "Your order #12345 has been placed successfully. Thank you for shopping!",
    time: "2 mins ago",
    icon: Icons.check_circle_outline,
    color: Colors.green,
    isRead: false,
  ),
  NotificationItem(
    title: "Big Discount Inside! 💰",
    message: "Get 20% OFF on your next purchase. Use code: SAVE20",
    time: "1 hour ago",
    icon: Icons.local_offer_outlined,
    color: kPrimaryColor,
    isRead: false,
  ),
  NotificationItem(
    title: "Flash Sale starting soon! 🔥",
    message: "Don't miss out! The summer flash sale starts in 30 minutes.",
    time: "2 hours ago",
    icon: Icons.flash_on_outlined,
    color: Colors.orange,
    isRead: true,
  ),
  NotificationItem(
    title: "Update Available 📱",
    message: "A new version of Tokoto is available. Update now for a smoother experience.",
    time: "5 hours ago",
    icon: Icons.system_update_alt_outlined,
    color: Colors.blue,
    isRead: true,
  ),
  NotificationItem(
    title: "Support Message 💬",
    message: "Hello! How can we help you today? Check out our help center.",
    time: "1 day ago",
    icon: Icons.chat_bubble_outline,
    color: Colors.purple,
    isRead: true,
  ),
];
