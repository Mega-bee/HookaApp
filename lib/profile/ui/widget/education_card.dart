import 'package:flutter/material.dart';
import 'package:hooka/auth/ui/widget/custem_button.dart';
import 'package:hooka/profile/response/profile_response.dart';
import 'package:hooka/profile/ui/widget/custom_container.dart';
import 'package:hooka/utils/style/colors.dart';

class EducationCard extends StatelessWidget {
  final Education mod;
  final int genderId;
  final bool isUpdate;
  final Function? removeItem;

  EducationCard(this.mod, this.genderId , this.isUpdate ,{ this.removeItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
        ),
        child: Column(
          children: [
            Container(
              color: YellowColor,
              width: 500,
              height: 80,
              child: genderId == 1
                  ? Image.asset(
                      "assets/images/istockphoto-910022842-170667a-removebg-preview.png",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    )
                  : Image.asset(
                      "assets/images/fuser-Graduate-512.webp",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            ContainerRow('University : ', mod.university ?? ''),
            SizedBox(
              height: 15,
            ),
            ContainerRow('Degree : ', mod.degree ?? ''),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "From: ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            mod.studiedFrom ?? '',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'To: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            mod.studiedTo ?? '',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            isUpdate ?
               ElevatedButton.icon(onPressed: (){
                 removeItem!();
               }, icon: Icon(Icons.delete), label: Text('Remove item')) :Container(),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
