class ReceivedInvitationResponse {
  int? id;
  String? buddyName;
  String? buddyImage;
  int? buddyRating;
  int? invitationStatusId;
  String? invitationStatus;
  String? invitationDate;
  String? description;
  String? restaurantName;
  String? invitationOption;
  bool? Done=false;

  ReceivedInvitationResponse(
      {this.id,
        this.buddyName,
        this.buddyImage,
        this.buddyRating,
        this.restaurantName,
        this.invitationDate,
        this.invitationOption,
        this.invitationStatusId,
        this.invitationStatus,this.Done,
        this.description});

  ReceivedInvitationResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buddyName = json['buddyName'];
    restaurantName = json['restaurantName'];
    invitationDate = json['invitationDate'];
    invitationOption = json['invitationOption'];
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

