import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:test001/page/vm/foo_model.dart';

class Foo extends StatelessWidget {
  const Foo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FooModel model = context.watch<FooModel>();

    return Card(
        color: Colors.amber,
        elevation: model.hasElevation ? 10 : 0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Transform.rotate(
              angle: model.angle, child: FlutterLogo(size: model.size)),
        ));
  }
}