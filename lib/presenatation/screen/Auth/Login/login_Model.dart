class LoginModel {
  String? message;
  String? accessToken;
  String? tokenType;

  LoginModel({this.message, this.accessToken, this.tokenType});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['access_token'] ?? " ";
    tokenType = json['token_type'] ?? " ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    return data;
  }
}
