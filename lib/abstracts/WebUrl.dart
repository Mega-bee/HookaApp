
class Urls {
  /*--------DOMAIN-------------------*/

  static const String DOMAIN = 'https://hookatimes.azurewebsites.net';

  /*--------BASE-------------------*/
  static const String BASE_ACCOUNTS = DOMAIN + '/webapi/api/Accounts/';


//  /*--------Auth-------------------*/
   static const LOGIN = BASE_ACCOUNTS + 'SignIn';
   static const SIGNUP = BASE_ACCOUNTS + 'SignUp';
   static const GENERATE_OTP = BASE_ACCOUNTS + 'GenerateOtp';
   static const CONFIRM_OTP = BASE_ACCOUNTS + 'ConfirmOtp';
   static const FORGET_PASS = BASE_ACCOUNTS + 'ForgetPassword';
   // static const VERIFY_OTP = BSE_API_SETTINGS + 'VerifyOtp';



}
