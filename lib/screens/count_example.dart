import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_testing_1/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Count Example')),
      body: Center(
          child: Consumer<CountProvider>(builder: (context, value, child) {
        return Text(
          value.count.toString(),
          style: TextStyle(fontSize: 30),
        );
      })),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            countProvider.setCount();
          },
          child: Icon(Icons.add)),
    );
  }
}
