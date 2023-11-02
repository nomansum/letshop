// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String password;
  final String address;
  final String type;
  final String token;
  final String email;
  final String name;
  User({
    required this.id,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
    required this.email,
    required this.name,
  });

  User copyWith({
    String? id,
    String? password,
    String? address,
    String? type,
    String? token,
    String? email,
    String? name,
  }) {
    return User(
      id: id ?? this.id,
      password: password ?? this.password,
      address: address ?? this.address,
      type: type ?? this.type,
      token: token ?? this.token,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
      'email': email,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      type: map['type'] as String,
      token: map['token'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, password: $password, address: $address, type: $type, token: $token, email: $email, name: $name)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.password == password &&
        other.address == address &&
        other.type == type &&
        other.token == token &&
        other.email == email &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        password.hashCode ^
        address.hashCode ^
        type.hashCode ^
        token.hashCode ^
        email.hashCode ^
        name.hashCode;
  }
}
