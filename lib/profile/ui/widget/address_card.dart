import 'package:flutter/material.dart';
import 'package:hooka/profile/response/profile_response.dart';
import 'package:hooka/profile/ui/widget/custom_container.dart';
import 'package:hooka/utils/style/colors.dart';

class AddressCard extends StatelessWidget {
  final Addresses mod;
  final Function? removeItem;
 final bool isUpdate ;

  AddressCard(this.mod,this.isUpdate ,{ this.removeItem });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.black, width: 1),
        ),
        child: Column(
          children: [
            Container(
              color: YellowColor,
              width: 500,
              height: 80,
              child: Icon(
                Icons.location_city,
                size: 80,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ContainerRow('Title : ', mod.title ?? ''),
            SizedBox(
              height: 15,
            ),
            ContainerRow('City : ', mod.city ?? ''),
            SizedBox(
              height: 15,
            ),
            ContainerRow('Building : ', mod.building ?? ''),
            SizedBox(
              height: 15,
            ),
            isUpdate ?
            ElevatedButton.icon(onPressed: (){
              removeItem!();
            }, icon: Icon(Icons.delete), label: Text('Remove item')) :Container(),
            SizedBox(
              height: 10
            )
          ],
        ),
      ),
    );
  }
}
