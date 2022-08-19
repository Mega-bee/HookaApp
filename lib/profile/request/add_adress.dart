class AddAddressRequest {

  int? id;
  bool? IsDeleted;
  String? City;
  String? Street;
  String? Building;
  String? Longitude;
  String? Latitude;
  String? Title;
  String? Appartment;

  AddAddressRequest({
    required this.id,
    required this.City,
    required this.IsDeleted,
    required this.Appartment,
    required this.Building,
    required this.Latitude,
    required this.Longitude,
    required this.Street,
    required this.Title,

  });

  Map<String, dynamic> toJson() {
    return {
      'IsDeleted': IsDeleted,
      'Id': id,
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