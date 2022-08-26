class AddEducationRequest {
  String? University;
  String? Degree;
  String? StudiedFrom;
  String? StudiedTo;

  AddEducationRequest({
    required this.Degree,
    required this.StudiedFrom,
    required this.StudiedTo,
    required this.University,
  });

  Map<String, dynamic> toJson() {
    return {
      'IsDeleted': false,
      'Id': 0,
      'University': University,
      'Degree': Degree,
      'StudiedFrom': StudiedFrom,
      'StudiedTo': StudiedTo,
    };
  }

}