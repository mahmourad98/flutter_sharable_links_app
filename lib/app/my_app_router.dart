import 'package:flutter/material.dart';
import 'package:untitled02/app/my_app.dart';
import 'package:untitled02/core/layers/presentation/copy_and_paste_link_page/copy_and_paste_link_view.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
final NavigatorObserver navObserver = NavigatorObserver();

class RouteNames {
  static const String copyAndPastePage = 'copy-and-paste';
}

class AppRouter{
  static Route? onGenerateRoute(RouteSettings routeSettings,){
    switch (routeSettings.name){
      case RouteNames.copyAndPastePage:
        return _routeTo(
          () => const CopyAndPasteLinkPage(),
        );
      default: return _routeTo(
        () => const MyHomePage(),
      );
    }
  }

  static Route? _routeTo(Widget Function() widgetBuilder,){
    return MaterialPageRoute(builder: (_,) => widgetBuilder(),);
  }
}
