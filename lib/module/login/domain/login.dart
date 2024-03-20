import 'package:task_intern_5_flutter/import.dart';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  int code;
  bool status;
  String message;
  User user;

  Login({
    required this.code,
    required this.status,
    required this.message,
    required this.user,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "user": user.toJson(),
      };
}

class User {
  String name;
  String email;
  String phoneNumber;
  Created created;
  String uuid;

  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.created,
    required this.uuid,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        created: Created.fromJson(json["created"]),
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "created": created.toJson(),
        "uuid": uuid,
      };
}

class Created {
  DateTime date;
  int timezoneType;
  String timezone;

  Created({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}
