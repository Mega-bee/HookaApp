class SentInvitationResponse {
  int? placeId;
  String? placeName;
  String? image;
  int? rating;
  int? buddiesCount;

  SentInvitationResponse(
      {this.placeId,
        this.placeName,
        this.image,
        this.rating,
        this.buddiesCount});

  SentInvitationResponse.fromJson(Map<String, dynamic> json) {
    placeId = json['placeId'];
    placeName = json['placeName'];
    image = json['image'];
    rating = json['rating'];
    buddiesCount = json['buddiesCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placeId'] = this.placeId;
    data['placeName'] = this.placeName;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['buddiesCount'] = this.buddiesCount;
    return data;
  }
}

