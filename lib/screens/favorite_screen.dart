import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_testing_1/provider/favorite_provider.dart';
import 'package:provider_testing_1/screens/favorites_list.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<int> favoritedItems = [];
  @override
  Widget build(BuildContext context) {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite app'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FavoritesList()));
              },
              icon: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favoriteProvider.numbers.length,
              itemBuilder: (context, index) {
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
            ),
          ),
        ],
      ),
    );
  }
}
