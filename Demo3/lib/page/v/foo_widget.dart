import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test001/page/vm/foo_model.dart';
import 'package:test001/provider/foo_model_provider.dart';

class Foo extends StatelessWidget {
  const Foo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FooModel? model = context.watch<FooModel>();
    if (model == null) {
      return const SizedBox();
    }
    debugPrint("foo build");
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
