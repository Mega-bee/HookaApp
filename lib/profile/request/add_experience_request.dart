class AddExperienceRequest {

  int? id;
  bool? IsDeleted;
  String? Place;
  String? Position;
  String? WorkedFrom;
  String? WorkedTo;

  AddExperienceRequest({
    required this.id,
    required this.Place,
    required this.IsDeleted,
    required this.WorkedFrom,
    required this.WorkedTo,
    required this.Position,
  });

  Map<String, dynamic> toJson() {
    return {
      'IsDeleted': IsDeleted,
      'Id': id,
      'Place': Place,
      'Position': Position,
      'WorkedFrom': WorkedFrom,
      'WorkedTo': WorkedTo,
    };
  }

}