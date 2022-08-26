class UpdateCartRequest {

  int? id;
  int? quantity;

  UpdateCartRequest({required this.id,this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }

}
class UpdateListCartRequest {

 List<UpdateCartRequest>? items;

 UpdateListCartRequest({required this.items});

 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = new Map<String, dynamic>();
   if (this.items != null) {
     data['items'] = this.items!.map((v) => v.toJson()).toList();
   }
   return data;
 }

}