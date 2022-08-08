
class Urls {
  /*--------DOMAIN-------------------*/

  static const String DOMAIN = 'https://hookatimes.azurewebsites.net';

  /*--------BASE-------------------*/
  static const String BASE_ACCOUNTS = DOMAIN +'/webapi/api/Accounts/';
  static const String BASE_Places = DOMAIN +'/webapi/api/Places/';
  static const String BASE_Buddies = DOMAIN +'/webapi/api/Buddies/';
  static const String BASE_Offers = DOMAIN +'/webapi/api/Offers/';



//  /*--------Auth-------------------*/
   static const LOGIN = BASE_ACCOUNTS + 'SignIn';
   static const SIGNUP = BASE_ACCOUNTS + 'SignUp';
   static const GENERATE_OTP = BASE_ACCOUNTS + 'GenerateOtp';
   static const CONFIRM_OTP = BASE_ACCOUNTS + 'ConfirmOtp';
   static const FORGET_PASS = BASE_ACCOUNTS + 'ForgetPassword';
   // static const VERIFY_OTP = BSE_API_SETTINGS + 'VerifyOtp';

//  /*--------Places-------------------*/
  static const GETALLPLACES = BASE_Places + 'GetAllPlaces';
  static const Details = BASE_Places + 'GetPlace/';
  static const FAVORITE = BASE_Places + 'ToggleFavorite/';

  //  /*--------BUDDIES-------------------*/
  static const BUDDIES = BASE_Buddies +'GetAllBuddies';

  //  /*--------OFFERS-------------------*/
  static const OFFERS = BASE_Offers +'GetAllOffers';
  static const OFFERS_DETAILS = BASE_Offers +'GetOfferById/';




}
