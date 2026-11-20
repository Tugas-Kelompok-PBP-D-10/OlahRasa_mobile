
class Recipe {
  final int id;
  final String title;
  final String category;
  final int prepTimeMinutes;
  final bool isSustainable;

  const Recipe({
    required this.id,
    required this.title,
    required this.category,
    required this.prepTimeMinutes,
    required this.isSustainable,
  });
}

