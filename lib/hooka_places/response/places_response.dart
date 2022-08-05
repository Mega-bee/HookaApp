class PlacesResp {
  int? id;
  String? image;
  String? location;
  String? cuisine;
  int? rating;
  String? name;

  PlacesResp(
      {this.id,
        this.image,
        this.location,
        this.cuisine,
        this.rating,
        this.name});

  PlacesResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    location = json['location'];
    cuisine = json['cuisine'];
    rating = json['rating'];
    name = json['name'];
  }


}

