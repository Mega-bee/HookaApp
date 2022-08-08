class BuddiesResp {
  int? id;
  String? name;
  String? about;
  bool? isAvailable;
  int? rating;
  String? image;

  BuddiesResp(
      {this.id,
        this.name,
        this.about,
        this.isAvailable,
        this.rating,
        this.image});

  BuddiesResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    about = json['about'];
    isAvailable = json['isAvailable'];
    rating = json['rating'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['about'] = this.about;
    data['isAvailable'] = this.isAvailable;
    data['rating'] = this.rating;
    data['image'] = this.image;
    return data;
  }
}

