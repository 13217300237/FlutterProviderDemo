import 'package:flutter/material.dart';
import 'package:test001/page/v/foo_controller_widget.dart';
import 'package:test001/page/v/foo_widget.dart';
import 'package:test001/page/vm/foo_model.dart';
import 'package:test001/page/vm/foo_model_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FooModelProvider(
      fooModel: FooModel(),
      child: MaterialApp(
          title: 'Provider Demo',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const MyHomePage(title: 'Provider Demo')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        color: Colors.black12,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Foo(),
              FooControlPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
