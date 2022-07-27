
class PlaceModel{
  int? id;
  String? title;
  String? foodType;
  String? location;
  String? image;
  String? rate;

  PlaceModel( {this.id,this.title, this.image,this.foodType,this.location,this.rate});
}
List<PlaceModel> placecard=[
  PlaceModel(
      id: 1,
      title: "King Of Grill",
      image:"assets/images/Unknown.jpeg",
      foodType: "Lebanese",
      location: "Bcharry",
      rate: "2.2"
  ),
  PlaceModel(
      id: 2,
      title: "Malik TAwouk",
      image:"assets/images/malik tawouk.png",
      foodType: "Fast Food",
      location: "Jounieh",
      rate: "4.2"
  ),
  PlaceModel(
      id: 3,
      title: "Macdonald's",
      image:"assets/images/macdo.jpeg",
      foodType: "Fast Food",
      location: "Jounieh",
      rate: "5.0"
  ),
  PlaceModel(
      id: 4,
      title: "Burger King",
      image:"assets/images/burger king.webp",
      foodType: "Fast Food",
      location: "Jounieh",
      rate: "3.2"
  ),
  PlaceModel(
      id: 5,

      title: "Malik TAwouk",
      image:"assets/images/malik tawouk.png",
      foodType: "Fast Food",
      location: "Jounieh",
      rate: "4.2"
  ),
];
