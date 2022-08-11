class InvitationOptionsResponse {
  int? id;
  String? title;
  bool  selected = false;

  InvitationOptionsResponse({this.id, this.title,required this.selected});

  InvitationOptionsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

}

