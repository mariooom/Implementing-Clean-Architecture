// lib/domain/entities/user.dart
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String image; // Add avatar field

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image, // Add avatar to constructor
  });

  // Update the factory constructor to parse the avatar
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      image: json['image'], // Parse the 'image' field as the avatar URL
    );
  }

  @override
  List<Object?> get props => [id, firstName, lastName, email, image];
}