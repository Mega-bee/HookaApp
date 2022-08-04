class LogRequest {
  String? email;
  String? password;

  LogRequest(this.email, this.password);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = email;
    data['Password'] = password;
    return data;
  }
}
