class DetailsResponse {
  List<Items>? items;
  Address? address;
  int? id;
  String? date;
  String? status;
  num? total;

  DetailsResponse(
      {this.items, this.address, this.id, this.date, this.status, this.total});

  DetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    address = json['address'] != null ? new Address.fromJson(json['address']) : null;
    id = json['id'];
    date = json['date'];
    status = json['status'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['id'] = this.id;
    data['date'] = this.date;
    data['status'] = this.status;
    data['total'] = this.total;
    return data;
  }
}

class Items {
  int? itemId;
  num? categoryId;
  num? quantity;
  String? categoryName;
  String? productName;
  String? productImage;
  num? productPrice;
  num? totalPrice;

  Items(
      {this.itemId,
        this.categoryId,
        this.quantity,
        this.categoryName,
        this.productName,
        this.productImage,
        this.productPrice,
        this.totalPrice});

  Items.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    categoryId = json['categoryId'];
    quantity = json['quantity'];
    categoryName = json['categoryName'];
    productName = json['productName'];
    productImage = json['productImage'];
    productPrice = json['productPrice'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['categoryId'] = this.categoryId;
    data['quantity'] = this.quantity;
    data['categoryName'] = this.categoryName;
    data['productName'] = this.productName;
    data['productImage'] = this.productImage;
    data['productPrice'] = this.productPrice;
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}

class Address {
  int? id;
  String? city;
  String? street;
  String? building;
  String? longitude;
  String? latitude;
  String? title;
  String? appartment;

  Address(
      {this.id,
        this.city,
        this.street,
        this.building,
        this.longitude,
        this.latitude,
        this.title,
        this.appartment});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    street = json['street'];
    building = json['building'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    title = json['title'];
    appartment = json['appartment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city'] = this.city;
    data['street'] = this.street;
    data['building'] = this.building;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['title'] = this.title;
    data['appartment'] = this.appartment;
    return data;
  }
}

