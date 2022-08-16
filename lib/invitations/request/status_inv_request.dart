class StatusInvRequest {

  String? statusId;

  StatusInvRequest({required this.statusId});

  Map<String, dynamic> toJson() {
    return {
      'statusId': statusId,
    };
  }

}