import 'package:e_commerce_flutter/verifyCodeScreen.dart';
import 'package:flutter/material.dart';
import 'ApiManager.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  static const String id = 'forget_password';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Forgot Password",
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: loading
                    ? null
                    : () async {
                  setState(() => loading = true);
                  final result = await ApiService.forgetPassword(
                    emailController.text.trim(),
                  );
                  setState(() => loading = false);

                  if (result == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Reset code sent!")),
                    );
                    Navigator.pushNamed(context, VerifyCodeScreen.id);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result)),
                    );
                  }
                },
                child: loading
                    ? const CircularProgressIndicator(color: Colors.black)
                    : const Text("Send Code"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
