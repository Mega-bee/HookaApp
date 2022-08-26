class ReceivedInvitationResponse {
  int? id;
  String? buddyName;
  String? buddyImage;
  int? buddyRating;
  int? invitationStatusId;
  String? invitationStatus;
  String? description;
  bool? Done=false;

  ReceivedInvitationResponse(
      {this.id,
        this.buddyName,
        this.buddyImage,
        this.buddyRating,
        this.invitationStatusId,
        this.invitationStatus,this.Done,
        this.description});

  ReceivedInvitationResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buddyName = json['buddyName'];
    buddyImage = json['buddyImage'];
    buddyRating = json['buddyRating'];
    invitationStatusId = json['invitationStatusId'];
    invitationStatus = json['invitationStatus'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['buddyName'] = this.buddyName;
    data['buddyImage'] = this.buddyImage;
    data['buddyRating'] = this.buddyRating;
    data['invitationStatusId'] = this.invitationStatusId;
    data['invitationStatus'] = this.invitationStatus;
    data['description'] = this.description;
    return data;
  }
}

