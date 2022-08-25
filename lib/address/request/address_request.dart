class OrderRequest {

  int? addressId;
  String? City;
  String? Title;
  String? Building;
  String? Longitude;
  String? Latitude;
  String? Appartment;
  String? Street;

  OrderRequest({this.Title,this.Street,this.Longitude,this.Latitude,this.Building,this.Appartment,this.City,this.addressId});

  Map<String, dynamic> toJson() {
    return {
      'addressId': addressId,
      'City': City,
      'Title': Title,
      'Building': Building,
      'Longitude': Longitude,
      'Latitude': Latitude,
      'Appartment': Appartment,
      'Street': Street,
    };
  }

}