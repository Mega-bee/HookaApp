class UpdateProfileRequest {

  String? ImageFile;
  String? Image;
  String? AboutMe;
  String? Birthdate;
  int? GenderId;
  int? MaterialStatus;
  num? Height;
  num? Weight;
  int? BodyType;
  int? Eyes;
  int? Hair;
  String? Hobbies;
  String? Interests;
  String? Profession;
  String? FirstName;
  String? LastName;
  String? SocialMediaLink1;
  String? SocialMediaLink2;
  String? SocialMediaLink3;



  UpdateProfileRequest({
    required this.Image,
    required this.AboutMe,
    required this.ImageFile,
    required this.Birthdate,
    required this.GenderId,
    required this.MaterialStatus,
    required this.Height,
    required this.Weight,
    required this.BodyType,
    required this.LastName,
    required this.Eyes,
    required this.FirstName,
    required this.Hair,
    required this.Hobbies,
    required this.Interests,
    required this.Profession,
    required this.SocialMediaLink1,
    required this.SocialMediaLink2,
    required this.SocialMediaLink3,

  });

  Map<String, dynamic> toJson() {
    return {
      'ImageFile': ImageFile,
      'Image': Image,
      'AboutMe': AboutMe,
      'Birthdate': Birthdate,
      'GenderId': GenderId,
      'MaterialStatus': MaterialStatus,
      'Height': Height,
      'Weight': Weight,
      'BodyType': BodyType,
      'LastName': LastName,
      'Eyes': Eyes,
      'FirstName': FirstName,
      'Hair': Hair,
      'Hobbies': Hobbies,
      'Interests': Interests,
      'Profession': Profession,
      'SocialMediaLink1': SocialMediaLink1,
      'SocialMediaLink2': SocialMediaLink2,
      'SocialMediaLink3': SocialMediaLink3,


    };
  }

}