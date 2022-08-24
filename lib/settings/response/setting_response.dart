class SettingResponse {
  int? id;
  bool? isAvailable;
  SocialMediaLinks? socialMediaLinks;

  SettingResponse({this.id, this.isAvailable, this.socialMediaLinks});

  SettingResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isAvailable = json['isAvailable'];
    socialMediaLinks = json['socialMediaLinks'] != null
        ? new SocialMediaLinks.fromJson(json['socialMediaLinks'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isAvailable'] = this.isAvailable;
    if (this.socialMediaLinks != null) {
      data['socialMediaLinks'] = this.socialMediaLinks!.toJson();
    }
    return data;
  }
}

class SocialMediaLinks {
  String? socialMediaLink1;
  String? socialMediaLink2;
  String? socialMediaLink3;

  SocialMediaLinks(
      {this.socialMediaLink1, this.socialMediaLink2, this.socialMediaLink3});

  SocialMediaLinks.fromJson(Map<String, dynamic> json) {
    socialMediaLink1 = json['socialMediaLink1'];
    socialMediaLink2 = json['socialMediaLink2'];
    socialMediaLink3 = json['socialMediaLink3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['socialMediaLink1'] = this.socialMediaLink1;
    data['socialMediaLink2'] = this.socialMediaLink2;
    data['socialMediaLink3'] = this.socialMediaLink3;
    return data;
  }
}

