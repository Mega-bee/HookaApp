
class BasketModel{
  int id;
  num increment ;
  num incprice ;
  String? image;
  num bcp;

  BasketModel({
    required this.id,
    required this.increment,
    required this.incprice,
    this.image,
    required this.bcp,
   });

}
