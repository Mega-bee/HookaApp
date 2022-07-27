class SignUpModel {
  String? email;
  String? confirmPass;
  String? token;
  String? password;
  String? phonenumb;
  String? firstName;
  String? LastName;

  SignUpModel({ this.email, this.token,this.password,this.confirmPass,this.firstName,this.LastName,this.phonenumb});

  SignUpModel.toJson(Map<String, dynamic> json) {
    email = json['Email'];
    token = json['DeviceToken'];
    password = json['Password'];
    confirmPass = json['ConfirmPassword'];
    phonenumb = json['PhoneNumber '];
    LastName = json['LastName'];
    firstName = json['FirstName'];
  }
}