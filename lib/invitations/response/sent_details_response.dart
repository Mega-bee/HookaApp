class DetailsSentResponse {
  int? placeId;
  String? placeName;
  String? placeLocation;
  String? placeImage;
  int? placeRating;
  List<Buddies>? buddies;

  DetailsSentResponse(
      {this.placeId,
        this.placeName,
        this.placeLocation,
        this.placeRating,
        this.placeImage,
        this.buddies});

  DetailsSentResponse.fromJson(Map<String, dynamic> json) {
    placeId = json['placeId'];
    placeName = json['placeName'];
    placeLocation = json['placeLocation'];
    placeImage = json['placeImage'];
    placeRating = json['placeRating'];
    if (json['buddies'] != null) {
      buddies = <Buddies>[];
      json['buddies'].forEach((v) {
        buddies!.add(new Buddies.fromJson(v));
      });
    }
  }


}

class Buddies {
  int? id;
  String? buddyName;
  String? buddyImage;
  int? buddyRating;
  int? invitationStatusId;
  String? invitationStatus;
  String? description;

  Buddies(
      {this.id,
        this.buddyName,
        this.buddyImage,
        this.buddyRating,
        this.invitationStatusId,
        this.invitationStatus,
        this.description});

  Buddies.fromJson(Map<String, dynamic> json) {
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

