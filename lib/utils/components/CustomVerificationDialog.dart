import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/utils/style/colors.dart';

class CustomReviewDialog extends StatelessWidget {
  final Function continueBtn;
  CustomReviewDialog({required this.continueBtn});

  TextEditingController review = TextEditingController();
  double? rateCount = 1.0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.cancel,
                color: YellowColor,
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add review",
                  style: TextStyle(
//                      color: greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  minLines: 6,
                  maxLines: 12,
                  controller: review,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 5,
                        ),
                      ),
                      contentPadding: const EdgeInsetsDirectional.only(
                          top: 10, bottom: 10, start: 10)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Select rate',style: TextStyle(
//                      color: greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),),
                const SizedBox(
                  height: 10,
                ),
                RatingBar.builder(
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                     rateCount = rating;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              if(review.text.isNotEmpty){
              continueBtn( rateCount, review.text);}
              else{
                Fluttertoast.showToast(msg: "Please write a review message");
              }
            },
            child: const Text(
              "Save review",
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
                primary: YellowColor,
                padding: const EdgeInsets.fromLTRB(30, 12, 30, 12)),
          ),
        ],
      ),
    );
  }
}
