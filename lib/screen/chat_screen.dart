import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/appcolor.dart'; // Your custom colors (optional)

class ChatScreen extends StatefulWidget {
  final String otherUserId;

  const ChatScreen({super.key, required this.otherUserId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final User currentUser = FirebaseAuth.instance.currentUser!;
  String? otherUsername;
  String? chatId;

  @override
  void initState() {
    super.initState();
    generateChatId();
    fetchOtherUserData();
  }

  void generateChatId() {
    // Unique chat ID based on UID combination
    chatId = currentUser.uid.hashCode <= widget.otherUserId.hashCode
        ? '${currentUser.uid}_${widget.otherUserId}'
        : '${widget.otherUserId}_${currentUser.uid}';
  }

  Future<void> fetchOtherUserData() async {
    final doc = await FirebaseFirestore.instance
        .collection('shoppes')
        .doc(widget.otherUserId)
        .get();

    if (doc.exists) {
      setState(() {
        otherUsername = doc['username'];
      });
    }
  }

  void sendMessage() async {
    final text = messageController.text.trim();
    if (text.isEmpty || chatId == null) return;

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add({
      'senderId': currentUser.uid,
      'message': text,
      'createdAt': Timestamp.now(),
    });
    messageController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          otherUsername ?? "Chat",
          style: GoogleFonts.roboto(
              fontSize: 18, fontWeight: FontWeight.w600, color: AppColor.white),
        ),
        backgroundColor: const Color(0xFF2D63DF),
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
          Expanded(
            child: chatId == null
                ? Center(child: CircularProgressIndicator())
                : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc(chatId)
                  .collection('messages')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    final isMe =
                        msg['senderId'] == currentUser.uid;

                    return Align(
                      alignment: isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isMe
                              ? Colors.blueAccent
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          msg['message'],
                          style: TextStyle(
                            color: isMe ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration:
                    InputDecoration(hintText: 'Type your message...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: sendMessage,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
