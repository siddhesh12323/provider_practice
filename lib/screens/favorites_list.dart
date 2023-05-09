import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorite_provider.dart';

class FavoritesList extends StatefulWidget {
  const FavoritesList({super.key});

  @override
  State<FavoritesList> createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  
  @override
  Widget build(BuildContext context) {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: Text('Favorites List')),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return Consumer<FavoriteProvider>(
              builder: (context, value, child) {
                return ListTile(
                  onTap: () {
                    if (value.favoritedItems.contains(value.numbers[index])) {
                          value.removeItem(value.numbers[index]);
                        } else {
                          value.addItem(value.numbers[index]);
                        }
                  },
                title: Text('Item ${value.numbers[index]}'),
                trailing: Icon(value.favoritedItems.contains(value.numbers[index])
                    ? Icons.favorite
                    : Icons.favorite_outline),
              );
              },             
            );
          },
          itemCount: favoriteProvider.favoritedItems.length,))
        ],
      ),
    );
  }
}
