import 'package:flutter/cupertino.dart';

import 'foo_model.dart';

class FooModelProvider extends InheritedWidget {
  final FooModel fooModel;

  static FooModel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FooModelProvider>()!
        .fooModel;
  }

  const FooModelProvider(
      {required Widget child, required this.fooModel, Key? key})
      : super(child: child, key: key);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
