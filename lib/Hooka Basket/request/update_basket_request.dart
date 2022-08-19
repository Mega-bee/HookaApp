class UpdateCartRequest {

  String? id;
  String? quantity;

  UpdateCartRequest({required this.id,this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }

}