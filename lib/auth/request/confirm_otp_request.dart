class ConfOtpRequest {
  String? otp;
  String? number;

  ConfOtpRequest(this.otp, this.number);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    data['phone'] = number;
    return data;
  }
}
