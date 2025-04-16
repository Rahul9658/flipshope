import 'package:flutter/material.dart';
import 'package:shoes/chat/signup.dart';
import 'package:shoes/chat/user_list.dart';
import 'auth_provider_screen.dart';


class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});
  @override
  State<LoginScreen1> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen1> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  void login() async {
    final user = await AuthService.loginWithEmail(emailCtrl.text.trim(), passCtrl.text);
    if (user != null && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => UserListScreen(currentUser: user)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passCtrl, obscureText: true, decoration: const InputDecoration(labelText: "Password")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: const Text("Login")),
            TextButton(
              child: const Text("Don't have an account? Sign up"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpScreen())),
            )
          ],
        ),
      ),
    );
  }
}
