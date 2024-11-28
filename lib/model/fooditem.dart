class FoodItem {
  final String id;
  final String name;
  final String thumbnail;

  FoodItem({required this.id, required this.name, required this.thumbnail});

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
    );
  }
}
