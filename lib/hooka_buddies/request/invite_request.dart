class InviteRequest{
  String? date;
  String? time;
  int? optionID;
  int? toBuddyId;
  int? placeId;
  String? description;

  InviteRequest( { this.date, this.time, this.optionID, this.toBuddyId,
      this.placeId, this.description });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['Time'] = time;
    data['OptionId'] = optionID;
    data['Description'] = description;
    data['ToBuddyId'] = toBuddyId;
    data['PlaceId'] = placeId;

    return data;
  }
}