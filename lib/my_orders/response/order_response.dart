class OrderResponse {
  List<CurrentOrders>? currentOrders;
  List<AllOrders>? allOrders;

  OrderResponse({this.currentOrders, this.allOrders});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['currentOrders'] != null) {
      currentOrders = <CurrentOrders>[];
      json['currentOrders'].forEach((v) {
        currentOrders!.add(new CurrentOrders.fromJson(v));
      });
    }
    if (json['allOrders'] != null) {
      allOrders = <AllOrders>[];
      json['allOrders'].forEach((v) {
        allOrders!.add(new AllOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentOrders != null) {
      data['currentOrders'] =
          this.currentOrders!.map((v) => v.toJson()).toList();
    }
    if (this.allOrders != null) {
      data['allOrders'] = this.allOrders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentOrders {
  int? id;
  String? date;
  String? status;
  num? total;

  CurrentOrders({this.id, this.date, this.status, this.total});

  CurrentOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    status = json['status'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['status'] = this.status;
    data['total'] = this.total;
    return data;
  }
}
class AllOrders {
  int? id;
  String? date;
  String? status;
  num? total;

  AllOrders({this.id, this.date, this.status, this.total});

  AllOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    status = json['status'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['status'] = this.status;
    data['total'] = this.total;
    return data;
  }
}

