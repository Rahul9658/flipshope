import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoes/chat/user_list.dart';

class ChatScreen extends StatefulWidget {
  final User currentUser;
  final Map<String , dynamic> otherUser;

  const ChatScreen({super.key, required this.currentUser, required this.otherUser});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  String getChatId() {
    final uid1 = widget.currentUser.uid;
    final uid2 = widget.otherUser['uid'];
    return uid1.hashCode <= uid2.hashCode ? "$uid1\_$uid2" : "$uid2\_$uid1";
  }
  void sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    final chatId = getChatId();
    FirebaseFirestore.instance.collection('chats').doc(chatId).collection('messages').add({
      'senderId': widget.currentUser.uid,
      'text': text,
      'time': FieldValue.serverTimestamp(),
   });
    FirebaseFirestore.instance.collection('chats').doc(chatId).set({
      'lastMessage': text,
      'lastTime': FieldValue.serverTimestamp(),
      'participants': [widget.currentUser.uid, widget.otherUser['uid']],
    }, SetOptions(merge: true));
    _controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    final chatId = getChatId();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
              Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back)),
          title: Text(widget.otherUser['name'])),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc(chatId)
                  .collection('messages')
                  .orderBy('time', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                final messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    final isMe = msg['senderId'] == widget.currentUser.uid;
                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.green[200] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(msg['text']),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: "Type a message...",
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
