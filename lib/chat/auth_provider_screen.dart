import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<User?> signUpWithEmail(String email, String password, String name) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = result.user;

    // ✅ Save user data to 'users' collection
    await firestore.collection('chats').doc(user!.uid).set({
      'uid': user.uid,
      'email': email,
      'name': name,
      'photoUrl': '',
    });


    return user;
  }

  static Future<User?> loginWithEmail(String email, String password) async {
    UserCredential result = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }
}
