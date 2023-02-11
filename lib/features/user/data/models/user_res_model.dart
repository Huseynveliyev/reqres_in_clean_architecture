import 'package:reqres_in_clean_architecture/features/user/domain/entities/user_entity.dart';

class UserResponseModel extends UserEntity {

  UserResponseModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.avatar,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      id: json['id'] as int,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      avatar: json['avatar'] as String,
    );
  }
}
