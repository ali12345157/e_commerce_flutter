import 'dart:convert';
import 'package:http/http.dart' as http;

import 'ResponseSignUp.dart';

class ApiService {
  static const String baseUrl = "https://ecommerce.routemisr.com/api/v1";


  static Future<String?> signUp(ResponseSignUp user) async {
    final url = Uri.parse("$baseUrl/auth/signup");

    try {
      final body = jsonEncode(user.toJson());
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return null;
      } else {
        final responseData = jsonDecode(response.body);
        if (responseData["errors"] != null) {
          return responseData["errors"]["msg"];
        }
        return responseData["message"] ?? "Unknown error";
      }
    } catch (e) {
      return "Exception in signUp: $e";
    }
  }

  static Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse("$baseUrl/auth/signin");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return null;
      } else {
        final responseData = jsonDecode(response.body);
        if (responseData["errors"] != null) {
          return responseData["errors"]["msg"];
        }
        return responseData["message"] ?? "Login failed, please try again";
      }
    } catch (e) {
      return "Exception in signIn: $e";
    }
  }


  static Future<String?> forgetPassword(String email) async {
    final url = Uri.parse("$baseUrl/auth/forgotPasswords");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );

      if (response.statusCode == 200) {
        return null;
      } else {
        final responseData = jsonDecode(response.body);
        return responseData["message"] ?? "Error while sending reset code";
      }
    } catch (e) {
      return "Exception in forgetPassword: $e";
    }
  }

  static Future<String?> verifyResetCode(String code) async {
    final url = Uri.parse("$baseUrl/auth/verifyResetCode");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"resetCode": code}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data["status"] == "Success") {
        return null; // Success
      }

      return data["message"] ?? "Invalid or expired code";
    } catch (e) {
      return "Exception in verifyResetCode: $e";
    }
  }


  static Future<String?> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    final url = Uri.parse("$baseUrl/auth/resetPassword");
    try {
      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "newPassword": newPassword}),
      );

      if (response.statusCode == 200) {
        return null;
      } else {
        final responseData = jsonDecode(response.body);
        return responseData["message"] ?? "Reset password failed";
      }
    } catch (e) {
      return "Exception in resetPassword: $e";
    }
  }
}
