class LoginResponseModel {
  final String token;
  final AuthorModel author;

  LoginResponseModel({
    required this.token,
    required this.author,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'],
      author: AuthorModel.fromJson(json['author']),
    );
  }
}

class AuthorModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final bool isActive;
  final String? avatarUrl;
  final String? bio;

  AuthorModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isActive,
    this.avatarUrl,
    this.bio,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      isActive: json['isActive'],
      avatarUrl: json['avatarUrl'],
      bio: json['bio'],
    );
  }
}
