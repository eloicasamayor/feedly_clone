import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({
    required WidgetBuilder builder,
    required RouteSettings? settings,
  }) : super(
          builder: builder,
          settings: settings,
        );
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.arguments != null) {
      final _arguments = settings.arguments as Map<String, bool>;
      if (_arguments['forward'] == true) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      } else {
        return SlideTransition(
          position: Tween(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }
    } else {
      return buildTransitions(context, animation, secondaryAnimation, child);
    }
  }
}
