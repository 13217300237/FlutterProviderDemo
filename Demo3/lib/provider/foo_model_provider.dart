import 'package:flutter/cupertino.dart';

class ChangeNotifyProvider<T extends Listenable> extends StatefulWidget {
  final T Function() create;
  final Widget child;

  const ChangeNotifyProvider({
    Key? key,
    required this.create,
    required this.child,
  }) : super(key: key);

  @override
  State<ChangeNotifyProvider> createState() {
    return _FooModelProviderState<T>();
  }

  static T? of<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedWidget<T>>()
        ?.model;
  }
}

class _FooModelProviderState<T extends Listenable>
    extends State<ChangeNotifyProvider<T>> {
  late T model;

  @override
  void initState() {
    super.initState();
    model = widget.create();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: model,
      builder: (BuildContext context, Widget? child) => _InheritedWidget(
        model: model,
        child: widget.child,
      ),
    );
  }
}

class _InheritedWidget<T> extends InheritedWidget {
  final T model;

  const _InheritedWidget({
    required Widget child,
    required this.model,
    Key? key,
  }) : super(
          child: child,
          key: key,
        );

  ///
  /// 在 FooModelProvider 发生重建的前提下，是否通知到 使用到当前InheritedWidget实现类的 子Widget
  ///
  /// 注意，这里有一个大前提，就是 它自身要发生重建，由新的替换旧的，所以这里有一个入参 oldWidget
  ///
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    debugPrint(
        "updateShouldNotify 执行  ${oldWidget.runtimeType}  | ${oldWidget.hashCode} -> $hashCode");
    return true;
  }
}

extension ContextProviderExt on BuildContext {
  watch<T extends Listenable>() {
    T? model = ChangeNotifyProvider.of<T>(this);
    return model;
  }
}
