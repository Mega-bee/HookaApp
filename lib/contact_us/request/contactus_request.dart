
class ContactUsRequest {

  String? Name;
  String? Mobile;
  String? Email;
  String? Message;


  ContactUsRequest({
    required this.Mobile,required this.Email, required this.Message, required this.Name


  });

  Map<String, dynamic> toJson() {
    return {
      'Name': Name,
      'Mobile': Mobile,
      'Email': Email,
      'Message': Message,

    };
  }

}