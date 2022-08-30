class PlacesResp {
  int? id;
  String? image;
  String? location;
  String? cuisine;
  num? rating;
  String? name;
  String? longitude;
  String? latitude;

  PlacesResp(
      {this.id,
        this.image,
        this.location,
        this.cuisine,
        this.rating,
        this.latitude,
        this.longitude,
        this.name});

  PlacesResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    location = json['location'];
    cuisine = json['cuisine'];
    rating = json['rating'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }


}

