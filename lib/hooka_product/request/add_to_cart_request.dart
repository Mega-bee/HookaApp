class AddToCartRequest {

  int? itemId;
  int? quantity;


  AddToCartRequest({required this.itemId,required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'quantity': quantity,

    };
  }

}