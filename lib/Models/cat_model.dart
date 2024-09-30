class CatModel {
  String name;
  String color;
  String image;
  CatModel({
    required this.name,
    required this.color,
    required this.image,
  });
  static fromMapToObject(Map<String, dynamic> map) {
    return CatModel(
      name: map['name'],
      color: map['color'],
      image: map['image'],
    );
  }

  fromObjectToMap() {
    return {
      'name': name,
      'color': color,
      'image': image,
    };
  }
}
