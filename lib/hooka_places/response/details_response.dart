class DetailsRep {
  int? id;
  String? name;
  String? image;
  int? rating;
  String? location;
  String? cuisine;
  String? openingFrom;
  String? openingTo;
  String? description;
  List<Favorites>? favorites;
  List<Albums>? albums;
  List<Menus>? menus;
  List<Reviews>? reviews;

  DetailsRep(
      {this.id,
        this.name,
        this.image,
        this.rating,
        this.location,
        this.cuisine,
        this.openingFrom,
        this.openingTo,
        this.description,
        this.favorites,
        this.albums,
        this.menus,
        this.reviews});

  DetailsRep.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    rating = json['rating'];
    location = json['location'];
    cuisine = json['cuisine'];
    openingFrom = json['openingFrom'];
    openingTo = json['openingTo'];
    description = json['description'];
    if (json['favorites'] != null) {
      favorites = <Favorites>[];
      json['favorites'].forEach((v) {
        favorites!.add(new Favorites.fromJson(v));
      });
    }
    if (json['albums'] != null) {
      albums = <Albums>[];
      json['albums'].forEach((v) {
        albums!.add(new Albums.fromJson(v));
      });
    }
    if (json['menus'] != null) {
      menus = <Menus>[];
      json['menus'].forEach((v) {
        menus!.add(new Menus.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['location'] = this.location;
    data['cuisine'] = this.cuisine;
    data['openingFrom'] = this.openingFrom;
    data['openingTo'] = this.openingTo;
    data['description'] = this.description;
    if (this.favorites != null) {
      data['favorites'] = this.favorites!.map((v) => v.toJson()).toList();
    }
    if (this.albums != null) {
      data['albums'] = this.albums!.map((v) => v.toJson()).toList();
    }
    if (this.menus != null) {
      data['menus'] = this.menus!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Favorites {
  int? id;
  String? image;
  Null? isAvailable;

  Favorites({this.id, this.image, this.isAvailable});

  Favorites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}
class Menus {
  int? id;
  String? image;

  Menus({this.id, this.image});

  Menus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
class Albums {
  int? id;
  String? image;

  Albums({this.id, this.image});

  Albums.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class Reviews {
  int? id;
  String? name;
  String? createdDate;
  int? rating;
  String? description;

  Reviews(
      {this.id, this.name, this.createdDate, this.rating, this.description});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdDate = json['createdDate'];
    rating = json['rating'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createdDate'] = this.createdDate;
    data['rating'] = this.rating;
    data['description'] = this.description;
    return data;
  }
}

