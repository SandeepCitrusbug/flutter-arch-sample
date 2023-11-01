class ResLogin {
  String? token;
  String? role;
  String? id;

  ResLogin({
    required this.token,
    required this.role,
    required this.id,
  });

  factory ResLogin.fromJson(Map<String, dynamic> json) {
    return ResLogin(
      id: json['id'],
      token: json['token'],
      role: json['role'],
    );
  }
}
