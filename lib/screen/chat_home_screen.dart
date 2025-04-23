import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';
class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        toolbarHeight: 70,
        title: Text("HomeScreen"),
      ),
      body: _buildListofItem(),
    );
  }
  Widget _buildListofItem() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("data").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No data found'));
        }

        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildItem(doc))
              .toList(),
        );
      },
    );
  }


  Widget _buildItem(DocumentSnapshot document){
    Map<String , dynamic> data = document.data()! as Map<String ,dynamic>;

    if(_auth.currentUser!.displayName!= data['name']){
      return ListTile(
        title: Text(data['name']),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(recivedName: data['name'],
           recivedUserId: data['uid'],
          )));
        },
      );

    }
    else{
      return Container();
    }
  }

}
