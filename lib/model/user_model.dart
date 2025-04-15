class LoginModel {
  bool? status;
  String? message;
  String? authToken;
  UserData? userData;

  LoginModel({
    this.status,
    this.message,
    this.authToken,
    this.userData,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    authToken = json['authToken'];
    userData = json['data'] != null && json['data']['userData'] != null
        ? UserData.fromJson(json['data']['userData'])
        : null;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    data['authToken'] = authToken;
    if (userData != null) {
      data['data'] = {'userData': userData!.toJson()};
    }
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  bool? isVerified;
  bool? isProfileComplete;

  UserData({
    this.id,
    this.name,
    this.email,
    this.isVerified,
    this.isProfileComplete,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    isVerified = json['isVerified'];
    isProfileComplete = json['isProfileComplete'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'isVerified': isVerified,
      'isProfileComplete': isProfileComplete,
    };
  }
}
