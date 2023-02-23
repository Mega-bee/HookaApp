import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../abstracts/states/state.dart';
import '../../../auth/auth_routes.dart';
import '../../../utils/images/images.dart';

class NotLoggedIn extends States {
  @override
  Widget getUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageAsset.LOGO),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'You should sign in first',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AuthRoutes.LOGIN_SCREEN,
                );
              },
              child: Text("Login"),
            ))
      ],
    );
  }
}
