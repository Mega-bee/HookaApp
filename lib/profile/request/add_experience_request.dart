class AddExperienceRequest {



  String? Place;
  String? Position;
  String? WorkedFrom;
  String? WorkedTo;

  AddExperienceRequest({

    required this.Place,

    required this.WorkedFrom,
    required this.WorkedTo,
    required this.Position,
  });

  Map<String, dynamic> toJson() {
    return {
      'IsDeleted': false,
      'Id': 0,
      'Place': Place,
      'Position': Position,
      'WorkedFrom': WorkedFrom,
      'WorkedTo': WorkedTo,
    };
  }

}