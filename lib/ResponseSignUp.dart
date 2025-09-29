class ResponseSignUp {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  ResponseSignUp({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  factory ResponseSignUp.fromJson(Map<String, dynamic> json) {
    return ResponseSignUp(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      rePassword: json['rePassword'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "rePassword": rePassword,
      "phone": phone,
    };
  }
}
