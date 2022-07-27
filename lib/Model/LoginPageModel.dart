class logInModel {
  String? email;
  String? token;
  String? password;

  logInModel({ this.email, this.token,this.password});

  logInModel.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    token = json['DeviceToken'];
    password = json['Password'];
  }

}