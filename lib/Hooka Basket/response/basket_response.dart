class BasketResponse {
  num? totalPrice;
  List<Items>? items;

  BasketResponse({this.totalPrice, this.items});

  BasketResponse.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPrice'] = this.totalPrice;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  num? itemId;
  num? quantity;
  String? productName;
  String? productImage;
  num? productPrice;
  num? totalPrice;

  Items(
      {this.itemId,
        this.quantity,
        this.productName,
        this.productImage,
        this.productPrice,
        this.totalPrice});

  Items.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    quantity = json['quantity'];
    productName = json['productName'];
    productImage = json['productImage'];
    productPrice = json['productPrice'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['quantity'] = this.quantity;
    data['productName'] = this.productName;
    data['productImage'] = this.productImage;
    data['productPrice'] = this.productPrice;
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}

