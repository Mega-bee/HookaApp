class WebParam {
  static String EMAIL = "Email";
  static String PASSWORD = "Password";
  static String CONFIRMPASS = "ConfirmPassword";
  static String LASTNAME = "LastName";
  static String FIRSTNAME = "FirstName";
  static String MOBILE = "PhoneNumber";
  static String MOBILEOTP = "phone";
  static String OTP = "otp";
  static Map <String, dynamic> LoginParams(
      String email, String pass) {
    var map = new Map<String, String>();
    map[EMAIL] = email;
    map[PASSWORD] = pass;
    print(map);
    return map;
  }
  static Map <String, dynamic> SignUpParams(
      String email, String pass,String name,String lastName,String mobile ,String confpass) {
    var map = new Map<String, String>();
    map[EMAIL] = email;
    map[PASSWORD] = pass;
    map[CONFIRMPASS] = confpass;
    map[LASTNAME] = lastName;
    map[FIRSTNAME] = name;
    map[MOBILE] = mobile;
    print(map);
    return map;
  }
  static Map <String, dynamic> GenerateOTp(
      String phone) {
    var map = new Map<String, String>();
    map[MOBILE] = phone;
    print(map);
    return map;
  }
  static Map <String, dynamic> VerifyOTp(
      String phone, String otp) {
    var map = new Map<String, String>();
    map[MOBILEOTP] = phone;
    map[OTP] = otp;
    print(map);
    return map;
  }
  static Map<String, dynamic> ResetPassParams(
      String email) {
    var map = new Map<String, String>();
    map[EMAIL] = email;
    print(map);
    return map;
  }
}
class WebServiceResponse {
  int _code;
  String _errorMessage;
  Data _data;
  WebServiceResponse(this._code, this._errorMessage, this._data);
  factory WebServiceResponse.fromJson(Map<String, dynamic> item) {
    return WebServiceResponse(
      item['statusCode'],
      item['errorMessage'],
      Data.fromJson(item['data'])  ,
    );
  }
  get data => _data;
  String get errorMessage => _errorMessage;
  int get code => _code;
}
class Data {
  dynamic data;
  Data(
      { this.data,
      });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: json["data"],
  );
}