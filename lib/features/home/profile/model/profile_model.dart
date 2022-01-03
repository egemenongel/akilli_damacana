import 'dart:convert';

ProfileInfoModel profileModelFromJson(String str) =>
    ProfileInfoModel.fromJson(json.decode(str));

String profileModelToJson(ProfileInfoModel data) => json.encode(data.toJson());

class ProfileInfoModel {
  ProfileInfoModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  UserData? data;

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) =>
      ProfileInfoModel(
        status: json["status"],
        message: json["message"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class UserData {
  UserData({
    this.user,
    this.token,
  });

  UserProfile? user;
  String? token;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        user: UserProfile.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "token": token,
      };
}

class UserProfile {
  UserProfile({
    this.id,
    this.name,
    this.surname,
    this.phoneNumber,
    this.email,
    this.username,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.profilePicture,
    this.height,
    this.weight,
    this.age,
  });

  String? id;
  dynamic name;
  dynamic surname;
  dynamic phoneNumber;
  String? email;
  String? username;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? profilePicture;
  int? height;
  int? weight;
  int? age;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        username: json["username"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        profilePicture: json["profile_picture"],
        height: json["height"],
        weight: json["weight"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "phone_number": phoneNumber,
        "email": email,
        "username": username,
        "email_verified_at": emailVerifiedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "profile_picture": profilePicture,
        "height": height,
        "weight": weight,
        "age": age,
      };
}
