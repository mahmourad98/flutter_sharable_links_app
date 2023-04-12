import 'package:flutter/material.dart';
import 'package:untitled02/app/my_app.dart';
import 'package:untitled02/core/layers/presentation/copy_and_paste_link_page/copy_and_paste_link_view.dart';
import 'package:untitled02/core/layers/presentation/recieve_shared_content_page/recieve_shared_content_view.dart';
import 'package:untitled02/core/layers/presentation/sharing_text_page/sharing_text_view.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
final NavigatorObserver navObserver = NavigatorObserver();

class RouteNames {
  static const String copyAndPastePage = 'copy-and-paste';
  static const String shareTextPage = 'share-text';
  static const String receiveSharedContent = 'receive-shared-content';
}

class AppRouter{
  static Route? onGenerateRoute(RouteSettings routeSettings,){
    switch (routeSettings.name){
      case RouteNames.copyAndPastePage:
        return _routeTo(
          () => const CopyAndPasteLinkPage(),
        );
      case RouteNames.shareTextPage:
        return _routeTo(
          () => const SharingTextView(),
        );
      case RouteNames.receiveSharedContent:
        return _routeTo(
          () => ReceiveSharedContentView(args: (routeSettings.arguments as ReceiveSharedContentViewArgs),),
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

class ReceiveSharedContentViewArgs {
  final List<Uri> uris;
  const ReceiveSharedContentViewArgs(this.uris,);
}