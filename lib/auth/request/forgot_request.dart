class ForgotRequest {
  String? OldPassword;
  String? NewPassword;
  String? ConfirmPassword;
  String? email;


  ForgotRequest(this.email, this.ConfirmPassword,this.NewPassword,this.OldPassword);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['OldPassword'] = OldPassword;
    data['NewPassword'] = NewPassword;
    data['ConfirmPassword'] = ConfirmPassword;

    return data;
  }
}
