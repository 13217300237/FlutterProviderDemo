import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:test001/page/vm/foo_model.dart';

class FooControlPanel extends StatefulWidget {
  const FooControlPanel({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FooControlPanelState();
  }
}

class FooControlPanelState extends State<FooControlPanel> {
  double min = 20;
  double max = 200;

  @override
  Widget build(BuildContext context) {
    FooModel model = context.watch<FooModel>();

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
