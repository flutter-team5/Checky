class UserProfile {
  int? id;
  String? createdAt;
  int? userId;
  String? userName;
  String? avatar;

  UserProfile(
      {this.id, this.createdAt, this.userId, this.userName, this.avatar});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    userName = json['user_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['avatar'] = this.avatar;
    return data;
  }
}
