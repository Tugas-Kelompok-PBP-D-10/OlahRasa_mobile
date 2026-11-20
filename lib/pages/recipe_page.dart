// lib/pages/recipe_page.dart
import 'package:flutter/material.dart';
import '../data/dummy_recipe.dart';
import '../models/recipe_models.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: dummyRecipes.length,
      itemBuilder: (context, index) {
        final Recipe item = dummyRecipes[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${item.prepTimeMinutes}m'),
            ),
            title: Text(item.title),
            subtitle: Text('${item.category} • Estimasi ${item.prepTimeMinutes} menit'),
            trailing: item.isSustainable
                ? const Chip(label: Text('Sustainable'))
                : null,
          ),
        );
      },
    );
  }
}