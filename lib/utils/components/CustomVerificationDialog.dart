import 'package:flutter/material.dart';
import 'package:hooka/utils/style/colors.dart';

class CustomReviewDialog extends StatelessWidget {
  final Function continueBtn;
  CustomReviewDialog({required this.continueBtn});

  TextEditingController review = TextEditingController();
  TextEditingController rate = TextEditingController();

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
                color:YellowColor,
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
                const Text(
                  "Rating  / 5",
                  style: TextStyle(
//                      color: greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: 2,
                  controller: rate,
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
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              continueBtn(int.parse(rate.text),review.text);

            },
            child: const Text("Save review",style: TextStyle(color: Colors.black),),
            style: ElevatedButton.styleFrom(
                primary: YellowColor,
                padding: const EdgeInsets.fromLTRB(30, 12, 30, 12)),
          ),
        ],
      ),
    );
  }
}
