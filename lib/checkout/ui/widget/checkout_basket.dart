import 'package:flutter/material.dart';

import '../../../Hooka Basket/response/basket_response.dart';

class CheckoutBasketCard extends StatefulWidget {
  final Items items;
  CheckoutBasketCard(this.items);
  @override
  State<CheckoutBasketCard> createState() => _CheckoutBasketCardState();
}

class _CheckoutBasketCardState extends State<CheckoutBasketCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.items.productName} x ${widget.items.quantity}",style: TextStyle(fontWeight: FontWeight.bold),),
              Center(child: Text("${widget.items.totalPrice} \$",style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ],
    );
  }
}
