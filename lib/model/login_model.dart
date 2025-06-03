class LoginModelApi {
  String? name;
  String? email;
  String? role;
  List<String>? modules;
  int? code;
  String? message;
  String? accessToken;

  LoginModelApi(
      {this.name,
        this.email,
        this.role,
        this.modules,
        this.code,
        this.message,
        this.accessToken
      });

  LoginModelApi.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
    modules = json['modules'].cast<String>();
    code = json['code'];
    message = json['message'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['modules'] = this.modules;
    data['code'] = this.code;
    data['message'] = this.message;
    data['accessToken'] = this.accessToken;
    return data;
  }
}