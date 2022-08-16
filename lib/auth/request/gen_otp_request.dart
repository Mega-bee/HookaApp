class GenOtpRequest {
  String? email;
  String? pass;


  GenOtpRequest(this.email, this.pass);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;

    return data;
  }
}
