import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes/provider/message_provider.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    final messagesProvider = context.watch<MessageProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                controller: messagesProvider.scrollController,
                itemCount: messagesProvider.messages.length,
                itemBuilder: (context, index) {
              final message = messagesProvider.messages[index];
              return Align(
                alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                  decoration: BoxDecoration(
                    color: message.isMe ? Colors.indigo[100] : Colors.grey[200],
                    borderRadius: BorderRadius.only(
                        bottomLeft: message.isMe ? const Radius.circular(10.0) : const Radius.circular(0.0),
                        bottomRight: message.isMe ? const Radius.circular(0.0) : const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0),
                        topLeft: const Radius.circular(10.0)),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7, // Limit message bubble width
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      message.text,
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: message.isMe ? Colors.black87 : Colors.black87),
                    ),
                  ),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: messagesProvider.focusNode,
                    controller: messagesProvider.messagesController,
                    decoration: InputDecoration(
                        hintText: "Type your messages.....",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0)
                    ),
                    onSubmitted:(value) => messagesProvider.sendMessages(),

                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.indigo,
                  child: IconButton(onPressed:
                    messagesProvider.sendMessages,
                 icon: const Icon(Icons.send,color: Colors.white,)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
