import 'dart:convert';

user userFromJson(String str) => user.fromJson(json.decode(str));

String userToJson(user data) => json.encode(data.toJson());

class userModel {
  userModel({
    required this.data,
  });

  final List<user> data;

  factory userModel.fromJson(Map<String, dynamic> json) => userModel(
        data: List<user>.from(json["data"].map((x) => user.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class user {
  final String userID;
  final String firstName;
  final String lastName;
  final String email;
  final String usertype;
  final String ProfileImage;

  user({
    required this.userID,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.usertype,
    required this.ProfileImage,
  });

  factory user.fromJson(Map<String, dynamic> json) => user(
        userID: json['uid'],
        firstName: json['First name'],
        lastName: json['Last name'],
        email: json['Email'],
        usertype: json['User type'],
        ProfileImage: json['Profile image'],
      );

  Map<String, dynamic> toJson() => {
        "uid": userID,
        "FirstName": firstName,
        "LastName": lastName,
        "userEmail": email,
        "usertype": usertype,
      };
}
