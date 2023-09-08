class UserProfile {
  int? id;
  String? userId;
  String? userName;
  String? avatar;

  UserProfile({this.id, this.userId, this.userName, this.avatar});

  UserProfile.fromJson(Map json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    avatar = json['avatar'];
  }

  Map toJson() {
    final Map data = new Map();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['avatar'] = this.avatar;
    return data;
  }
}
