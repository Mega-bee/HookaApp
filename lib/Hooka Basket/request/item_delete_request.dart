class DeleteItemCarttRequest {

  int? productId;


  DeleteItemCarttRequest({required this.productId,});

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,

    };
  }

}