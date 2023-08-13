import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test001/page/vm/foo_model.dart';
import 'package:test001/provider/foo_model_provider.dart';

class FooControlPanel extends StatelessWidget {
  const FooControlPanel({Key? key}) : super(key: key);

  final double min = 20;
  final double max = 200;

  @override
  Widget build(BuildContext context) {
    FooModel? model = context.watch<FooModel>();

    if (model == null) {
      return const SizedBox();
    }
    debugPrint("fooController  build");
    return Card(
      color: Colors.amberAccent,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("hasElevation:"),
                Switch(
                    value: model.hasElevation,
                    onChanged: (v) {
                      model.hasElevation = v;
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Size:"),
                Slider(
                  min: min,
                  max: max,
                  onChanged: (double value) {
                    model.size = value;
                  },
                  value: model.size,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("angle:"),
                Slider(
                  min: min,
                  max: max,
                  activeColor: Colors.black,
                  onChanged: (double value) {
                    model.angle = value;
                  },
                  value: model.angle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
