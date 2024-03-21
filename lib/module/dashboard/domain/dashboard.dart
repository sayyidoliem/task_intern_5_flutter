class DashBoard {
  final String uuid;
  final String title;
  final String content;
  final String image;
  final int views;
  final Created? created;
  final User? user;

  DashBoard(
      {required this.uuid,
      required this.title,
      required this.content,
      required this.image,
      required this.views,
      this.created,
      this.user});

  factory DashBoard.fromJson(Map<String, dynamic> json) {
    return DashBoard(
      uuid: json['uuid'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
      views: json['views'],
      created: json['created'] != null
          ? Created.fromJson(json['created'])
          : null,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}

class Created {
  final String date;
  final int timezoneType;
  final String timezone;

  Created(
      {required this.date, required this.timezoneType, required this.timezone});

  factory Created.fromJson(Map<String, dynamic> json) {
    return Created(
      date: json['date'],
      timezoneType: json['timezone_type'],
      timezone: json['timezone'],
    );
  }
}

class User {
  final String name;
  final String email;
  final String phoneNumber;

  User({required this.name, required this.email, required this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone_number']);
  }
}
