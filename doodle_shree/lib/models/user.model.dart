class UserModel {
  UserModel({
    required this.email,
    required this.fullname,
    required this.username,
    required this.id,
  });
  late final String id;
  late final String username;
  late final String fullname;
  late final String email;

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    // print(json['_id']);
    id = json['id'];
    // print(json['username']);
    fullname = json['fullname'];
    email = json['email'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['id'] = id;
    _data['fullname'] = fullname;
    _data['email'] = email;
    return _data;
  }
}
