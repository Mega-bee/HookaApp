class BuddiesResp {
  int? id;
  String? name;
  String? about;
  bool? isAvailable;
  int? rating;
  String? image;
  String? longitude;
  String? latitude;

  BuddiesResp(
      {this.id,
        this.name,
        this.about,
        this.isAvailable,
        this.rating,
        this.image,
         this.latitude,
        this.longitude
      });

  BuddiesResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    about = json['about'];
    isAvailable = json['isAvailable'];
    rating = json['rating'];
    image = json['image'];
    latitude =json['latitude'] == '' ? '0': json['latitude'] ?? 0;
    longitude = json['longitude'] == '' ? '0' :json['longitude'] ?? 0;
  }

}

