class ForgotRequest {

  String? NewPassword;

  String? email;


  ForgotRequest(this.email,this.NewPassword,);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;

    data['NewPassword'] = NewPassword;


    return data;
  }
}
