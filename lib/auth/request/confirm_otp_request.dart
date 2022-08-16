class ConfOtpRequest {
  String? otp;
  String? number;
  String? password;

  ConfOtpRequest(this.otp, this.number,this.password);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    data['phone'] = number;

    return data;
  }
}
