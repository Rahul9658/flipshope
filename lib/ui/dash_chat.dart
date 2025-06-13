import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert'; // For JsonDecoder

// A simple model for a chat message, extended for Firebase.
class ChatMessage {
  final String text;
  final bool isMe; // True if the message was sent by the current user
  final String senderId; // The ID of the user who sent the message
  final int timestamp; // Timestamp for ordering messages

  ChatMessage(this.text, {required this.senderId, this.isMe = false, required this.timestamp});

  // Factory constructor to create a ChatMessage from a Firebase DataSnapshot.
  factory ChatMessage.fromSnapshot(DataSnapshot snapshot, String currentUserId) {
    final Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
    return ChatMessage(
      data['text'] as String,
      senderId: data['senderId'] as String,
      isMe: data['senderId'] == currentUserId,
      timestamp: data['timestamp'] as int,
    );
  }

  // Convert ChatMessage to a JSON map for storing in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'senderId': senderId,
      'timestamp': timestamp,
    };
  }
}

class DashChat extends StatefulWidget {
  const DashChat({super.key});

  @override
  State<DashChat> createState() => _DashChatState();
}

class _DashChatState extends State<DashChat> {
  // Controllers for text input and scrolling.
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  // Firebase instances.
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late DatabaseReference _messagesRef; // Reference to the 'messages' path in DB.

  // List to hold chat messages.
  List<ChatMessage> _messages = [];
  String? _currentUserId; // To store the current authenticated user's ID.
  bool _isLoading = true; // To show loading state during auth/initial data fetch.
  late StreamSubscription<DatabaseEvent> _messagesSubscription;


  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  // Initializes Firebase components and sets up listeners.
  void _initializeFirebase() async {
    // Listen for authentication state changes to get the current user ID.
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          _currentUserId = user.uid;
          print('Current User ID: $_currentUserId'); // Print user ID for debugging
          _isLoading = false;
        });
        _setupMessagesListener(); // Set up database listener once user is authenticated.
      } else {
        setState(() {
          _currentUserId = null;
          _isLoading = false;
        });
        print('No user is signed in.');
      }
    });

    // In case authStateChanges doesn't fire immediately and a user is already signed in (e.g., on hot restart)
    if (_auth.currentUser != null) {
      setState(() {
        _currentUserId = _auth.currentUser!.uid;
        print('Current User ID (initial check): $_currentUserId');
        _isLoading = false;
      });
      _setupMessagesListener();
    } else {
      // If no user is authenticated, force an anonymous sign-in
      // This is primarily for the Canvas environment where __initial_auth_token
      // might not always be present or the user might be unauthenticated.
      if (_currentUserId == null) {
        try {
          await _auth.signInAnonymously();
          print("Attempted anonymous sign-in in DashChat initState.");
        } catch (e) {
          print("Error during anonymous sign-in in DashChat: $e");
        }
      }
    }

    // Set up the database reference (adjust path as needed, e.g., 'chats/general')
    _messagesRef = _database.ref().child('artifacts/com.example.shoes/public/data/messages');
  }

  // Sets up the listener for new messages from the Realtime Database.
  void _setupMessagesListener() {
    _messagesSubscription = _messagesRef
        .orderByChild('timestamp') // Order messages by timestamp
        .onChildAdded
        .listen((event) {
      if (event.snapshot.value != null && _currentUserId != null) {
        final message = ChatMessage.fromSnapshot(event.snapshot, _currentUserId!);
        setState(() {
          _messages.add(message);
          // Sort messages by timestamp to ensure correct order
          _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
        });
        // Scroll to the bottom if the user is near the bottom
        _scrollToBottom();
      }
    }, onError: (error) {
      print("Failed to load messages: $error");
    });
  }

  // Sends a new message to the Firebase Realtime Database.
  void _sendMessage() {
    if (_messageController.text.isNotEmpty && _currentUserId != null) {
      // Create a new message object with current user ID and timestamp.
      final newMessage = ChatMessage(
        _messageController.text,
        senderId: _currentUserId!,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      );

      // Push the message to the database.
      _messagesRef.push().set(newMessage.toJson()).then((_) {
        _messageController.clear(); // Clear input field on success.
        _focusNode.unfocus(); // Unfocus the text field.
        _scrollToBottom(); // Scroll to bottom after sending.
      }).catchError((error) {
        print("Failed to send message: $error");
        // Optionally, show an error message to the user.
      });
    }
  }

  // Scrolls the chat list to the very bottom.
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    _messagesSubscription.cancel(); // Cancel the database subscription
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'DashChat ${_currentUserId != null ? '(${_currentUserId!.substring(0, 8)}...)' : ''}', // Show truncated user ID
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: message.isMe ? Colors.indigo[100] : Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0),
                        bottomLeft: message.isMe ? const Radius.circular(10.0) : const Radius.circular(0.0),
                        bottomRight: message.isMe ? const Radius.circular(0.0) : const Radius.circular(10.0),
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.text,
                          style: const TextStyle(color: Colors.black87),
                        ),
                        if (!message.isMe && message.senderId.isNotEmpty) // Show sender ID for others
                          Text(
                            'Sender: ${message.senderId.substring(0, 8)}...',
                            style: const TextStyle(fontSize: 10, color: Colors.black54),
                          ),
                        Text(
                          // Format timestamp for better readability
                          '${DateTime.fromMillisecondsSinceEpoch(message.timestamp).hour}:${DateTime.fromMillisecondsSinceEpoch(message.timestamp).minute.toString().padLeft(2, '0')}',
                          style: const TextStyle(fontSize: 10, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 8.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 8.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    ),
                    onSubmitted: (value) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.indigo,
                  child: IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
