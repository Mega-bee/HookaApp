class AddEducationRequest {

  int? id;
  bool? IsDeleted;
  String? University;
  String? Degree;
  String? StudiedFrom;
  String? StudiedTo;

  AddEducationRequest({
    required this.id,
    required this.Degree,
    required this.IsDeleted,
    required this.StudiedFrom,
    required this.StudiedTo,
    required this.University,
  });

  Map<String, dynamic> toJson() {
    return {
      'IsDeleted': IsDeleted,
      'Id': id,
      'University': University,
      'Degree': Degree,
      'StudiedFrom': StudiedFrom,
      'StudiedTo': StudiedTo,
    };
  }

}