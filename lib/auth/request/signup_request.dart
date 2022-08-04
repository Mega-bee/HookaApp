class SignRequest {
  String? email;
  String? phonenumber;
  String? password;
  String? confirmpassword;
  String? firstname;
  String? LastName;

  SignRequest(
      this.email,
      this.password,
      this.phonenumber,
      this.firstname,
      this.confirmpassword,
      this.LastName


      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = email;
    data['Password'] = password;
    data['PhoneNumber'] = phonenumber;
    data['ConfirmPassword'] = confirmpassword;
    data['FirstName'] = firstname;
    data['LastName'] = LastName;
    return data;
  }
}