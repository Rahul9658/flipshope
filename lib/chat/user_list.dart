import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cht_screen.dart';

class UserListScreen extends StatelessWidget {
  final User currentUser;
  const UserListScreen({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chats")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chats').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final users = snapshot.data!.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final doc = users[index];
              final userData = doc.data() as Map<String, dynamic>;

              // Ensure that the name field is not null or empty
              String userName = userData['name'] ?? 'No Name';
              if (userName.isEmpty) {
                userName = 'No Name'; // Fallback if the name is empty
              }

              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    (userName.isNotEmpty) ? userName[0].toUpperCase() : '?',
                  ),
                ),
                title: Text(userName),
                subtitle: Text(userData['email'] ?? ''),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        currentUser: currentUser,
                        otherUser: userData,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
