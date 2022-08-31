class BuddiesFilerRequest {
  String lon ;
  String lat;

  BuddiesFilerRequest(this.lon, this.lat);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}