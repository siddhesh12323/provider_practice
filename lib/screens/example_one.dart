import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_testing_1/provider/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    //final exampleOneProvider =
        //Provider.of<ExampleOneProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiProvider'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (value1) {
                  value.setValue(value1);
                });
          }),
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                    child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color:
                          Colors.green.withOpacity(value.value)),
                  child: Center(child: Text('Container 1')),
                )),
                Expanded(
                    child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(value.value)),
                  child: Center(child: Text('Container 2')),
                )),
              ],
            );
          })
        ],
      ),
    );
  }
}
