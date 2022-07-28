class Urls {
  /*--------BASES-------------------*/
  static const String DOMAIN = 'https://hookatimes.azurewebsites.net/webapi/';
  static const String BASE_API = DOMAIN + 'api/';

  static const String BASE_API_ACCOUNT = DOMAIN + 'api/Accounts';

  /*--------Auth-------------------*/
  static const LOGIN = BASE_API_ACCOUNT + '/SignIn';
  static const SIGNUP = BASE_API_ACCOUNT + '/SignUp';
  static const FORGET_PASS = BASE_API_ACCOUNT + '/ForgetPassword';
  static const GENERATE_OTP = BASE_API_ACCOUNT + '/GenerateOtp';
  static const VERIFY_OTP = BASE_API_ACCOUNT + '/ConfirmOtp';
/*--------home-------------------*/
/*--------DEVICE-------------------*/
}
// Container(
// margin: const EdgeInsets.symmetric(
// vertical: 16.0, horizontal: 60),
// child: ButtonTheme(
// height: 20,
// child: TextButton(
// onPressed: () {
// formKey.currentState!.validate();
// // conditions for validating
// if (currentText.length != 4 ||
// currentText != "1234") {
// errorController!
//     .add(ErrorAnimationType.shake); // Trigg
//
// // ering error shake animation
// setState(() => hasError = true);
// } else {
// setState(
// () {
// hasError = false;
//
// snackBar(
// "OTP Verified!!",
// );
// Navigator.pushReplacement(
// context,
// MaterialPageRoute(
// builder: (context) =>
// const DrawerScreen()),
// );
// },
// );
// }
// },
// child: Center(
// child: Text(
// "VERIFY".toUpperCase(),
// style: const TextStyle(
// color: Colors.white,
// fontSize: 14,
// fontWeight: FontWeight.bold),
// )),
// ),
// ),
// decoration: BoxDecoration(
// color: YellowColor,
// borderRadius: BorderRadius.circular(5),
// boxShadow: [
// BoxShadow(
// color: YellowColor,
// offset: const Offset(1, -1),
// blurRadius: 1),
// BoxShadow(
// color: YellowColor,
// offset: const Offset(-1, 2),
// blurRadius: 1)
// ]),
// ),