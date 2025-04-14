class LoginRequest {
  String? username;
  String? password;
  String? playerId;

  LoginRequest({this.username, this.password, this.playerId});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    playerId = json['player_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['player_id'] = this.playerId;
    return data;
  }
}
