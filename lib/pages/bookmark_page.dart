import 'package:flutter/material.dart';
import '../data/dummy_bookmark.dart';
import '../models/recipe_models.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: dummyBookmarks.length,
      itemBuilder: (context, index) {
        final Recipe item = dummyBookmarks[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${item.prepTimeMinutes}m'),
            ),
            title: Text(item.title),
            subtitle: Text('${item.category} • Estimasi ${item.prepTimeMinutes} menit'),
            trailing: const Chip(
              avatar: Icon(Icons.bookmark, size: 18),
              label: Text('Bookmarked'),
            ),
          ),
        );
      },
    );
  }
}
