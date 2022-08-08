class ForgRequest {
  String? number;

  ForgRequest(this.number);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;

    return data;
  }
}