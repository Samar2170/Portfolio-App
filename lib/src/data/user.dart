class User {
  int user_id;
  String username;
  String email;
  User.fromJson(
    Map<String, dynamic> json,
  )   : user_id = json['user']['id'],
        username = json['user']['username'],
        email = json['user']['email'];
}


