class AddAddressRequest {
  String? City;
  String? Street;
  String? Building;
  String?  Longitude;
  String ? Latitude;
  String? Title;
  String? Appartment;

  AddAddressRequest({
    required this.City,
    this.Appartment,
    required this.Building,
   this.Latitude,
  this.Longitude,
    required this.Street,
    required this.Title,
  });

  Map<String, dynamic> toJson() {
    return {
      'IsDeleted': false,
      'Id': 0,
      'City': City,
      'Appartment': Appartment,
      'Building': Building,
      'Latitude': Latitude,
      'Longitude': Longitude,
      'Street': Street,
      'Title': Title,
    };
  }
}
