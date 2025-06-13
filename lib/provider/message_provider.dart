import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes/model/message_model.dart';
import 'package:shoes/ui/chat_login_screeen.dart';
import 'package:shoes/ui/chat_messages.dart';
import 'package:shoes/ui/messages_screen.dart';
class MessageProvider with ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore =FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> sendMEssage(String recivedId , String message) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final String currentUserName = _firebaseAuth.currentUser!.displayName.toString();
    final Timestamp timestamp =Timestamp.now();
    MessagesModel neMessage = MessagesModel(
        senderid: currentUserId,
        recivedId: recivedId,
        messages: message,
        recivedName: currentUserName,
        recivedEmail: currentUserEmail,
        timestamp: timestamp
    );
    List<String> ids = [currentUserId , recivedId];
     ids.sort();
     String chatroomId = ids.join();
     await _firebaseFirestore.collection('chat_rooms').
     doc(chatroomId).collection('messages').add(neMessage.tomap());
}
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String userId , String otheruserId){
    List<String> ids = [userId ,otheruserId];
    ids.sort();
    String chatroomId = ids.join();
    return _firebaseFirestore.collection('chat_rooms').doc(chatroomId).
    collection('messages').orderBy('timestamp',descending: false).
    snapshots();

  }

  bool _visiblePassword = true;
  bool get isvisiblepassword => _visiblePassword;

  void setpassword(){
    _visiblePassword =!_visiblePassword;
    notifyListeners();
  }


  TextEditingController messagesController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ScrollController  scrollController = ScrollController();

  FocusNode focusNode = FocusNode();

  List<ChatMessages> messages = [];

  void sendMessages(){
    if(messagesController.text.isNotEmpty){
      messages.add(ChatMessages(messagesController.text, isMe:true));
      messagesController.clear();
       scrollController.animateTo(
           scrollController.position.maxScrollExtent,
           duration:const Duration(milliseconds: 300),
           curve: Curves.easeIn);
      notifyListeners();
    }
  }

  Future <void> loginFirebase(BuildContext context) async{
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    ).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MessagesScreen()));
    });

  }

  Future <void> signupFirebase(BuildContext context) async{
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    ).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ChatLoginScreeen()));
    });

  }




  @override
  void dispose(){
    messagesController.dispose();
    focusNode.dispose();
    super.dispose();
  }





}