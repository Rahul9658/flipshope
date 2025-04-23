import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes/model/message_model.dart';
class MessageProvider with ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore =FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> sendMEssage(String recivedId , String message) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final String currentUserName = _firebaseAuth.currentUser!.displayName.toString();
    final Timestamp timestamp =Timestamp.now();
    MessagesModel neMessage = MessagesModel(senderid: currentUserId,
        recivedId: recivedId,
        messages: message,
        recivedName: currentUserName,
        recivedEmail: currentUserEmail,
        timestamp: timestamp
    );
    List<String> ids = [currentUserId , recivedId];
     ids.sort();
     String chatroomId = ids.join();
     await _firebaseFirestore.collection('chat_rooms').doc(chatroomId).collection('messages').add(neMessage.tomap());
}
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String userId , String otheruserId){
    List<String> ids = [userId ,otheruserId];
    ids.sort();
    String chatroomId = ids.join();
    return _firebaseFirestore.collection('chat_rooms').doc(chatroomId).
    collection('messages').orderBy('timestamp',descending: false).
    snapshots();

  }
}