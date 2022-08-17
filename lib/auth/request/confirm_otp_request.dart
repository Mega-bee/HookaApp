class ConfOtpRequest {
  String? otp;
  String? email;
  String? password;

  ConfOtpRequest(this.otp, this.email,this.password);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    data['email'] = email;

    return data;
  }
}
