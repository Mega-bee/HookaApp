class FireRequest {

  String?  token;

  FireRequest({required this.token});

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }

}