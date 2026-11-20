import '../models/recipe_models.dart';
import 'dummy_recipe.dart';

final List<Recipe> dummyBookmarks = [
  dummyRecipes.firstWhere((r) => r.id == 1),
];