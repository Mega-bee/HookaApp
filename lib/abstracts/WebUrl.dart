
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
  static const String BASE_Basket = DOMAIN +'/webapi/api/Cart/';
  static const String BASE_CONTACTUS = DOMAIN +'/webapi/api/ContactUs/';
  static const String BASE_ORDERS = DOMAIN +'/webapi/api/Orders/';
  static const String BASE_SETTING = DOMAIN +'/webapi/api/Settings/';
  static const String BASE_NOTIFICATIONS = DOMAIN +'/webapi/api/Notifications/';
  static const String BASE_CUISINES = DOMAIN +'/webapi/api/Cuisines/';




//  /*--------Auth-------------------*/
   static const LOGIN = BASE_ACCOUNTS + 'SignIn';
   static const SIGNUP = BASE_ACCOUNTS + 'SignUp';
   static const GENERATE_OTP = BASE_ACCOUNTS + 'GenerateOtp';
   static const CONFIRM_OTP = BASE_ACCOUNTS + 'ConfirmOtp';
   static const FORGET_PASS = BASE_ACCOUNTS + 'ChangePassword';
   static const AVAILABLE = BASE_ACCOUNTS + 'IsAvailableToggle';
   static const GET_ADDRESS = BASE_ACCOUNTS + 'GetAdderesses';
   static const FIRE_TOKEN = BASE_ACCOUNTS + 'RefreshFcmToken';



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

  //  /*--------CUISINES-------------------*/
  static const GET_CUISINES = BASE_CUISINES +'GetCuisines';
//  /*--------INVITATIONS-------------------*/
  static const RECEIVED_INVITATIONS = BASE_Invitations +'GetRecievedInvitations';
  static const SENT_INVITATIONS = BASE_Invitations +'GetSentInvitations';
  static const OTIONS_INVITATIONS = BASE_Invitations +'GetInvitationOptions';
  static const SENT_INV_DETAILS = BASE_Invitations +'GetPlaceInvtations/';
  static const INVITATION_STATUS = BASE_Invitations +'SetInvitationStatus/';


  //  /*--------PRODUCTS-------------------*/
  static const GET_ALL_PRODUCT = BASE_Product +'GetAllCategories';
  static const DETAILS_PRODUCT = BASE_Product +'GetCategoryProducts/';

  //  /*--------SETTING-------------------*/
  static const GET_SETTING = BASE_SETTING +'GetSettings';



  //  /*--------PROFILE-------------------*/
  static const PROFILE = BASE_Profile +'GetProfile';
  static const ADD_EDUCATION = BASE_Profile +'AddEducation';
  static const ADD_EXPERIENCE = BASE_Profile +'AddExperience';
  static const UPDATE_PROFILE = BASE_Profile +'UpdateProfile';
  static const ADD_ADDRESS = BASE_Profile +'AddAddress';
  static const DELETE_ADDRESSS = BASE_Profile +'DeleteAddress';
  static const DELETE_EDUCATION = BASE_Profile +'DeleteEducation';
  static const DELETE_EXPERIENCE = BASE_Profile +'DeleteExperience';

  //  /*--------BASKET-------------------*/
  static const BASKET = BASE_Basket +'GetCartSummary';
  static const ADD_TO_CART = BASE_Basket +'UpdateCartItemQuantity';
  static const UPDATE_CART = BASE_Basket +'UpdateCart';
  static const DELETE_ITEM_CART = BASE_Basket +'RemoveItemFromCart';


  //  /*--------CONTACTUS-------------------*/
  static const CONTACT_US = BASE_CONTACTUS +'SendContactUsMessage';

  //  /*--------NOTIFICATIONS-------------------*/
  static const GET_NOTIFICATION = BASE_NOTIFICATIONS +'GetNotifications';

  //  /*--------ORDER-------------------*/
  static const GET_ORDER = BASE_ORDERS +'GetOrders';
  static const DETAILS_ORDER = BASE_ORDERS +'GetOrder/';
  static const PLACE_ORDER = BASE_ORDERS +'PlaceOrder';











}
