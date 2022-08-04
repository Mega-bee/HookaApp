class SignRequest {
  String? email;
  String? phonenumber;
  String? password;

  String? firstname;
  String? LastName;

  SignRequest(
      this.email,
      this.password,
      this.phonenumber,
      this.firstname,
      this.LastName


      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = email;
    data['Password'] = password;
    data['PhoneNumber'] = phonenumber;
    data['FirstName'] = firstname;
    data['LastName'] = LastName;
    return data;
  }
}