import 'package:e_commerce_flutter/ApiManager.dart';
import 'package:e_commerce_flutter/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/SignUp.dart';
import 'Colors.dart';
import 'HomeScreen.dart';
import 'ResponseSignUp.dart';

class Signup extends StatelessWidget {
  static const String id = 'signup_screen';
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController rePasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late ResponseSignUp user = ResponseSignUp(name: nameController.text, email: emailController.text,
      password: passwordController.text,  phone: phoneController.text,rePassword: rePasswordController.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(
                  child: Image.asset(
                    "assets/photos/Route .png",
                    height: 120,
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  "FullName",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),

                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Enter Full Name",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "fullName is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                const Text(
                  "E-mail",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),

                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter E-mail",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!value.contains("@")) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                const Text(
                  "Password",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),

                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),
                const Text(
                  "Confirm Password",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),

                TextFormField(
                  controller: rePasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Re-enter Password",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password";
                    }
                    if (value != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),
                const SizedBox(height: 24),

                const Text(
                  "Mobile Number",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),

                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "Enter Mobile Number",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.phone_android),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "mobile number is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),


                SizedBox(
                  width: double.infinity,
                  child:ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final user = ResponseSignUp(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          rePassword: rePasswordController.text,
                          phone: phoneController.text,
                        );

                        String? errorMessage = await ApiService.signUp(user);

                        if (errorMessage == null) {
                          Navigator.pushNamed(context, Signin.id);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(errorMessage),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )

                ),

                const SizedBox(height: 24),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
