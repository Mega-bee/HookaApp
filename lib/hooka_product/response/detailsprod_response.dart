class DetailsProductResponse {
  int? id;
  String? category;
  String? title;
  String? description;
  String? image;
  num? customerInitialPrice;
  bool? isselected =false;
  int? quantityInCart;

  DetailsProductResponse(
      {this.id,
        required this.isselected,
        this.category,
        this.quantityInCart,
        this.title,
        this.description,
        this.image,
        this.customerInitialPrice});

  DetailsProductResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantityInCart = json['quantityInCart'];
    category = json['category'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    customerInitialPrice = json['customerInitialPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['customerInitialPrice'] = this.customerInitialPrice;
    return data;
  }
}

