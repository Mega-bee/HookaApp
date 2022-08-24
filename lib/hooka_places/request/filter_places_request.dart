class FilterRequest {
  int? sortby;

  FilterRequest(this.sortby);

  Map<String, dynamic> toJson() {
    return {
      'sortby': sortby,
    };
  }

}