class GenOtpRequest {
  String? number;


  GenOtpRequest(this.number, );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = number;

    return data;
  }
}
