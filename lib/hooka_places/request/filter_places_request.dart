class FilterRequest {
  int? sortby;
  int? filterBy;
  List? cuisines;
  String? lon;
  String? lat;




  FilterRequest(this.sortby,this.filterBy,this.lon,this.lat,this.cuisines);

  Map<String, dynamic> toJson() {
    return {
      'sortby': sortby,
      'filterBy': filterBy,
      'cuisines': cuisines,
      'lon': lon,
      'lat': lat,



    };
  }

}