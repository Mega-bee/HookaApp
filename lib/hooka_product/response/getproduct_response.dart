class GetAllProductResponse {
  int? id;
  String? category;
  String? title;
  String? description;
  String? image;
  int? customerInitialPrice;

  GetAllProductResponse(
      {this.id,
        this.category,
        this.title,
        this.description,
        this.image,
        this.customerInitialPrice});

  GetAllProductResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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

