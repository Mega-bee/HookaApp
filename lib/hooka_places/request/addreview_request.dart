class AddReviewReq {

  num  rating;
  String description;

  AddReviewReq({required this.description,required this.rating});

  Map<String, dynamic> toJson() {
    return {
      'Rating': rating,
      'Description': description,
    };
  }

}