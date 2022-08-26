class AddressResponse {
  int? id;
  String? city;
  String? street;
  String? building;
  num? longitude;
  num? latitude;
  String? title;
  String? appartment;
  bool? isselected =false;

  AddressResponse(
      {this.id,
        this.city,
        this.street,
        this.building,
        this.longitude,
        this.latitude,
        this.title,this.isselected,
        this.appartment});

  AddressResponse.fromJson(Map<String, dynamic> json) {
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

