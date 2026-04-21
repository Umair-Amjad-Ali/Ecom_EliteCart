import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = "/chat";
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [
    {
      "message": "Hello! How can I help you today?",
      "isMe": false,
      "time": "10:00 AM",
    },
    {
      "message": "Hi, I have a question about my recent order.",
      "isMe": true,
      "time": "10:05 AM",
    },
    {
      "message": "Sure, please provide your order ID.",
      "isMe": false,
      "time": "10:06 AM",
    },
    {
      "message": "#ORD-99281",
      "isMe": true,
      "time": "10:07 AM",
    },
    {
      "message":
          "Found it. Your order is currently being processed and will be shipped within 24 hours.",
      "isMe": false,
      "time": "10:08 AM",
    },
    {
      "message": "Great, thank you!",
      "isMe": true,
      "time": "10:10 AM",
    },
  ];

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          "message": _messageController.text,
          "isMe": true,
          "time": "Just now",
        });
        _messageController.clear();
      });
      _scrollToBottom();
      
      // Optional: Dummy auto-reply after 1 second
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _messages.add({
              "message": "Thanks for your message! Our team will get back to you soon.",
              "isMe": false,
              "time": "Just now",
            });
          });
          _scrollToBottom();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Support"),
        centerTitle: true,
        leading: Navigator.of(context).canPop()
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.black, size: 20),
              )
            : null,
      ),


      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return buildChatBubble(
                  message: _messages[index]["message"],
                  isMe: _messages[index]["isMe"],
                  time: _messages[index]["time"],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: _messageController,
                        onSubmitted: (v) => _sendMessage(),
                        decoration: const InputDecoration(
                          hintText: "Type message...",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChatBubble(
      {required String message, required bool isMe, required String time}) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 5),
          constraints: const BoxConstraints(
            maxWidth: 250,
          ),
          decoration: BoxDecoration(
            color: isMe ? kPrimaryColor : const Color(0xFFF5F6F9),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft: isMe ? const Radius.circular(20) : Radius.zero,
              bottomRight: isMe ? Radius.zero : const Radius.circular(20),
            ),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black,
            ),
          ),
        ),
        Text(
          time,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}


