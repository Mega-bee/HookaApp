import 'package:flutter/material.dart';
import 'package:hooka/profile/ui/widget/custom_container.dart';
import 'package:hooka/utils/style/colors.dart';

import '../../response/profile_response.dart';

class ExperienceCard extends StatelessWidget {
  final Experience mod;
  final Function? removeItem;
  bool isUpdate;

  ExperienceCard(this.mod, this.isUpdate ,{this.removeItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
        ),
        child: Column(
          children: [
            Container(
              color: YellowColor,
              width: 500,
              height: 80,
              child: Icon(
                Icons.work,
                size: 80,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ContainerRow('Place : ', mod.place ?? ''),
            SizedBox(
              height: 15,
            ),
            ContainerRow('Position : ', mod.position ?? ''),
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
                            mod.workedFrom ?? '',
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
                            mod.workedTo ?? '',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
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
