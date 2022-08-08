class OffDetailsResponse {
  String? image;
  String? offerTitle;
  String? restaurantName;
  String? location;
  String? rating;
  String? offerDescription;
  String? restaurantDescription;
  String? cuisine;
  String? openningFrom;
  String? openningTo;
  String? longitude;
  String? latitude;
  String? phonNumber;
  String? type;
  String? discount;
  String? expiryDate;

  OffDetailsResponse(
      {this.image,
        this.offerTitle,
        this.restaurantName,
        this.location,
        this.rating,
        this.offerDescription,
        this.restaurantDescription,
        this.cuisine,
        this.openningFrom,
        this.openningTo,
        this.longitude,
        this.latitude,
        this.phonNumber,
        this.type,
        this.discount,
        this.expiryDate});

  OffDetailsResponse.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    offerTitle = json['offerTitle'];
    restaurantName = json['restaurantName'];
    location = json['location'];
    rating = json['rating'];
    offerDescription = json['offerDescription'];
    restaurantDescription = json['restaurantDescription'];
    cuisine = json['cuisine'];
    openningFrom = json['openningFrom'];
    openningTo = json['openningTo'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    phonNumber = json['phonNumber'];
    type = json['type'];
    discount = json['discount'];
    expiryDate = json['expiryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['offerTitle'] = this.offerTitle;
    data['restaurantName'] = this.restaurantName;
    data['location'] = this.location;
    data['rating'] = this.rating;
    data['offerDescription'] = this.offerDescription;
    data['restaurantDescription'] = this.restaurantDescription;
    data['cuisine'] = this.cuisine;
    data['openningFrom'] = this.openningFrom;
    data['openningTo'] = this.openningTo;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['phonNumber'] = this.phonNumber;
    data['type'] = this.type;
    data['discount'] = this.discount;
    data['expiryDate'] = this.expiryDate;
    return data;
  }
}

