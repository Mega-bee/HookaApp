
class DeleteEducationRequest {

  int? EducationId;


  DeleteEducationRequest({
    required this.EducationId,


  });

  Map<String, dynamic> toJson() {
    return {
      'EducationId': EducationId,

    };
  }

}