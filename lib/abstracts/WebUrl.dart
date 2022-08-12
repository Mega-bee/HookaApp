
class Urls {
  /*--------DOMAIN-------------------*/

  static const String DOMAIN = 'https://hookatimes.azurewebsites.net';

  /*--------BASE-------------------*/
  static const String BASE_ACCOUNTS = DOMAIN +'/webapi/api/Accounts/';
  static const String BASE_Places = DOMAIN +'/webapi/api/Places/';
  static const String BASE_Buddies = DOMAIN +'/webapi/api/Buddies/';
  static const String BASE_Offers = DOMAIN +'/webapi/api/Offers/';
  static const String BASE_Invitations = DOMAIN +'/webapi/api/Invitations/';
  static const String BASE_Product = DOMAIN +'/webapi/api/Products/';
  static const String BASE_Profile = DOMAIN +'/webapi/api/Accounts/';




//  /*--------Auth-------------------*/
   static const LOGIN = BASE_ACCOUNTS + 'SignIn';
   static const SIGNUP = BASE_ACCOUNTS + 'SignUp';
   static const GENERATE_OTP = BASE_ACCOUNTS + 'GenerateOtp';
   static const CONFIRM_OTP = BASE_ACCOUNTS + 'ConfirmOtp';
   static const FORGET_PASS = BASE_ACCOUNTS + 'ForgetPassword';



//  /*--------Places-------------------*/
  static const GETALLPLACES = BASE_Places + 'GetAllPlaces';
  static const Details = BASE_Places + 'GetPlace/';
  static const FAVORITE = BASE_Places + 'ToggleFavorite/';
  static const ADD_REVIEW = BASE_Places + 'AddReview/';

  //  /*--------BUDDIES-------------------*/
  static const BUDDIES = BASE_Buddies +'GetAllBuddies';
  static const BUDDIES_PROFILE = BASE_Buddies +'GetBuddyProfile/';
  static const INVITE_BUDDY = BASE_Buddies +'InviteBuddy';

  //  /*--------OFFERS-------------------*/
  static const OFFERS = BASE_Offers +'GetAllOffers';
  static const OFFERS_DETAILS = BASE_Offers +'GetOfferById/';

//  /*--------INVITATIONS-------------------*/
  static const RECEIVED_INVITATIONS = BASE_Invitations +'GetRecievedInvitations';
  static const SENT_INVITATIONS = BASE_Invitations +'GetSentInvitations';
  static const OTIONS_INVITATIONS = BASE_Invitations +'GetInvitationOptions';
  static const SENT_INV_DETAILS = BASE_Invitations +'GetPlaceInvtations/';
  static const INVITATION_STATUS = BASE_Invitations +'SetInvitationStatus/';


  //  /*--------PRODUCTS-------------------*/
  static const GET_ALL_PRODUCT = BASE_Product +'GetAllCategories';
  static const DETAILS_PRODUCT = BASE_Product +'GetCategoryProducts/';


  //  /*--------PROFILE-------------------*/
  static const PROFILE = BASE_Profile +'GetProfile';











}
