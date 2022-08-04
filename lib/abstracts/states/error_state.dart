import 'package:flutter/material.dart';
import 'package:hooka/abstracts/states/state.dart';
class ErrorState extends States {
  final String errorMessage;
  final Function retry;

 ErrorState({required this.errorMessage,required this.retry});
  @override
  Widget getUI(BuildContext context) {
    final text=["$errorMessage !!",''];
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 90,
          ),
          Center(child: Image.asset("assets/images/images-removebg-preview.png",height: 300,fit: BoxFit.cover,

          )),
          const SizedBox(
            height: 10,
          ),

            Text(
              errorMessage,
              style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
          const   SizedBox(
            height: 30,
          ),
          MaterialButton(
            color: Theme.of(context).primaryColor,
              onPressed: () {
               retry();
              },
              child:const Text(
                'Retry',
                style: TextStyle(color: Colors.black,),
              ),
              // color: AppColors.greenBasic,
              elevation: 5.0,
              shape:const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))))
        ],
      ),
    );
  }
}