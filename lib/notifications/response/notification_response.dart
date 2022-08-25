class NotificationsResponse {
  int? id;
  String? title;
  String? body;
  num? orderId;
  num? inviteId;
  String? createdDate;

  NotificationsResponse(
      {this.id,
        this.title,
        this.body,
        this.orderId,
        this.inviteId,
        this.createdDate});

  NotificationsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    orderId = json['orderId'];
    inviteId = json['inviteId'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['orderId'] = this.orderId;
    data['inviteId'] = this.inviteId;
    data['createdDate'] = this.createdDate;
    return data;
  }
}

