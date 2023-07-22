class ModelDash{
    String? name , description;
    double? price;

 ModelDash(
     this.name,
     this.description,
     this.price,
     );

 ModelDash.fromMap(Map map)
 {
  name = map["name"];
  description = map["desciption"];
  price = map["price"];
 }

}