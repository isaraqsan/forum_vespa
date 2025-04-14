class LoginResponse {
  String? accessToken;
  String? tokenType;
  String? fotoId;
  String? expiresAt;

  LoginResponse({
    this.accessToken,
    this.tokenType,
    this.fotoId,
    this.expiresAt,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    fotoId = json['foto_id'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['foto_id'] = this.fotoId;
    data['expires_at'] = this.expiresAt;
    return data;
  }
}
