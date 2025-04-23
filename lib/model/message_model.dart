import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesModel {
  final String? senderid;
  final String? recivedId;
  final String? uid;
  final String messages;
  final String? recivedEmail;
  final String recivedName;
  final Timestamp timestamp;

  MessagesModel({
    required this.senderid,
    required this.recivedId,
    this.uid,
    required this.messages,
    this.recivedEmail,
    required this.recivedName,
    required this.timestamp
  });

   Map<String ,dynamic> tomap (){
      return {
        'senderid':senderid,
         'recivedId':recivedId,
         'messages':messages,
         'recivedEmail':recivedEmail,
        'recivedName':recivedName,
        'timestamp':timestamp,
         'uid':uid,
      };
}




}