import 'package:flutter/material.dart';
import 'package:hooka/Hooka%20Basket/model/basket.dart';

class BasketCard extends StatefulWidget {
  final BasketModel basketm;
  final Function total;

  BasketCard(this.basketm,this.total);


  @override
  State<BasketCard> createState() => _BasketCardState();
}

class _BasketCardState extends State<BasketCard> {
  @override
  Widget build(BuildContext context) {
    var icp=(widget.basketm.increment * widget.basketm.incprice);
    return Container(
      width: 200,
      height: 100,
      child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              widget.basketm.image.toString(),
              width: 50,
            ),
            Container(
              width: 40,
              height: 40,
              child: InkWell(
                onTap: () {
                  if (widget.basketm.increment > 0){
                    widget.basketm.increment --;
                  widget.basketm.bcp =widget.basketm.increment * widget.basketm.incprice;


                  setState(() {

                  });
                  widget.total();
                }
                  else{
                    widget.basketm.increment  = 0;}


                },
                child: Card(
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
              ),
            ),
            Text(
              "${widget.basketm.increment }",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              width: 40,
              height: 40,
              child: InkWell(
                onTap: () {

                    widget.basketm.increment ++;

                    widget.basketm.bcp =widget.basketm.increment * widget.basketm.incprice;
                    setState(() {
                    });
                   widget.total();

                },
                child: Card(
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Center(child: Text("+"))),
              ),
            ),
            Text("USD $icp",
                style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
