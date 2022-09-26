class OffersResponse {
  int? id;
  String? title;
  String? image;
  num? rating;
  String? restaurantTitle;

  OffersResponse(
      {this.id, this.title, this.image, this.rating, this.restaurantTitle});

  OffersResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    rating = json['rating'];
    restaurantTitle = json['restaurantTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['restaurantTitle'] = this.restaurantTitle;
    return data;
  }
}

