class UserModel {
  String userId='', email='', name='', pic='';

  UserModel({required this.userId, required this.email, required this.name, this.pic=''});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userUId'];
    email = map['userEmail'];
    name = map['userName'];
    pic = map['userAvatarUrl'];
  }

  toJson() {
    return {
      'userUId': userId,
      'userEmail': email,
      'userName': name,
      'userAvatarUrl': pic,
    };
  }
}