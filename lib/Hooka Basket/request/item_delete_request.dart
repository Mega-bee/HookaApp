class DeleteItemCarttRequest {

  String? productId;


  DeleteItemCarttRequest({required this.productId,});

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,

    };
  }

}