import 'package:flutter/material.dart';
import 'package:untitled02/app/my_app.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
final NavigatorObserver navObserver = NavigatorObserver();

class RouteNames {}

class AppRouter{
  static Route? onGenerateRoute(RouteSettings routeSettings,){
    switch (routeSettings.name){
      default: return _routeTo(
        () => const MyHomePage(),
      );
    }
  }

  static Route? _routeTo(Widget Function() widgetBuilder,){
    return MaterialPageRoute(builder: (_,) => widgetBuilder(),);
  }
}
