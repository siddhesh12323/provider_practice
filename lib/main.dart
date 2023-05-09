import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_testing_1/provider/count_provider.dart';
import 'package:provider_testing_1/provider/example_one_provider.dart';
import 'package:provider_testing_1/provider/favorite_provider.dart';
import 'package:provider_testing_1/screens/example_one.dart';
import 'package:provider_testing_1/screens/favorite_screen.dart';
import 'screens/count_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      // create: (_) => CountProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Testing',
        theme: ThemeData(useMaterial3: true),
        home: const FavoriteScreen(),
      ),
    );
  }
}