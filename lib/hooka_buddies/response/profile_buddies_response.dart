class BuddiesProfResponse {
  String? name;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? imageUrl;
  String? email;
  String? gender;
  num? genderId;
  String? birthDate;
  String? aboutMe;
  String? maritalStatus;
  num? height;
  num? weight;
  String? bodyType;
  String? eyes;
  String? hair;
  String? profession;
  String? interests;
  String? hobbies;
  String? socialMediaLink1;
  String? socialMediaLink2;
  String? socialMediaLink3;
  List<Addresses>? addresses;
  List<Education>? education;
  List<Experience>? experience;

  BuddiesProfResponse(
      {this.name,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.imageUrl,
        this.email,
        this.gender,
        this.genderId,
        this.birthDate,
        this.aboutMe,
        this.maritalStatus,
        this.height,
        this.weight,
        this.bodyType,
        this.eyes,
        this.hair,
        this.profession,
        this.interests,
        this.hobbies,
        this.socialMediaLink1,
        this.socialMediaLink2,
        this.socialMediaLink3,
        this.addresses,
        this.education,
        this.experience});

  BuddiesProfResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    email = json['email'];
    gender = json['gender'];
    genderId = json['genderId'];
    birthDate = json['birthDate'];
    aboutMe = json['aboutMe'];
    maritalStatus = json['maritalStatus'];
    height = json['height'] ?? 0;
    weight = json['weight'] ?? 0;
    bodyType = json['bodyType'];
    eyes = json['eyes'];
    hair = json['hair'];
    profession = json['profession'];
    interests = json['interests'];
    hobbies = json['hobbies'];
    socialMediaLink1 = json['socialMediaLink1'];
    socialMediaLink2 = json['socialMediaLink2'];
    socialMediaLink3 = json['socialMediaLink3'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
    if (json['education'] != null) {
      education = <Education>[];
      json['education'].forEach((v) {
        education!.add(new Education.fromJson(v));
      });
    }
    if (json['experience'] != null) {
      experience = <Experience>[];
      json['experience'].forEach((v) {
        experience!.add(new Experience.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['imageUrl'] = this.imageUrl;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['genderId'] = this.genderId;
    data['birthDate'] = this.birthDate;
    data['aboutMe'] = this.aboutMe;
    data['maritalStatus'] = this.maritalStatus;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['bodyType'] = this.bodyType;
    data['eyes'] = this.eyes;
    data['hair'] = this.hair;
    data['profession'] = this.profession;
    data['interests'] = this.interests;
    data['hobbies'] = this.hobbies;
    data['socialMediaLink1'] = this.socialMediaLink1;
    data['socialMediaLink2'] = this.socialMediaLink2;
    data['socialMediaLink3'] = this.socialMediaLink3;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    if (this.education != null) {
      data['education'] = this.education!.map((v) => v.toJson()).toList();
    }
    if (this.experience != null) {
      data['experience'] = this.experience!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  String? longitude;
  String? latitude;
  String? title;

  Addresses({this.longitude, this.latitude, this.title});

  Addresses.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['title'] = this.title;
    return data;
  }
}

class Education {
  String? university;
  String? degree;
  String? studiedFrom;
  String? studiedTo;

  Education({this.university, this.degree, this.studiedFrom, this.studiedTo});

  Education.fromJson(Map<String, dynamic> json) {
    university = json['university'];
    degree = json['degree'];
    studiedFrom = json['studiedFrom'];
    studiedTo = json['studiedTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['university'] = this.university;
    data['degree'] = this.degree;
    data['studiedFrom'] = this.studiedFrom;
    data['studiedTo'] = this.studiedTo;
    return data;
  }
}

class Experience {
  String? place;
  String? position;
  String? workedFrom;
  String? workedTo;

  Experience({this.place, this.position, this.workedFrom, this.workedTo});

  Experience.fromJson(Map<String, dynamic> json) {
    place = json['place'];
    position = json['position'];
    workedFrom = json['workedFrom'];
    workedTo = json['workedTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place'] = this.place;
    data['position'] = this.position;
    data['workedFrom'] = this.workedFrom;
    data['workedTo'] = this.workedTo;
    return data;
  }
}

